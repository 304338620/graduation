var express = require('express'),
    router = express.Router(),
    path = require('path'),
    uuid = require('node-uuid'),
    formidable = require('formidable'),
   	User = require('../model/user.js'),
   	fs = require('fs'),
	crypto = require('crypto')
	
// let md5 = crypto.createHash('md5')
// let pwd =  md5.update('123456').digest('hex')
// console.log(pwd)


router.get('/check',(req,res)=>{
	console.log(req.session)
	if(!req.session.user){
		return res.send({'status':400,'message':'未登录'})
	}
	res.send({'login':true})
})

router.get('/exit',(req,res)=>{
	req.session.user = null
	res.send({'success':true})
})

router.post('/login',(req,res)=>{
	if(!req.body.phone || !req.body.password){
		return res.send({'error':200,'message':'表单不完整'})
	}
	let md5 = crypto.createHash('md5')
	let pwd = md5.update(req.body.password).digest('hex')
	
	let user = new User({
		phone:req.body.phone,
		password:pwd
	})
	let phone = req.body.phone
	User.queryPhone(phone,(err,data)=>{
		if(err){
			return res.send({'error':403,'message':'数据库异常'})
		}
		if(!data.length){
			return res.send({'error':401,'message':'该用户不存在，请注册后再尝试登陆'})
		}
		User.login(user,(err,data)=>{
			if(err){
				return res.send({'error':403,'message':'数据库异常'})
			}
			if(!data.length){
				return res.send({'error':404,'message':'手机号或者密码错误'})
			}
			req.session.user = true
			res.send({'success':'true','id':data})
		})
	})
})


router.get('/queryUser',(req,res)=>{
	if (!req.session.user) {
		return res.send({'error':400,'message':'未登录'})
	}
	let id = parseInt(req.query.id)
	User.queryUser(id,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

router.get('/queryUserByPhone',(req,res)=>{
	if (!req.session.user) {
		return res.send({'error':400,'message':'未登录'})
	}
	let phone = req.query.phone 
	console.log(phone)
	User.queryUserByPhone(phone,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

router.post('/updateUser',(req,res)=>{
	let avator=''
	let form = new formidable.IncomingForm()
	form.encoding = 'utf-8'
	form.uploadDir = "public/upload/avator"
	form.keepExtensions = true
	form.maxFieldsSize = 2 * 1024 * 1024
	form.parse(req,(err,fields,files)=>{
		let pic = files.avator
		console.log(pic)
		let picName = uuid.v1() + path.extname(pic.name)
		let avator = ''
		fs.rename(pic.path, 'public\\upload\\avator\\' + picName, function (err) {
            if (err) return res.send({ "error": 403, "message": "图片保存异常！" })
            avator+='/upload/avator/' + picName 
            let user = new User({
				userName:fields.userName,
				sex:fields.sex?fields.sex:'',
				age:fields.age?fields.age:'',
				phone:fields.phone,
				avator:avator
			})
            console.log(user)
            User.updateUser(user,(err,data)=>{
				if (err) {
					return res.send({'error':403,'message':'数据库异常'})
				}	
				res.send({'success':true})
			})
       })
	})
})

router.post('/register',(req,res)=>{
	if(!req.body.sPhone || !req.body.sPwd || !req.body.userName || !req.body.confirm){
		return res.send({'error':407,'message':'请完整填写表单'})
	}
	let phone = req.body.sPhone
	User.queryPhone(phone,(err,data)=>{
		if(err){
			return res.send({'error':403,'message':'数据库异常'})
		}
		if(data.length){
			return res.send({'error':406,'message':'此号已注册，请勿重复注册！'})
		}
		let md5 = crypto.createHash('md5')
		let pwd =  md5.update(req.body.sPwd).digest('hex')
		let user = new User({
			userName:req.body.userName,
			phone:phone,
			password:pwd
		}) 
		console.log(user)
		User.addUser(user,(err,data)=>{
			if(err){
				return res.send({'error':403,'message':'数据库异常'})
			}
			console.log(data)
			if(data.affectedRows>0){
				return res.send({'success':true})
			}
		})
	})
})

router.post('/addUser',(req,res)=>{
	let form = new formidable.IncomingForm()
	form.encoding = 'utf-8'
	form.uploadDir = "public/upload/avator"
	form.keepExtensions = true
	form.maxFieldsSize = 2 * 1024 * 1024
	form.parse(req,(err,fields,files)=>{
		let pic = files.avator
		console.log(pic)
		let picName = uuid.v1() + path.extname(pic.name)
		let avator = ''
		fs.rename(pic.path, 'public\\upload\\avator\\' + picName, function (err) {
            if (err) return res.send({ "error": 405, "message": "图片保存异常！" })
            avator+='/upload/avator/' + picName 
            let user = new User({
				userName:fields.userName,
				sex:fields.sex?fields.sex:'',
				age:fields.age?fields.age:'',
				phone:fields.phone,
				avator:avator,
				password:fields.password
			})
            User.addUser(user,(err,data)=>{
				if (err) {
					return res.send({'error':403,'message':'数据库异常'})
				}	
				res.send({'success':true})
			})
       })
	})
})

router.post('/updatePassword',(req,res)=>{
	let user = new User({
		id:req.body.id,
		password:req.body.password
	})
	User.updatePassword(user,(err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send({'success':true})
	})
})

router.get('/userCount',(req,res)=>{
	User.countUser((err,data)=>{
		if (err) {
			return res.send({'error':403,'message':'数据库异常'})
		}
		res.send(data)
	})
})

module.exports = router
