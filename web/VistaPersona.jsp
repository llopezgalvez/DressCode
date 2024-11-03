<%-- 
    Document   : PersonaCRUD
    Created on : 9/08/2023, 11:47:08 AM
    Author     : edgar
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="css/css.css">
        <title>Vista Persona</title> 
        <script> //
            document.addEventListener('DOMContentLoaded', () => {
                const tabla = document.getElementById('miTabla');
                const codigoPersonaInput = document.getElementById('inputcodigoPersona');
                const nombrePersonaInput = document.getElementById('inputnombrePersona');
                const apellidoPersonaInput = document.getElementById('inputapellidoPersona');
                const dpiPersonaInput = document.getElementById('inputdpiPersona');
                const telefonoPersonaInput = document.getElementById('inputtelefonoPersona');
                const correoPersonaInput = document.getElementById('inputcorreoPersona');
                const direccionPersonaInput = document.getElementById('inputdireccionPersona');
                const nitPersonaInput = document.getElementById('inputnitPersona');
                const codUsuario = document.getElementById('selectcodUsuario');

                tabla.addEventListener('click', (event) => {
                    const fila = event.target.closest('tr');
                    if (!fila)
                        return; // Ignorar si no se hizo clic en una fila

                    const celdas = fila.querySelectorAll('td');
                    if (celdas.length !== 9)
                        return; // Ignorar si la fila no tiene cinco celdas

                    const codigoPersona = celdas[0].textContent;
                    const nombrePersona = celdas[1].textContent;
                    const apellidoPersona = celdas[2].textContent;
                    const dpiPersona = celdas[3].textContent;
                    const telefonoPersona = celdas[4].textContent;
                    const correoPersona = celdas[5].textContent;
                    const direccionPersona = celdas[6].textContent;
                    const nitPersona = celdas[7].textContent;
                    const codUser = celdas[8].textContent;

                    codigoPersonaInput.value = codigoPersona;
                    nombrePersonaInput.value = nombrePersona;
                    apellidoPersonaInput.value = apellidoPersona;
                    dpiPersonaInput.value = dpiPersona;
                    telefonoPersonaInput.value = telefonoPersona;
                    correoPersonaInput.value = correoPersona;
                    direccionPersonaInput.value = direccionPersona;
                    nitPersonaInput.value = nitPersona;
                    codUsuario.value = codUser;
                });
            });

            function limpiarCampos() {
                const codigoPersonaInput = document.getElementById('inputcodigoPersona');
                const nombrePersonaInput = document.getElementById('inputnombrePersona');
                const apellidoPersonaInput = document.getElementById('inputapellidoPersona');
                const dpiPersonaInput = document.getElementById('inputdpiPersona');
                const telefonoPersonaInput = document.getElementById('inputtelefonoPersona');
                const correoPersonaInput = document.getElementById('inputcorreoPersona');
                const direccionPersonaInput = document.getElementById('inputdireccionPersona');
                const nitPersonaInput = document.getElementById('inputnitPersona');
                const codUsuario = document.getElementById('selectcodUsuario');
                

                // Limpiar los valores de los campos
                codigoPersonaInput.value = '';
                nombrePersonaInput.value = '';
                apellidoPersonaInput.value = '';
                dpiPersonaInput.value = '';
                telefonoPersonaInput.value = '';
                correoPersonaInput.value = '';
                direccionPersonaInput.value = '';
                nitPersonaInput.value = '';
                codUsuario.value = '';
            }

        </script>
    </head>
    <body>
        <form id="formulario" class="row g-3" action="Controlador?menu=VistaPersona" method="POST">
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Código Persona</label>
                <input type="text" class="form-control disable" id="inputcodigoPersona" readonly name="txtCodigoPersona" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Nombres</label>
                <input type="text" class="form-control" id="inputnombrePersona" name="txtNombrePersona" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Apellidos</label>
                <input type="text" class="form-control" id="inputapellidoPersona" name="txtApellidoPersona" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">DPI</label>
                <input type="text" class="form-control" id="inputdpiPersona" name="txtDPIPersona" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Teléfono</label>
                <input type="text" class="form-control" id="inputtelefonoPersona" name="txtTelefonoPersona" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Correo</label>
                <input type="email" class="form-control" id="inputcorreoPersona" name="txtCorreoPersona" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Dirección</label>
                <input type="text" class="form-control" id="inputdireccionPersona" name="txtDireccionPersona" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">NIT</label>
                <input type="text" class="form-control" id="inputnitPersona" name="txtNITPersona" required>
            </div>
            <div class="col-md-4">
                <label id="txtDatos" class="form-label">Seleccione el usuario</label>
                <select id="selectcodUsuario" name="txtCodigoUsuario">
                    <c:forEach var="usuario" items="${usuarios}">
                        <option value="${usuario.getCodigoUsuario()}">${usuario.getNombreUsuario()}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-12">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="gridCheck" required oninvalid="this.setCustomValidity('Debes marcar el checkbox para continuar.')" onchange="this.setCustomValidity('');">
                    <label class="form-check-label" for="gridCheck">
                        Estoy segur@ de realizar los cambios.
                    </label>
                </div>
            </div>
            <input id="buttonReady" type="submit" name="accion" value="Agregar"> <input id="buttonReady" style="width: 85px;" type="submit" name="accion" value="Actualizar"> <input id="buttonReady" style="width: 85px;" type="submit" name="accion" value="Eliminar"> <input id="buttonReady" style="width: 85px;" type="button" value="Cancelar" onclick="limpiarCampos();">
        </form>
        <table class="table" id="miTabla">
            <thead>
            <th id="etiqueta">Código Persona</th>
            <th id="etiqueta">Nombre Persona</th>
            <th id="etiqueta">Apellido Persona</th>
            <th id="etiqueta">DPI Persona</th>
            <th id="etiqueta">Teléfono Persona</th>
            <th id="etiqueta">Correo Persona</th>
            <th id="etiqueta">Dirección Persona</th>
            <th id="etiqueta">NIT Persona</th>
            <th id="etiqueta">Código Usuario</th>
        </thead>
        <tbody>
            <c:forEach var="persona" items="${personas}">
                <tr id="filaDatos" style="cursor:pointer;">
                    <td id="datos">${persona.getCodigoPersona()}</td>
                    <td id="datos">${persona.getNombrePersona()}</td>
                    <td id="datos">${persona.getApellidoPersona()}</td>
                    <td id="datos">${persona.getDPI()}</td>
                    <td id="datos">${persona.getTelefonoContacto()}</td>
                    <td id="datos">${persona.getCorreoPersona()}</td>
                    <td id="datos">${persona.getDireccionPersona()}</td>
                    <td id="datos">${persona.getNITPersona()}</td>
                    <td id="datos">${persona.getCodigoUsuario()}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>