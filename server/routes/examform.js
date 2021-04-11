var routes = require('express').Router();

var {insertExamForm,UpdateStatus,getExamforms,getExamFormByStdId,insertSubjects,getExamformswithsubj,getExamFormwithsubByStdId,getExamFormByDeptId} = require('../controller/examform')
routes.get('/', getExamforms)
routes.get('/subject', getExamformswithsubj)
routes.get('/subject/:id', getExamFormwithsubByStdId)
routes.get('/dept/:id', getExamFormByDeptId)
routes.get('/:id', getExamFormByStdId)
routes.post('/', insertExamForm)
routes.post('/subject', insertSubjects)
routes.put('/updatestatus/:formid',UpdateStatus);


module.exports = routes;