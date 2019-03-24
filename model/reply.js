const db =require('./db')

function Reply(reply){
	this.ctime = reply.ctime,
	this.content = reply.content,
	this.userId = reply.userId,
	this.replyUser = reply.replyUser,
	this.commentId = reply.commentId
}

Reply.addReply = function(reply,callback){ 
	let sqlStr = 'insert into reply (id,commentid,content,ctime,userid,replyuser) values (null,?,?,?,?,?)'
	db.query(sqlStr,[reply.commentId,reply.content,reply.ctime,reply.userId,reply.replyUser],(err,data)=>{
		if (err) {
			return callback(err)
		}
		callback(err,data)
	})
}

Reply.deleteReply = function(id,callback){
	let sqlStr = 'delete from reply where id=?'
	db.query(sqlStr,[id],(err,data)=>{
		if (err) {
			return callback(err)
		}
		callback(err,data)
	})
}

Reply.queryReply = function(id,page,callback){
	let params = [];
	params.push(id)
	params.push((page.page-1)*page.length)
	params.push(page.length)
	let sqlStr = 'select r.*,u.username as author from reply r INNER JOIN `user` u ON u.id=r.userid where r.commentid=? limit ?,?'
	db.query(sqlStr,params,(err,data)=>{
		if (err) {
			return callback(err)
		}
		callback(err,data)
	})
}

module.exports = Reply