<%@ page import="model.Produto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Consulta de produto</title>
  <link href="tabela.css" rel="stylesheet">
</head>
<body>
<%
  Produto p = (Produto) request.getAttribute("produto");
%>
<table>
  <tr>
    <th>Codigo</th>
    <th>Tipo</th>
    <th>Nome</th>
    <th>Preço</th>
  </tr>
  <tr>
    <td><%= p.getCodigo() %></td>
    <td><%= p.getTipo() %></td>
    <td><%= p.getNome() %></td>
    <td><%= p.getPreco() %></td>
  </tr>
</table>
</body>
</html>