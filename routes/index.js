var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Login' });
});
/* GET cadastro page */
router.get('/cadastro', function(req,res,next) {
  res.render('cadastro',{title: 'Cadastro'});
});

module.exports = router;
