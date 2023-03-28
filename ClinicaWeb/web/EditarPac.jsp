<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="config.Conexao"%>

<%
    Statement st = null;
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Pacientes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    </head>
    <body>
        <h1>Editar Pacientes</h1>
        <hr>
        <%
            String valorNome = null;
            String valorTel = null;
            String valorCel = null;
            String especi = null;

            if (request.getParameter("funcao") != null && request.getParameter("funcao").equals("editar")) {
                String valorID = request.getParameter("id");
                st = new Conexao().conectar().createStatement();

                try {
                    rs = st.executeQuery("Select * from tbPaciente where codPaciente='" + valorID + "'");
                    while (rs.next()) {
                        valorNome = rs.getString(2);
                        valorTel = rs.getString(3);
                        valorCel = rs.getString(4);

                    }
                } catch (Exception e) {
                    out.println(e);
                }

            }
        %>
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Editar
        </button>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Pacientes</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="" method="post" id="cadastro">
                            <label>Nome do Paciente</label><br>
                            <input type="text" name="txtNome" value="<%=valorNome%>"><br>
                            <br>
                            <label>Telefone</label><br>
                            <input type="text" name="txtTel" value="<%=valorTel%>"><br>
                            <br>
                            <label>Celular</label><br>
                            <input type="text" name="txtCel" value="<%=valorCel%>"><br>
                            <br>



                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary" name="btnAtualizar" value="Atualizar">Atualizar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


            <%
                if (request.getParameter("btnAtualizar") != null) {
                    String id = request.getParameter("id");
                    String nome = request.getParameter("txtNome");
                    String tel = request.getParameter("txtTel");
                    String cel = request.getParameter("txtCel");
                    try {
                        st = new Conexao().conectar().createStatement();

                        st.executeUpdate("Update tbPaciente set nomePaciente='" + nome + "',telPaciente='" + tel + "',celPaciente='" + cel + "' where codPaciente='" + id + "'");
                        out.println("<meta http-equiv='refresh' content='0;URL=index.html'>");
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Usuário atualizado com sucesso');");
                        out.println("</script>");
                    } catch (Exception e) {
                        out.println(e);
                    }

                }
            %>        

            <br>
            <a href="index.html" class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Voltar</a>
    </body>
</html>