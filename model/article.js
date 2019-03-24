const db = require('./db')

function Article(article){
	this.id = article.id
	this.title = article.title
	this.userId = article.userId
	this.classifyId = article.classifyId
	this.content = article.content
	this.ctime = article.ctime,
	this.img = article.img,
	this.sintro = article.sintro
}


Article.queryArticleInfo = function(id,callback){  
	let sqlStr = 'SELECT a.ctime,a.sintro,u.avator,a.content,a.title,c.name as classify,u.username,count(cl.id) as count FROM article a INNER JOIN (classify c,`user` u,collect cl) ON a.userid=u.id AND a.classifyid=c.id AND cl.articleid=a.id WHERE a.id=?'
	db.query(sqlStr,[id],(err,data)=>{
		if (err) {
			return callback(err)
		}
		callback(err,data)
	})
}

Article.articleLength = function(article,callback){
	let params = []
	let sqlStr = 'SELECT COUNT(0) as count from article WHERE 1=1'
	if (article.userId) {
		sqlStr+=' and userid=?'
		params.push(article.userId)
	}
	if (article.classifyId) {
		sqlStr+=' and classifyid=?'
		params.push(article.classifyId)
	}
	db.query(sqlStr,params,(err,data)=>{
		if (err) {
			return callback(err)
		}
		callback(err,data)
	})
}

Article.recomend = function(num,callback){
	let sqlStr = 'SELECT ac.*,count(c.id) as count from article ac left JOIN collect c ON c.articleid=ac.id GROUP BY ac.id ORDER BY count DESC LIMIT 0,?'
	db.query(sqlStr,[num],(err,data)=>{
		if(err){
			return callback(err)
		}
		callback(err,data)
	})
}

Article.queryArticles = function(article,page,callback){
	let params = []
	let sqlStr = 'SELECT u.username,u.avator,c.name,ac.* FROM article ac INNER JOIN (`user` u,classify c) ON u.id=ac.userid AND ac.classifyid=c.id where 1=1'
	if (article.classifyId) {
		sqlStr+=' AND classifyid=?'
		params.push(article.classifyId)
	}
	sqlStr+=' limit ?,?'
	params.push((page.page-1)*page.length)
	params.push(page.length)
	db.query(sqlStr,params,(err,data)=>{
		if (err) {
			return callback(err)
		}
		callback(err,data)
	})
}

Article.classifyInfo = function(callback){
	let sqlStr = 'select c.name,count(0) as value from article ac inner join classify c on c.id = ac.classifyid group by classifyid'
	db.query(sqlStr,(err,data)=>{
		if (err) {
			return callback(err)
		}
		callback(err,data)
	})
}

Article.queryUser = function(userId,page,callback){
	let params = []
	let sqlStr = 'select * from article where userid=? '
	params.push(userId)
	sqlStr+='limit ?,?'
	params.push((page.page-1)*page.length)
	params.push(page.length)
	db.query(sqlStr,params,(err,data)=>{
		if (err) {
			return callback(err)
		}
		callback(err,data)
	})
}
	

Article.getUpdate = function(num,callback){
	let sqlStr = 'SELECT ac.* from  article ac ORDER BY ac.ctime DESC LIMIT 0,?'
	db.query(sqlStr,[num],(err,data)=>{
		if(err){
			return callback(err)
		}
		callback(err,data)
	})
}	



Article.searchArticle = function(keyword,page,callback){
	let params = []
	let title = '%'+keyword+'%'
	let sqlStr = 'SELECT ac.*,u.username,u.avator FROM article ac INNER JOIN `user` u ON ac.userid=u.id WHERE u.username = ? OR ac.title LIKE ? '
	params.push(keyword)
	params.push(title)
	sqlStr+='limit ?,?'
	params.push((page.page-1)*page.length)
	params.push(page.length)
	db.query(sqlStr,params,(err,data)=>{
		if (err) {
			return callback(err)
		}
		callback(err,data)
	})
	
}

Article.addArticle = function(article,callback){
	let sqlStr = 'insert into article (id,userid,ctime,classifyid,content,title,img,sintro) values(null,?,?,?,?,?,?,?)'
	db.query(sqlStr,[article.userId,article.ctime,article.classifyId,article.content,article.title,article.img,article.sintro],(err,data)=>{
		if (err) {
			return callback(err)
		}
		callback(err,data)
	})
}

Article.deleteArticle = function(id,callback){
	let sqlStr = 'delete from article where id=?'
	db.query(sqlStr,[id],(err,data)=>{
		if (err){
			return callback(err)
		}
		callback(err,data)
	})
}


module.exports = Article