<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: yfgda
  Date: 03/05/2026
  Time: 09:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Listagem de produtos</title>
    <link href="tabela.css" rel="stylesheet">
</head>
<body>
<%
  try {



    Connection conecta;
    PreparedStatement statement;
    Class.forName("com.mysql.cj.jdbc.Driver");
    conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/croches", "root", "");

    statement = conecta.prepareStatement("SELECT * FROM produto ORDER BY codigo");
    ResultSet resultado = statement.executeQuery();
   %>
        <table>
          <tr>
            <th>Codigo</th>
            <th>Tipo</th>
            <th>Nome</th>
            <th>Preço</th><th>Exclusão</th>
          </tr>

            <%
    while (resultado.next()){
            %>

          <tr>
            <td><%= resultado.getString("codigo")%></td>
            <td><%= resultado.getString("tipo")%></td>
            <td><%= resultado.getString("nome")%></td>
            <td><%= resultado.getString("preco")%></td>
            <td><a href="deletarcroches.jsp?codigo=<%= resultado.getString("codigo")%>">Excluir</a></td>
          </tr>

   <%
     }
   %>
        </table>
<%


  } catch (Exception x) {
    System.out.print("Erro: " + x.getMessage());
  }
%>
</body>
</html>
