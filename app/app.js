var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var produtoRouter = require('./routes/produto');

var expressLayouts = require('express-ejs-layouts');
var app = express();
const port = 5000;
app.use(expressLayouts);
app.set('layout', './layouts/base');

// view engine setup 
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/produtos', produtoRouter);

app.get('/dada', (req, res) => {
  res.render('layouts/index')
})
 
app.listen(port, () => console.info(`App listening on port ${port}`))

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  if (err.status === 404) {
    res.render('404');
  } else {
    res.render('error');
  }
});

module.exports = app;
