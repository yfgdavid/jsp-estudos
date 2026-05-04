<%@ page import="model.Produto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Produto p = (Produto) request.getAttribute("produto");
%>
<html>
<head><title>Editar Produto</title></head>
<body>
<h2>Editar Produto</h2>
<form method="post" action="produto">
  <input type="hidden" name="acao" value="atualizar">

  <label>Código:<br>
    <input type="number" name="codigo" value="<%= p.getCodigo() %>" readonly>
  </label><br><br>

  <label>Nome:<br>
    <input type="text" name="nome" value="<%= p.getNome() %>">
  </label><br><br>

  <label>Tipo:<br>
    <input type="text" name="tipo" value="<%= p.getTipo() %>">
  </label><br><br>

  <label>Preço:<br>
    <input type="number" name="preco" step="0.5" value="<%= p.getPreco() %>">
  </label><br><br>

  <input type="submit" value="Salvar">
</form>
</body>
</html>