<%-- 
    Document   : Empleado
    Created on : 29/07/2023, 01:07:29 PM
    Author     : Franco Paiz
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
                const codigoEmpleadoInput = document.getElementById('inputCodigoEmpleado');
                const nombreEmpleadoInput = document.getElementById('inputNombreEmpleado');
                const apellidoEmpleadoInput = document.getElementById('inputApellidoEmpleado');
                const puestoEmpleadoInput = document.getElementById('inputPuestoEmpleado');
                const telefonoEmpleadoInput = document.getElementById('inputTelefonoEmpleado');

                tabla.addEventListener('click', (event) => {
                    const fila = event.target.closest('tr');
                    if (!fila)
                        return; // Ignorar si no se hizo clic en una fila

                    const celdas = fila.querySelectorAll('td');
                    if (celdas.length !== 5)
                        return; // Ignorar si la fila no tiene cinco celdas
                    const codigoEmpleado = celdas[0].textContent;
                    const nombreEmpleado = celdas[1].textContent;
                    const apellidoEmpleado = celdas[2].textContent;
                    const puestoEmpleado = celdas[3].textContent;
                    const telefonoEmpleado = celdas[4].textContent;

                    codigoEmpleadoInput.value = codigoEmpleado;
                    nombreEmpleadoInput.value = nombreEmpleado;
                    apellidoEmpleadoInput.value = apellidoEmpleado;
                    puestoEmpleadoInput.value = puestoEmpleado;
                    telefonoEmpleadoInput.value = telefonoEmpleado;
                });
            });
            
            function limpiarCampos() {
                const codigoEmpleadoInput = document.getElementById('inputCodigoEmpleado');
                const nombresEmpleadoInput = document.getElementById('inputNombreEmpleado');
                const apellidosEmpleadoInput = document.getElementById('inputApellidoEmpleado');
                const puestoDeTrabajoEmpleadoInput = document.getElementById('inputPuestoEmpleado');
                const telefonoEmpleadoInput = document.getElementById('inputTelefonoEmpleado');

                // Limpiar los valores de los campos
                codigoEmpleadoInput.value = '';
                nombresEmpleadoInput.value = '';
                apellidosEmpleadoInput.value = '';
                puestoDeTrabajoEmpleadoInput.value = '';
                telefonoEmpleadoInput.value = '';
            }
        </script>
    </head>
    <body>
        <form id="formulario" class="row g-3" action="Controlador?menu=VistaEmpleado" method="POST">
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Código Empleado</label>
                <input type="text" class="form-control disable" value="${empleadoEncontrado.getCodigoEmpleado()}" id="inputCodigoEmpleado" readonly name="txtCodigoEmpleado" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Nombres</label>
                <input type="text" class="form-control" value="${empleadoEncontrado.getNombreEmpleado()}" id="inputNombreEmpleado" name="txtNombreEmpleado" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Apellidos</label>
                <input type="text" class="form-control" value="${empleadoEncontrado.getApellidoEmpleado()}" id="inputApellidoEmpleado" name="txtApellidoEmpleado" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Puesto de Trabajo</label>
                <input type="text" class="form-control" value="${empleadoEncontrado.getPuestoEmpleado()}" id="inputPuestoEmpleado" name="txtPuestoEmpleado" required>
                <div id="txtInfoEmail" class="form-text">DressCode no compartirá nunca tu información personal.</div>
            </div>
            <div class="col-md-4">
                <label id="txtDatos" class="form-label">Télefono del empleado</label>
                <input type="text" pattern="[0-9]+" class="form-control" value="${empleadoEncontrado.getTelefonoEmpleado()}" id="inputTelefonoEmpleado" name="txtTelefonoEmpleado" required>
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
            <th id="etiqueta">Código Empleado</th>
            <th id="etiqueta">Nombres</th>
            <th id="etiqueta">Apellidos</th>
            <th id="etiqueta">Puesto de Trabajo</th>
            <th id="etiqueta">Teléfono del Empleado</th>
        </thead>
        <tbody>
            <c:forEach var="empleado" items="${empleados}">
                <tr style="cursor: pointer;">
                    <td id="datos">${empleado.getCodigoEmpleado()}</td>
                    <td id="datos">${empleado.getNombreEmpleado()}</td>
                    <td id="datos">${empleado.getApellidoEmpleado()}</td>
                    <td id="datos">${empleado.getPuestoEmpleado()}</td>
                    <td id="datos">${empleado.getTelefonoEmpleado()}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>