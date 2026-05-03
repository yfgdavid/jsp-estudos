<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: yfgda
  Date: 02/05/2026
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%

    int codigo;
    String nome;
    String tipo;
    double preco;

    codigo = Integer.parseInt(request.getParameter("codigo"));
    nome = request.getParameter("nome");
    tipo = request.getParameter("tipo");
    preco = Double.parseDouble(request.getParameter("preco"));

    try {



        Connection conecta;
        PreparedStatement statement;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/croches", "root", "");

    statement = conecta.prepareStatement("INSERT INTO produto VALUES (?, ?, ?, ?)");
        statement.setInt(1, codigo);
        statement.setString(2, tipo);
        statement.setString(3, nome);
        statement.setDouble(4, preco);
        statement.executeUpdate();

    } catch (Exception x) {
        System.out.print("Erro: " + x.getMessage());
    }
    %>
    <p>Produto cadastrado com sucesso!</p>
</body>
</html>
