package main

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/go-playground/validator/v10"
	"gopkg.in/mgo.v2"
	"gopkg.in/mgo.v2/bson"
	"os"
	"strconv"
	"xorm.io/xorm"
)

type position struct {
	Title      string `json:"title" validate:"required" xorm:"title"`
	Department string `json:"department" validate:"required" xorm:"department"`
}
type Employee struct {
	Id       int64    `json:"id"`
	Email    string   `json:"email" validate:"required,email" xorm:"email"`
	Mobile   string   `json:"mobile" validate:"required,numeric" xorm:"mobile"`
	Position position `json:"position" validate:"required,dive"`
}

var v *validator.Validate
var e *xorm.Engine
var c *mgo.Collection

func main() {
	g := gin.New()
	v = validator.New()
	host := fmt.Sprintf("%s:%s", os.Getenv("mongo_host"), os.Getenv("port"))
	m, errDB := mgo.Dial(host)
	db := m.DB(os.Getenv("db"))
	c = db.C(os.Getenv("collection"))
	if errDB != nil {
		panic(errDB.Error())
	}

	g.GET("/employee/:id", get)
	g.GET("/employees", getall)
	g.POST("/employee/:id", post)
	g.PUT("/employee/:id", put)
	g.DELETE("/employee/:id", delete)

	g.Run(":8080")

}

func getall(ctx *gin.Context) {
	var employees []Employee
	if err := c.Find(bson.M{}).All(&employees); err != nil {
		ctx.JSON(500, map[string]string{
			"error": err.Error(),
		})
		return
	}
	ctx.JSON(200, map[string]interface{}{
		"error":     "",
		"employees": employees,
	})
}

func post(ctx *gin.Context) {
	var employee = &Employee{}
	if err := ctx.BindJSON(employee); err != nil {
		ctx.JSON(400, map[string]string{
			"error": err.Error(),
		})
		return
	}
	id, err := strconv.Atoi(ctx.Param("id"))
	if err != nil {
		ctx.JSON(400, map[string]string{
			"error": err.Error(),
		})
		return
	}
	employee.Id = int64(id)
	if err := v.Struct(employee); err != nil {
		ctx.JSON(400, map[string]string{
			"error": err.Error(),
		})
		return
	}
	if err := c.Insert(employee); err != nil {
		ctx.JSON(500, map[string]string{
			"error": err.Error(),
		})
		return
	}
	ctx.JSON(200, map[string]string{
		"error": "",
	})
}

func get(ctx *gin.Context) {
	id, err := strconv.Atoi(ctx.Param("id"))
	if err != nil {
		ctx.JSON(400, map[string]string{
			"error": err.Error(),
		})
		return
	}
	var employee = &Employee{}
	if err := c.Find(bson.M{"id": id}).One(employee); err != nil {
		ctx.JSON(500, map[string]string{
			"error": err.Error(),
		})
		return
	}
	ctx.JSON(200, map[string]interface{}{
		"error":    "",
		"employee": employee,
	})
}

func delete(ctx *gin.Context) {
	id, err := strconv.Atoi(ctx.Param("id"))
	if err != nil {
		ctx.JSON(400, map[string]string{
			"error": err.Error(),
		})
		return
	}
	var employee = &Employee{}
	employee.Id = int64(id)
	if err := c.Remove(bson.M{"id": int64(id)}); err != nil {
		ctx.JSON(400, map[string]string{
			"error": "xx: " + err.Error(),
		})
		return
	}
	ctx.JSON(200, map[string]string{
		"error": "",
	})
}

func put(ctx *gin.Context) {
	var employee = &Employee{}
	if err := ctx.BindJSON(employee); err != nil {
		ctx.JSON(400, map[string]string{
			"error": err.Error(),
		})
		return
	}
	id, err := strconv.Atoi(ctx.Param("id"))
	if err != nil {
		ctx.JSON(400, map[string]string{
			"error": err.Error(),
		})
		return
	}
	employee.Id = int64(id)
	if err := ctx.BindJSON(employee); err != nil {
		ctx.JSON(400, map[string]string{
			"error": err.Error(),
		})
		return
	}
	if err := v.Struct(employee); err != nil {
		ctx.JSON(400, map[string]string{
			"error": err.Error(),
		})
		return
	}
	// update to database
	if err := c.Update(&Employee{Id: int64(id)}, employee); err != nil {
		ctx.JSON(400, map[string]string{
			"error": err.Error(),
		})
		return
	}
	ctx.JSON(200, map[string]string{
		"error": "",
	})
}
