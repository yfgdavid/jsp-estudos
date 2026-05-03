<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: yfgda
  Date: 03/05/2026
  Time: 18:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Alterar produtos</title>
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

    statement = conecta.prepareStatement("SELECT * FROM produto WHERE codigo=?");
    statement.setInt(1, codigo);
    ResultSet resultado = statement.executeQuery();

    if (!resultado.next()) {
      out.print("produto nao encontrado.");
    } else {
  %>
<form method="post" action="alterar_produto.jsp">
  <p>
    <label for="codigo">Código: </label>
    <input type="number" name="codigo" id="codigo" size="50" value="<%=resultado.getString("codigo")%>">
  </p>

  <p>
    <label for="nome">Nome: </label>
    <input type="text" name="nome" id="nome" size="50" value="<%=resultado.getString("nome")%>">
  </p>

  <p>
    <label for="tipoLinha">Tipo da linha: </label>
    <input type="text" name="tipo" id="tipoLinha" size="50" value="<%=resultado.getString("tipo")%>">
  </p>

  <p>
    <label for="preco">Preço: </label>
    <input type="number" step="0.5" name="preco" id="preco" size="50" value="<%=resultado.getString("preco")%>">
  </p>


  <p>
    <input type="submit" value="Salvar alterações">
  </p>
</form>

<%
    }
  } catch (Exception x) {
    out.print("Erro: " + x.getMessage());
  }
%>
</body>
</html>
