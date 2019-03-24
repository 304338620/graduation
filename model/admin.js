const db = require('./db.js')

function Admin(admin){
	this.id = admin.id,
	this.phone = admin.phone,
	this.password = admin.password,
	this.name = admin.name,
	this.avator = admin.avator
}

Admin.queryAdmin = function(phone,callback){
	let sqlStr = 'select * from admin where phone=?'
	db.query(sqlStr,[phone],(err,data)=>{
		if (err) {
			return callback(err)
		}
		callback(err,data)
	})
}

Admin.updateAdmin = function(admin,callback){
	let sqlStr = 'update admin set'
	let params = []
	if (admin.phone) {
		sqlStr+='phone=?'
		params.push(admin.phone)
	}
	if (admin.avator) {
		sqlStr+='avator=?'
		params.push(admin.avator)
	}
	if (admin.password) {
		sqlStr+='password=?'
		params.push(admin.avator)
	}
	if (admin.name) {
		sqlStr+='name=?'
		params.push(admin.name)
	}
	sqlStr+='where id=?'
	params.push(admin.id)
	db.query(sqlStr,params,(err,data)=>{
		if (err) {
			callback(err)
		}
		callback(err,data)
	})
}


Admin.query = function(phone,callback){
	let sqlStr = 'select id from admin where phone=?'
	db.query(sqlStr,[phone],(err,data)=>{
		if (err){
			return callback(err)
		}
		callback(err,data)
	})
}

Admin.login = function(admin,callback){
	let params = [],
	sqlStr = 'select id from admin where phone=? and password=?'
	params.push(admin.phone)
	params.push(admin.password)
	db.query(sqlStr,params,(err,data)=>{
		if (err) {
			return callback(err)
		}
		callback(err,data)
	})
}

module.exports = Admin
