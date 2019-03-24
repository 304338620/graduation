var express = require('express'),
    router = express.Router(),
    path = require('path'),
   	Admin = require('../model/admin.js'),
   	fs = require('fs')

// function checkLogin(req,res,callback){
// 	if(!req.session.admin){
// 		res.send({'error':400,'message':'未登录！'})
// 	}
// 	callback()
// } 

// router.get('/queryAdmin',checkLogin)
router.get('/queryAdmin',(req,res)=>{
	console.log(req.session)
	if(!req.session.admin){
		return res.send({'error':400,'message':'未登录！'})
	}
	let phone = req.query.phone
	Admin.queryAdmin(phone,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

// router.get('/updateAdmin',checkLogin)
router.post('/updateAdmin',(req,res)=>{
	if(!req.session.admin){
		return res.send({'error':400,'message':'未登录！'})
	}
	let admin = new Admin({
		phone:req.body.phone,
		password:req.body.password,
		avator:req.body.avator?req.body.avator:'',
		name:req.body.name
	})
	Admin.updateAdmin(admin,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send({'success':true})
	})
})

router.post('/adminLogin',(req,res)=>{
	let admin = new Admin({
		phone:req.body.phone,
		password:req.body.password
	})
	let tel = req.body.phone
	Admin.query(tel,(err,data)=>{
		if(err){
			return res.send({'error':403,'message':'数据库异常'})
		}
		if(!data.length){
			// console.log(data)
			return res.send({'error':401,'message':'该用户不存在，请联系管理员添加用户'})
		}
		Admin.login(admin,(err,data)=>{
			if(err){
				return res.send({'error':403,'message':'数据库异常'})
			}
			if(!data.length){
				return res.send({'error':404,'message':'手机号或者密码错误'})
			}
			req.session.admin = true
			res.send({'success':'true'})
		})
	})
	
})


router.get('/exit',(req,res)=>{
	console.log(req.sessions)
	req.session.admin = 'null'
	res.send({'success':true})
})


module.exports = router