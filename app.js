var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var classify = require('./routes/classify.js')
var user = require('./routes/user.js')
var reply = require('./routes/reply.js')
var comment = require('./routes/comment.js')
var article = require('./routes/article.js')
var admin = require('./routes/admin.js')
var collect = require('./routes/collect.js')

//var indexRouter = require('./routes/index');
//var usersRouter = require('./routes/users');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
const cors = require("cors");
//2:配置cors
app.use(cors({
	origin: ["http://127.0.0.1:8080",
		"http://localhost:8080"],//允许列表
	credentials: true   //是否验证
}))
//3:加载第三方模块express-session
const session = require("express-session");
//4:配置模块
app.use(session({
	secret: "128位随机字符串", //安全令牌--计算sessionID
	resave: false,   //请求保存  无需每次重新设置
	saveUninitialized: true, //初始化
	cookie: {
		maxAge: 1000 * 60 * 60 * 24  //session保存时间  1天
	}
}))
//app.use('/', indexRouter);
//app.use('/users', usersRouter);

app.use('/classify',classify)
app.use('/user',user)
app.use('/reply',reply)
app.use('/comment',comment)
app.use('/article',article)
app.use('/admin',admin)
app.use('/collect',collect)

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
