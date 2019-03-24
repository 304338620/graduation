var express = require('express'),
    router = express.Router(),
   	Collect = require('../model/collect.js')
   	
router.get('/addCollect',(req,res)=>{
	let collect = {
		userId:parseInt(req.query.userId),
		articleId:parseInt(req.query.articleId)
	}
	Collect.addCollect(collect,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		if(data.affectedRows>0){
			return res.send({'success':true})
		}
		res.send({'error':403,'message':'数据库异常'})
	})
})

router.get('/cancelCollect',(req,res)=>{
	let id = parseInt(req.query.id)
	Collect.cancleCollect(id,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send({'success':true})
	})
})

router.get('/collectLength',(req,res)=>{
	let articleId = parseInt(req.query.articleId)
	Collect.collectLength(articleId,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

router.get('/userCollect',(req,res)=>{
	let userId = parseInt(req.query.userId)
	Collect.userCollect(userId,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

router.get('/isCollect',(req,res)=>{
	let collect = {
		userId:parseInt(req.query.userId),
		articleId:parseInt(req.query.articleId)
	}
	Collect.isCollect(collect,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

module.exports = router