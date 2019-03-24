var express = require('express'),
    router = express.Router(),
    path = require('path'),
   	Comment = require('../model/comments.js'),
   	Page = require('../model/page.js')

// Date.prototype.Format = function (fmt) { 
//     var o = {
//         "M+": this.getMonth() + 1, //月份 
//         "d+": this.getDate(), //日 
//         "h+": this.getHours(), //小时 
//         "m+": this.getMinutes(), //分 
//         "s+": this.getSeconds(), //秒 
//         "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
//         "S": this.getMilliseconds() //毫秒 
//     };
//     if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
//     for (var k in o)
//     if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
//     return fmt;
// }

router.get('/queryComment',(req,res)=>{
	let articleId =parseInt(req.query.articleId)
	let page = new Page({
		length:req.query.length?parseInt(req.query.length):10,
		page:req.query.page?parseInt(req.query.page):1
	})
	Comment.queryArticleComments(articleId,page,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

// 获取最新评论
router.get('/update',(req,res)=>{
	let num = req.query.num?parseInt(req.query.num):6
	Comment.update(num,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

router.post('/addComment',(req,res)=>{
	let comment = {
		content:req.body.content,
		articleId:parseInt(req.body.articleId),
		userId:parseInt(req.body.userId),
		ctime:new Date().toLocaleString()
	}
	Comment.addComment(comment,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send({'success':true})
	})
})

router.get('/queryUserComment',(req,res)=>{
	let userId = req.query.userId;
	let page = new Page({
		length:req.query.length?parseInt(req.query.length):6,
		page:req.query.page?parseInt(req.query.page):1
	});
	Comment.queryUserComments(userId,page,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

router.get('/deleteComment',(req,res)=>{
	let id = parseInt(req.query.id)
	Comment.deleteComment(id,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send({'success':true})
	})
})

router.get('/countComment',(req,res)=>{
	Comment.countComments((err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})
 
router.get('/queryComments',(req,res)=>{
	let page = new Page({
		length:req.query.length?req.query.length:10,
		page:req.query.page?req.query.page:1
	})
	Comment.queryComments(page,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

module.exports = router