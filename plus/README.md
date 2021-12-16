# Which Services used
* Golang
* MongoDB

# How To Start 
`docker-compose up`

# Default Endpoints
## Add Employee
`curl -XPOST -H "Content-Type: application/xml" -d '{"email":"aaa@bbb.com", "mobile":"0912345678", "position": {"title": "manager", "department": "c1"}}' http://127.0.0.1:8080/employee/:id`
## Update Employee
`curl -XPUT -H "Content-Type: application/xml" -d '{"email":"aaa@bbb.com", "mobile":"0912345678", "position": {"title": "manager", "department": "c1"}}  http://127.0.0.1:8080/employee/:id`
## Get All Employees
`curl http://127.0.0.1:8080/employees`
## Delete Employee 
`curl -XDELETE http://127.0.0.1:8080/employee/:id`
## Get Employee
`curl http://127.0.0.1:8080/employee/:id`

## How To Stop
`docker-compose down`

## @TODO
* Close mongo onnection after app down