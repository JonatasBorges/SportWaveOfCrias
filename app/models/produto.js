const db = require('../config/db');

// EVERY TABLE GET A CLASS
class Produto {
    constructor({
        id,
        nome,
        descricao,
        marca,
        modelo,
        preco,
        capa,
        data_cadastro,
        destaque,
        esporte,
        categoria
    }) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.marca = marca;
        this.modelo = modelo;
        this.preco = preco;
        this.capa = capa;
        this.data_cadastro = data_cadastro;
        this.destaque = destaque;
        this.esporte = esporte;
        this.categoria = categoria;
    }

    async cadastrar() {
        const sql = 'INSERT INTO produto (id, nome, descricao, marca, modelo, preco, capa, data_cadastro, destaque, esporte, categoria) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';

        const values = [this.id, this.nome, this.descricao, this.marca, this.modelo, this.preco, this.capa, this.data_cadastro, this.destaque, this.esporte, this.categoria];

        try {
            const [result] = await db.query(sql, values);
            this.id = result.insertId;
            return true;
        } catch (error) {
            throw error;
        }
    }

    static async listarTodos() {
        try {
            const sql = 'SELECT * FROM produto';
            const [rows] = await db.query(sql);
            const produtos = rows.map(row => new Produto(row));

            return produtos;
        } catch (error) {
            throw error;
        }
    }

}

module.exports = Produto;