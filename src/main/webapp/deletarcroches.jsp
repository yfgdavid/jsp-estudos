<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: yfgda
  Date: 03/05/2026
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deletar produtos</title>
</head>
<body>
<%
    int codigo;
    codigo = Integer.parseInt(request.getParameter("codigo"));

    try {


        Connection conecta;
        PreparedStatement statement;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/croches", "root", "");

    statement = conecta.prepareStatement("DELETE FROM produto WHERE codigo=?");
    statement.setInt(1, codigo);

   int resultado = statement.executeUpdate();

   if (resultado == 0) {
       System.out.println("o produto nao foi encontrado");
   } else {
       System.out.println("o produto de codigo: " + codigo + " foi excluido com sucesso");
   }

    } catch (Exception x) {
        System.out.print("Erro: " + x.getMessage());
    }


%>
</body>
</html>
