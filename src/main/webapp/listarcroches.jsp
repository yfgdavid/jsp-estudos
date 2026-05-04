<%@ page import="java.util.List" %>
<%@ page import="model.Produto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Listagem de produtos</title>
    <link href="tabela.css" rel="stylesheet">
</head>
<body>
<%
    List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");
%>
<table>
    <tr>
        <th>Codigo</th>
        <th>Tipo</th>
        <th>Nome</th>
        <th>Preço</th>
        <th>Exclusão</th>
        <th>Editar</th>
    </tr>
    <% for (Produto produto : produtos) { %>
    <tr>
        <td><%= produto.getCodigo() %></td>
        <td><%= produto.getTipo() %></td>
        <td><%= produto.getNome() %></td>
        <td><%= produto.getPreco() %></td>
        <td><a href="produto?acao=deletar&codigo=<%= produto.getCodigo() %>">Excluir</a></td>
        <td><a href="produto?acao=editar&codigo=<%= produto.getCodigo() %>">Editar</a></td>
    </tr>
    <% } %>
</table>
</body>
</html>