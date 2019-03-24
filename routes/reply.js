var express = require('express'),
    router = express.Router(),
    path = require('path'),
	Page = require('../model/page.js'),
   	Reply = require('../model/reply.js')
 
router.post('/addReply',(req,res)=>{
	let reply = {
		ctime:new Date().toLocaleString(),
		userId:parseInt(req.body.userId),
		commentId:parseInt(req.body.commentId),
		content:req.body.content,
		replyUser:req.body.replyUser
	}
	console.log(reply)
	Reply.addReply(reply,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send({'success':true})
	})
})

router.get('/deleteReply',(req,res)=>{
	let id = req.query.id
	Reply.deleteReply(id,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send({'success':true})
	})
})

router.get('/queryReply',(req,res)=>{
	let id = parseInt(req.query.commentId);
	let page = new Page({
		length:req.query.length?parseInt(req.query.length):10,
		page:req.query.page?parseInt(req.query.page):1
	})
	Reply.queryReply(id,page,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

module.exports = router