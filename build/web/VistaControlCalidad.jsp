<%-- 
    Document   : ControlCalidadCRUD
    Created on : 7/08/2023, 10:07:06 AM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/css.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <title>DressCode</title>
        <link rel="stylesheet" type="text/css" href="Css/styleCruds.css">
        <script>
            function limpiarCampos() {
                const motivoControlCalidad = document.getElementById('inputMotivoControlCalidad');
                const descMotivoControlCalidad = document.getElementById('inputDescMotivoControlCalidad');

                // Limpiar los valores de los campos
                motivoControlCalidad.value = '';
                descMotivoControlCalidad.value = '';
            }
        </script>
    </head>
    <body>

        <%
            String codigoUsuario = request.getParameter("codigoUsuario");
            String nombreUsuario = request.getParameter("nombreUsuario");
            String userName = request.getParameter("usuario");
        %>


        <form id="formulario" class="row g-3" action="Controlador?menu=VistaControlCalidad" method="POST">
            <center>
                <div class="col-md-12">
                    <p class="text-justify lead">                   
                        ¡Bienvenido <%= nombreUsuario%>!

                        En nombre de todo nuestro equipo, queremos expresarte nuestro más sincero agradecimiento por tomarte el 
                        tiempo para compartir tus comentarios con nosotros. Saber tu opinión es fundamental para asegurarnos de 
                        que estamos brindando productos de la más alta calidad.
                    </p>
                </div>
            </center>            
            <div class="col-md-8">
                <label for="inputEmail4" class="form-label" >Nombre Usuario</label>
                <input type="text" name="txtCodigoUsuarioControl" class="invisible" id="inputEmail4" value="<%= codigoUsuario%>" readonly>
                <input type="text" name="txtUserName" class="form-control" id="inputEmail4" value="<%= userName%>" readonly>
                <input type="text" name="txtNombreUsuario" class="invisible" id="inputEmail4" value="<%= nombreUsuario%>" readonly>
            </div>
            <div class="col-md-8">
                <label for="inputEmail4" class="form-label" >Motivo</label>
                <input type="text" name="txtMotivo" class="form-control" id="inputMotivoControlCalidad" required>
            </div>
            <div class="col-md-8">
                <label for="inputPassword4" class="form-label">Descripción del motivo</label>
                <textarea name="txtMotivoDescripcion" class="form-control" id="inputDescMotivoControlCalidad" rows="5" required></textarea>
            </div>
            <div class="col-12">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="gridCheck" required oninvalid="this.setCustomValidity('Debes marcar el checkbox para continuar.')" onchange="this.setCustomValidity('');">
                    <label class="form-check-label" for="gridCheck">
                        Confirmo que deseo enviar mi comentario.
                    </label>
                </div>
            </div>
            <div class="col-12">
                <button type="submit" id="buttonReady" name="accion" value="Agregar">Enviar</button>
                <button type="button" id="buttonReady" onclick="limpiarCampos();">Cancelar</button>
            </div>
            <div>
                <table class="table">
                    <thead>                    
                    <th>Código</th>
                    <th>Motivo</th>
                    <th>Descripción</th>
                    <th>Código Usuario</th>
                    </thead>
                    <tbody>
                        <c:forEach var="calidad" items="${control}">
                            <tr>
                                <td>${calidad.getCodigoControlCalidad()}</td>
                                <td>${calidad.getMotivo()}</td>
                                <td>${calidad.getDescripcionCalidad()}</td>
                                <td>${calidad.getCodigoUsuario()}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </form>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</html>

