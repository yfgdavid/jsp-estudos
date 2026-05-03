<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: yfgda
  Date: 03/05/2026
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Alteração de produtos</title>
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

    statement = conecta.prepareStatement("UPDATE  produto SET tipo = ?, nome = ?, preco = ? WHERE codigo = ?");
    statement.setString(1, tipo);
    statement.setString(2, nome);
    statement.setDouble(3, preco);
    statement.setInt(4, codigo);


    statement.executeUpdate();
    out.print("Os dados do produto: " + nome + " foram alterados com sucesso");

  } catch (Exception x) {
    out.print("Erro: " + x.getMessage());
  }
%>
</body>
</html>
