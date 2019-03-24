var express = require('express'),
    router = express.Router(),
    path = require('path'),
   	Classify = require('../model/classify.js'),
	Page = require('../model/page.js')
    
//function checkAdminLogin(req, res, next) {
//  if (!req.session.admin) {
//      return res.send({ "error": 400, "message": "未登录！" });
//  }
//  next();
//}

router.get('/queryClassify',(req,res)=>{
	let page = new Page({
		length:req.query.length?req.query.length:10,
		page:req.query.page?req.query.page:1
	})
	Classify.queryClassify(page,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		let obj = {
			total:data.length,
			rows:data
		}
		res.send(obj)
	})
})

router.get('/queryClassifyById',(req,res)=>{
	let id = req.query.id
	Classify.queryClassifyById(id,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})
//router.get('/queryArticleByClassify',function(req,res){
//	let classifyId = parseInt(req.query.classifyId)
//	Article.queryClassify(classifyId,(err,data)=>{
//		if (err) {
//			console.log(err)
//			return res.send({'error':403,'message':'数据库异常'})
//		}
//		res.send(data)
//	})
//})

router.post('/addClassify',(req,res)=>{
	let classify = new Classify({
		classifyName:req.body.classifyName
	})
	if(!classify.classifyName){
		return res.send({'error':402,'message':'请输入分类名称'})
	}
	Classify.addClassify(classify,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}else if(data.affectedRows<=0){
			return res.send({'error':404,'message':'Not found'})
		}
		res.send({ "success": true })
	})
})

router.get('/queryClassifyCount',(req,res)=>{
	
	Classify.countClassify((err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

router.post('/updateClassify',(req,res)=>{
	let classify = new Classify({
		id:parseInt(req.body.id),
		classifyName:req.body.classifyName
	})
	Classify.updateClassify(classify,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}else if(data.affectedRows<=0){
			return res.send({'error':404,'message':'Not found'})
		}
		res.send({ "success": true })
	})
})

router.get('/deleteClassify',(req,res)=>{
	let id =parseInt(req.query.id)
	Classify.deleteClassify(id,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}else if(data.affectedRows<=0){
			return res.send({'error':404,'message':'Not found'})
		}
		res.send({ "success": true })
	})
})

module.exports = router