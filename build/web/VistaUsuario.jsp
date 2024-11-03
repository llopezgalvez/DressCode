<%-- 
    Document   : Empleado
    Created on : 12-jul-2023, 1:25:25
    Author     : informaticadresscode
--%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="css/css.css">
        <title>DressCode</title>

        <script>



            document.addEventListener('DOMContentLoaded', () => {
                const tabla = document.getElementById('miTabla');
                const codigoUsuarioInput = document.getElementById('inputCodigoUsuario');
                const nombreUsuarioInput = document.getElementById('inputNombreUsuario');
                const apellidoUsuarioInput = document.getElementById('inputApellidoUsuario');
                const correoUsuarioInput = document.getElementById('inputCorreoUsuario');
                const usernameInput = document.getElementById('inputUsername');
                const contrasenaInput = document.getElementById('inputContrasena');
                
                

                tabla.addEventListener('click', (event) => {

                    const fila = event.target.closest('tr');

                    if (!fila)
                        return; // Ignorar si no se hizo clic en una fila

                    const celdas = fila.querySelectorAll('td');

                    if (celdas.length !== 7)
                        return; // Ignorar si la fila no tiene cinco celdas

                    const codigoUsuario = celdas[0].textContent;
                    const nombreUsuario = celdas[1].textContent;
                    const apellidoUsuario = celdas[2].textContent;
                    const correoUsuario = celdas[3].textContent;
                    const username = celdas[4].textContent;
                    const contrasena = celdas[5].textContent;

                    codigoUsuarioInput.value = codigoUsuario;
                    nombreUsuarioInput.value = nombreUsuario;
                    apellidoUsuarioInput.value = apellidoUsuario;
                    correoUsuarioInput.value = correoUsuario;
                    usernameInput.value = username;
                    contrasenaInput.value = contrasena;
                });
            });

            function limpiarCampos() {
                const codigoUsuarioInput = document.getElementById('inputCodigoUsuario');
                const nombreUsuarioInput = document.getElementById('inputNombreUsuario');
                const apellidoUsuarioInput = document.getElementById('inputApellidoUsuario');
                const correoUsuarioInput = document.getElementById('inputCorreoUsuario');
                const usernameInput = document.getElementById('inputUsername');
                const contrasenaInput = document.getElementById('inputContrasena');

                // Limpiar los valores de los campos
                codigoUsuarioInput.value = '';
                nombreUsuarioInput.value = '';
                apellidoUsuarioInput.value = '';
                correoUsuarioInput.value = '';
                usernameInput.value = '';
                contrasenaInput.value = '';
            }
        </script>
    </head>
    <body>
        <form id="formulario" class="row g-3" action="Controlador?menu=VistaUsuario" method="POST" enctype="multipart/form-data">
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Código Usuario</label>
                <input type="text" class="form-control disable" value="${usuarioEncontrado.getCodigoUsuario()}" id="inputCodigoUsuario" readonly name="txtCodigoUsuario" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Nombre Usuario</label>
                <input type="text" class="form-control" value="${usuarioEncontrado.getNombreUsuario()}" id="inputNombreUsuario" name="txtNombreUsuario" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Apellido Usuario</label>
                <input type="text" class="form-control" value="${usuarioEncontrado.getApellidoUsuario()}" id="inputApellidoUsuario" name="txtApellidoUsuario" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Correo Usuario</label>
                <input type="text" class="form-control" value="${usuarioEncontrado.getCorreoUsuario()}" id="inputCorreoUsuario" name="txtCorreoUsuario" required>
            </div>
            <div class="col-md-4">
                <label id="txtDatos" class="form-label">Username</label>
                <input type="text" class="form-control" value="${usuarioEncontrado.getUsername()}" id="inputUsername" name="txtUsername" required>
            </div>
            <div class="col-md-4">
                <label id="txtDatos" class="form-label">Contraseña</label>
                <input type="text" class="form-control" value="${usuarioEncontrado.getContrasena()}" id="inputContrasena" name="txtContrasena" required>
            </div>
            <div class="col-md-4">
                <label id="txtDatos" class="form-label">Foto</label>
                <input type="file" class="form-control" value="${usuarioEncontrado.getFoto()}" id="inputFoto" name="fotoUsuario"  accept="image/*">
            </div>
            
            <div class="col-12">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="gridCheck" required oninvalid="this.setCustomValidity('Debes marcar el checkbox para continuar.')" onchange="this.setCustomValidity('');">
                    <label class="form-check-label" for="gridCheck">
                        Estoy seguro/a de realizar los cambios.
                    </label>
                </div>
            </div>

            <input id="buttonReady" type="submit" name="accion" value="Agregar"> <input id="buttonReady" style="width: 85px;" type="submit" name="accion" value="Actualizar"> <input id="buttonReady" style="width: 85px;" type="submit" name="accion" value="Eliminar">     <input id="buttonReady" style="width: 85px;" type="button" value="Cancelar" onclick="limpiarCampos();">

        </form>
        <table class="table" id="miTabla">
            <thead>
            <th id="etiqueta">Código Usuario</th>
            <th id="etiqueta">Nombre Usuario</th>
            <th id="etiqueta">Apellido Usuario</th>
            <th id="etiqueta">Correo Usuario</th>
            <th id="etiqueta">Username</th>
            <th id="etiqueta">Contraseña</th>
            <th id="etiqueta">Foto</th>
        </thead>
        <tbody>
            <c:forEach var="usuario" items="${usuario}">
                <tr style="cursor: pointer;">
                    <td id="datos">${usuario.getCodigoUsuario()}</td>
                    <td id="datos">${usuario.getNombreUsuario()}</td>
                    <td id="datos">${usuario.getApellidoUsuario()}</td>
                    <td id="datos">${usuario.getCorreoUsuario()}</td>
                    <td id="datos">${usuario.getUsername()}</td>  
                    <td id="datos">${usuario.getContrasena()}</td>  
                    <td id="datos"><img src="ControladorIMG?idUsuario=${usuario.getCodigoUsuario()}"  width="30px" height="30px"></td>  
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>