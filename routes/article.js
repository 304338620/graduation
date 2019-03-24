var express = require('express'),
    router = express.Router(),
    path = require('path'),
    uuid = require('node-uuid'),
    formidable = require('formidable'),
   	Article = require('../model/article.js'),
   	Page = require('../model/page.js'),
   	fs = require('fs')
   	
Date.prototype.Format = function (fmt) { 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

router.post('/addArticle',(req,res)=>{
	// let article = {}
	let article = new Article({
		content:req.body.content,
		ctime:new Date().toLocaleString(),
		userId:req.body.userId,
		title:req.body.title,
		classifyId:req.body.classifyId,
		img:req.body.path,
		sintro:req.body.sintro?req.body.sintro:'暂无简介'
	})
	console.log(article)
	Article.addArticle(article,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send({'success':true})
	})
})

router.get('/recomend',(req,res)=>{
	let num = req.query.num?parseInt(req.query.num):2
	Article.recomend(num,(err,data)=>{
		if(err){
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

router.get('/deleteArticle',(req,res)=>{
	let id =parseInt(req.query.id)
	Article.deleteArticle(id,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}else if(data.affectedRows<=0){
			return res.send({'error':404,'message':'Not Found'})
		}
		res.send({'success':true})
	})
})

router.get('/classifyInfo',(req,res)=>{
	Article.classifyInfo((err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

router.get('/searchArticle',(req,res)=>{
	let page = new Page({
		length:req.query.length?req.query.length:10,
		page:req.query.page?req.query.page:1
	})
	let keyword = req.query.keyword
//	console.log(keyword)
	Article.searchArticle(keyword,page,(err,data)=>{
		if (err) {
			console.log(err)
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

router.get('/queryUser',(req,res)=>{
	let page = new Page({
		length:req.query.length?req.query.length:10,
		page:req.query.page?req.query.page:1
	})
	let userId = parseInt(req.query.userId)
	Article.queryUser(userId,page,(err,data)=>{
		if (err) {
			console.log(err)
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

router.get('/update',(req,res)=>{
	let num = req.query.num?parseInt(req.query.num):5
	Article.getUpdate(num,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

router.get('/queryArticle',(req,res)=>{
	let page = new Page({
		length:req.query.length?parseInt(req.query.length):10,
		page:req.query.page?req.query.page:1
	})
	let classifyId =req.query.classifyId? parseInt(req.query.classifyId):''
	console.log(classifyId)
	let article = new Article({
		classifyId:classifyId
	})
	
	Article.queryArticles(article,page,(err,data)=>{
		if (err) {
			console.log(err)
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

router.get('/articleLength',(req,res)=>{
	var classifyId = req.query.classifyId?req.query.classifyId:''
	var userId = req.query.userId?parseInt(req.query.userId):''
	var article = new Article({
		classifyId:classifyId,
		userId:userId
	})
	Article.articleLength(article,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

router.post('/uploadImg',(req,res)=>{
	form = new formidable.IncomingForm()
	form.keepExtensions=true
	form.maxFieldsSize = 10*1024*1024
	form.uploadDir = './public/static/img/'
	form.parse(req,(err,fileds,files)=>{
		if(err){
			return res.send('{errno:1,data:[]}')
		}
		let arr = files.uploadImg.type.split('/')
		let extendName = arr[arr.length-1]
		let oldpath = files.uploadImg.path
		let uid = uuid.v1()
		newPath = form.uploadDir+uid+'.'+extendName
		fs.rename(oldpath,newPath,(err)=>{
			if(err){
				return res.send({'errno':1,'data':[],'message':'图片保存失败'})
			}
			let imgPath = newPath.replace('./public/static','/static')
			res.send({'errno':0,'data':[imgPath]})
		})
		
	})
})

router.get('/info',(req,res)=>{
	let id = parseInt(req.query.id)
	Article.queryArticleInfo(id,(err,data)=>{
		if(err){
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

router.get('/delete',(req,res)=>{
	let pa = req.query.path
	let path = pa.replace('/staitc','./public/static')
	fs.unlink(path,(err)=>{
		if(err){
			return res.send({'errno':1,'message':'图片删除失败'})
		}
		res.send({'success':true})
	})
})

module.exports = router