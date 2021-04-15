var routes = require('express').Router();

var {getStudent,insertStudent,getStudentById,updateStudent,loginStudent,getStudentDeptId,disable} = require('../controller/student')
routes.get('/', getStudent)
routes.put('/disable/', disable)
routes.post('/', insertStudent)

routes.post('/login', loginStudent)

routes.get('/:id', getStudentById)
routes.get('/dept/:id', getStudentDeptId)
routes.put('/update/:id', updateStudent)

module.exports = routes;    