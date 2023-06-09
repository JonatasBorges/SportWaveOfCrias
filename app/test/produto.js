const Produto = require('../models/produto');

async function cadastrar() {
    const produto = new Produto({
        nome: 'tesnome',
        descricao: 'descricao',
        marca: 'marca',
        modelo: 'modelo',
        preco: 12.50,
        esporte: 'Surf'
    });

    try {
        await produto.cadastrar();
        console.log(`Novo produto criado com ID: ${produto.id}`);
    } catch (error) {
        console.error('Erro ao criar produto:', error);
    }
}

async function consultar() {
    try {
        const produtos = await Produto.listarTodos();
        console.log(produtos);
    } catch (error) {
        console.error('Erro ao listar produtos:', error);
    }
}

consultar();