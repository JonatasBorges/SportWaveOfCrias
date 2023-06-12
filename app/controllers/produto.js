const Produto = require('../models/produto');

class ProdutoController {
    static async listarProdutos(req, res) {
        try {
            const produtos = await Produto.listarTodos();
            console.log(produtos)
            res.render('produto/index', { produtos });
        } catch (error) {
            res.status(500).render('error', { message: 'Erro no servidor', error });
        }
    }

}

module.exports = ProdutoController;