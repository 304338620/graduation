const db = require('./db')

function User(user){
	this.id = user.id
	this.avator = user.avator
	this.sex = user.sex
	this.birth = user.birth
	this.phone = user.phone
	this.intro = user.intro
	this.password = user.password
	this.userName = user.userName
	this.addr = user.addr
}

User.addUser = function(user,callback){
	let sqlStr = 'INSERT INTO `user` (id,username,phone,sex,birth,avator,password,intro,addr) values(null,?,?,null,null,null,?,null,null)'
	db.query(sqlStr,[user.userName,user.phone,user.password],(err,data)=>{
		if (err) {
			return callback(err)
		}
		callback(err,data)
	})
}

User.updateUser = function(user,callback){
	let sqlStr = 'update user set '
	let params = []
	if (user.userName){
		sqlStr+='username=? '
		params.push(userName)
	}
	if(user.phone){
		sqlStr+='phone=? '
		params.push(phone)
	}
	if(user.sex){
		sqlStr+='sex=? '
		params.push(sex)
	}
	if(user.birth){
		sqlStr+='birth=? '
		params.push(age)
	}
	if(user.intro){
		sqlStr+='intro=? '
		params.push(age)
	}
	if(user.addr){
		sqlStr+='addr=? '
		params.push(age)
	}
	if(user.avator){
		sqlStr+='avator=? '
		params.push(avator)
	}
	sql+='where id=?'
	params.push(user.id)
	db.query(sqlStr,params,(err,data)=>{
		if(err){
			return callback(err)
		}
		callback(err,data)
	})
}

User.updatePassword=function(user,callback){
	let sqlStr = 'update user set password=? where id=? '
	db.query(sqlStr,[user.password,user.id],(err,data)=>{
		if(err){
			return callback(err)
		}
		callback(err,data)
	})
}

User.queryUser=function(id,callback){
	let sqlStr = 'SELECT * FROM `user` WHERE id=?'
	db.query(sqlStr,[id],(err,data)=>{
		if(err){
			return callback(err)
		}
		callback(err,data)
	})
}

User.countUser = function(callback){
	let sqlStr = 'select count(0) as count from user'
	db.query(sqlStr,(err,data)=>{
		if(err){
			return callback(err)
		}
		callback(err,data)
	})
}

User.queryUserByPhone = function(phone,callback){
	let sqlStr = 'select * from user where phone=?'
	db.query(sqlStr,[phone],(err,data)=>{
		if(err){
			return callback(err)
		}
		callback(err,data)
	})
}

User.queryPhone = function(phone,callback){
	let sqlStr = 'select id from user where phone=?'
	db.query(sqlStr,[phone],(err,data)=>{
		if(err){
			return callback(err)
		}
		callback(err,data)
	})
}

User.login = function(user,callback){
	let sqlStr = 'select id from user where phone=? and password=?'
	db.query(sqlStr,[user.phone,user.password],(err,data)=>{
		if(err){
			return callback(err)
		}
		callback(err,data)
	})
}

module.exports = User