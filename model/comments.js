const db = require('./db')

function Comment(comment){
	this.ctime = comment.ctime
	this.content = comment.content
	this.userId = comment.userId
	this.articleId = comment.articleId
	this.replyId = comment.replyId
	this.id = comment.id
}

Comment.queryArticleComments = function(articleId,page,callback){
	let sqlStr = 'select c.*,u.username,u.avator from comments c INNER JOIN `user` u ON c.userid=u.id where articleid=? '
	sqlStr+='limit ?,?'
	var params = []
	params.push(articleId)
	params.push((page.page-1)*page.length)
	params.push(page.length)
	db.query(sqlStr,params,(err,data)=>{
		if (err){
			return callback(err)
		}
		callback(err,data)
	})
}

Comment.addComment = function(comment,callback){
	let sqlStr = 'insert into comments (id,content,userid,articleid,ctime) values (null,?,?,?,?)'
	db.query(sqlStr,[comment.content,comment.userId,comment.articleId,comment.ctime],(err,data)=>{
		if (err){
			return callback(err)
		}
		callback(err,data)
	})
}

Comment.deleteComment = function(id,callback){
	let sqlStr = 'delete from comments where id=?'
	db.query(sqlStr,[id],(err,data)=>{
		if (err){
			return callback(err)
		}
		callback(err,data)
	})
}

Comment.update = function(num,callback){
	let sqlStr = 'SELECT c.* ,u.username from comments c INNER JOIN `user` u on c.userid=u.id ORDER BY c.ctime DESC limit 0,?'
	db.query(sqlStr,[num],(err,data)=>{
		if (err){
			return callback(err)
		}
		callback(err,data)
	})
}

Comment.queryUserComments = function(userId,page,callback){
	let sqlStr = 'select * from comments where userid=? '
	sqlStr+='limit ?,?'
	let params = [];
	params.push(userId)
	params.push((page.page-1)*page.length)
	params.push(page.length)
	db.query(sqlStr,params,(err,data)=>{
		if (err) {
			return callback(err)
		}
		callback(err,data)
	})
}

Comment.countComments = function(callback){
	let sqlStr = 'SELECT COUNT(0) as count FROM comments'
	db.query(sqlStr,(err,data)=>{
		if(err){
			return callback(err)
		}
		callback(err,data)
	})
}

Comment.queryComments = function(page,callback){
	let params = []
	let sqlStr = 'SELECT cm.*,u.username,ac.title FROM comments cm INNER JOIN(`user` u,article ac) ON cm.userid=u.id AND cm.articleid=ac.id limit ?,?'
	params.push((page.page-1)*page.length)
	params.push(page.length)
	db.query(sqlStr,params,(err,data)=>{
		if (err) {
			return callback(err)
		}
		callback(err,data)
	})
}

module.exports = Comment