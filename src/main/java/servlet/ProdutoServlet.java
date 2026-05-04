package servlet;

import dao.ProdutoDAO;
import model.Produto;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/produto")
public class ProdutoServlet extends HttpServlet {

    private ProdutoDAO dao = new ProdutoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // listar, buscar, deletar

        String acao = request.getParameter("acao");

        if (acao.equals("listar")) {
            try {
                List<Produto> produtos = dao.listarTodos();
                request.setAttribute("produtos", produtos);

                request.getRequestDispatcher("/listarcroches.jsp").forward(request, response);

            } catch (Exception e) {
                throw new ServletException(e);
            }

        } else if (acao.equals("buscar")) {
            try {
                int codigo = Integer.parseInt(request.getParameter("codigo"));
                Produto produto = dao.buscar(codigo);
                request.setAttribute("produto", produto);
                request.getRequestDispatcher("/consultarcroches.jsp").forward(request, response);

            } catch (Exception e) {
                throw new ServletException(e);
            }

        } else if (acao.equals("deletar")) {
            try {
                int codigo = Integer.parseInt(request.getParameter("codigo"));
                dao.deletar(codigo);
                response.sendRedirect("produto?acao=listar");


            } catch (Exception e) {
                throw new ServletException(e);
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");
        if (acao.equals("inserir")) {
            try {
                Produto produto = new Produto();
                produto.setCodigo(Integer.parseInt(request.getParameter("codigo")));
                produto.setTipo(request.getParameter("tipo"));
                produto.setNome(request.getParameter("nome"));
                produto.setPreco(Double.parseDouble(request.getParameter("preco")));

                dao.inserir(produto);
                response.sendRedirect("produto?acao=listar");

            } catch (Exception e) {
                throw new ServletException(e);
            }
        } else if(acao.equals("atualizar")) {
            try {
                Produto produto = new Produto();
                produto.setCodigo(Integer.parseInt(request.getParameter("codigo")));
                produto.setTipo(request.getParameter("tipo"));
                produto.setNome(request.getParameter("nome"));
                produto.setPreco(Double.parseDouble(request.getParameter("preco")));

                dao.atualizar(produto);
                response.sendRedirect("produto?acao=listar");

            } catch (Exception e) {
                throw new ServletException(e);
            }
        }
    }
}