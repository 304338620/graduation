const db = require('./db.js')

function Collect(collect){
	this.id = collet.id,
	this.articleId = admin.articleId,
	this.userId = admin.userId
}


Collect.isCollect = function (collect,callback){
	let params = [];
	let sqlStr = 'select id from collect where userid=? and articleid=?';
	params.push(collect.userId);
	params.push(collect.articleId);
	db.query(sqlStr,params,(err,data)=>{
		if(err){
			return callback(err)
		}
		callback(err,data)
	})
}

Collect.addCollect = function (collect,callback){
	let params = [];
	let sqlStr = 'INSERT INTO collect (id,userid,articleid) VALUES(null,?,?)';
	params.push(collect.userId);
	params.push(collect.articleId);
	db.query(sqlStr,params,(err,data)=>{
		if(err){
			return callback(err)
		}
		callback(err,data)
	})
}

Collect.cancleCollect = function(id,callback){
	let sqlStr = 'delete from collect where id=?';
	db.query(sqlStr,[id],(err,data)=>{
		if(err){
			return callback(err)
		}
		callback(err,data)
	})
}

Collect.collectLength = function(articleId,callback){
	let sqlStr = 'select count(0) as count from collect where articleid=?';
	db.query(sqlStr,[articleId],(err,data)=>{
		if(err){
			return callback(err)
		}
		callback(err,data)
	})
}

Collect.userCollect = function(userid,callback){
	let sqlStr = 'SELECT ac.* FROM article ac INNER JOIN collect c ON c.articleid=ac.id WHERE c.userid=?'
	db.query(sqlStr,[userid],(err,data)=>{
		if(err){
			return callback(err)
		}
		callback(err,data)
	})
}

module.exports = Collect
