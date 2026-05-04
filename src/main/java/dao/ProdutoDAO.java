package dao;

import model.Produto;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProdutoDAO {

    private Connection getConexao() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/croches", "root", "");
    }

    public void inserir(Produto produto) throws Exception {
        Connection conecta = getConexao();
        PreparedStatement statement = conecta.prepareStatement("INSERT INTO produto VALUES (?, ?, ?, ?)");



            statement.setInt(1, produto.getCodigo());
            statement.setString(2, produto.getTipo());
            statement.setString(3, produto.getNome());
            statement.setDouble(4, produto.getPreco());
            statement.executeUpdate();
            conecta.close();

    }

    public List<Produto> listarTodos() throws Exception {
        Connection conecta = getConexao();
        PreparedStatement statement = conecta.prepareStatement("SELECT * FROM produto ORDER BY codigo");

        ResultSet resultado = statement.executeQuery();

        List<Produto> lista = new ArrayList<>();

        while (resultado.next()){
            Produto produto = new Produto();
            produto.setCodigo(resultado.getInt("codigo"));
            produto.setTipo(resultado.getString("tipo"));
            produto.setNome(resultado.getString("nome"));
            produto.setPreco(resultado.getDouble("preco"));
            lista.add(produto);

        }
        conecta.close();
        return  lista;
    }

    public Produto buscar(int codigo) throws Exception {
        Connection conecta = getConexao();
        PreparedStatement statement = conecta.prepareStatement("SELECT * FROM produto WHERE codigo=?");

        statement.setInt(1, codigo);
        ResultSet resultado = statement.executeQuery();

        Produto produto = null;
        if (resultado.next()){
            produto = new Produto();
            produto.setCodigo(resultado.getInt("codigo"));
            produto.setTipo(resultado.getString("tipo"));
            produto.setNome(resultado.getString("nome"));
            produto.setPreco(resultado.getDouble("preco"));
        }
        conecta.close();
        return produto;


    }
    public void deletar(int codigo) throws Exception {
        Connection conecta = getConexao();
        PreparedStatement statement = conecta.prepareStatement("DELETE FROM produto WHERE codigo=?");
        statement.setInt(1, codigo);
        int resultado = statement.executeUpdate();

        if (resultado == 0){
            System.out.println("produto nao existente");
        }


        conecta.close();

    }

    public void atualizar(Produto produto) throws Exception {
        Connection conecta = getConexao();
        PreparedStatement statement = conecta.prepareStatement("UPDATE  produto SET tipo = ?, nome = ?, preco = ? WHERE codigo = ?");


        statement.setString(1, produto.getTipo());
        statement.setString(2, produto.getNome());
        statement.setDouble(3, produto.getPreco());
        statement.setInt(4, produto.getCodigo());
        statement.executeUpdate();
        conecta.close();

    }
    }
