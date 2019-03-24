const db = require('./db.js')

function Classify(classify){
	this.id = classify.id
	this.classifyName = classify.classifyName
}

Classify.addClassify = function(classify,callback){
	let sqlStr = 'insert into classify (id,name) values(null,?)'
	db.query(sqlStr,[classify.classifyName],function(err,result){
		if (err) {
			return callback(err)
		}
		callback(err,result)
	})
}


Classify.queryClassify = function (page,callback) {
	let params = []
    var selectSql = 'SELECT c.*,COUNT(ac.classifyid) as count FROM classify c LEFT JOIN article ac ON c.id = ac.classifyid GROUP BY c.id limit ?,?'
	params.push((page.page-1)*page.length)
	params.push(page.length)
    db.query(selectSql,params, function (err, result) {
        if (err) {
            return callback(err);
        }
        var data = result;
        callback(err, data);
    })
}


Classify.updateClassify = function(classify,callback){
	let sqlStr = 'update classify set `name`=? where id=?'
	db.query(sqlStr,[classify.classifyName,classify.id],(err,result)=>{
		if (err) {
			return callback(err)			
		}
		callback(err,result)
	})
}

//Classify.updateClassify({
//	classifyName:'科技',
//	id:3
//},(err,data)=>{
//	if (err) {
//		return console.log(err)
//	}
//	console.log(data)
//})
//	
//Classify.queryClassify((err,data)=>{
//	if (err) {
//	console.log(err)
//}
//	console.log(data)
//})
Classify.queryClassifyById = function(id,callback){
	let sqlStr = 'select c.name from classify c where id=?'
	db.query(sqlStr,[id],(err,data)=>{
		if (err) {
			return callback(err)
		}
		callback(err,data)
	})
}

Classify.deleteClassify = function(id,callback){
	let sqlStr = 'delete from classify where id=?'
	db.query(sqlStr,[id],(err,data)=>{
		if (err){
			return callback(err)
		}
		callback(err,data)
	})
}


Classify.countClassify = function(callback){
	let sqlStr = 'select count(0) as count from classify'
	db.query(sqlStr,(err,result)=>{
		if (err) {
			return callback(err)
		}
		callback(err,result[0])
	})	
}

module.exports = Classify
