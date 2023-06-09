var express = require('express');
var router = express.Router();

const produtoController = require('../controllers/produto');

router.get('/', produtoController.listarProdutos);

module.exports = router;
