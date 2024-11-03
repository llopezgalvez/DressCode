<%-- 
    Document   : FacturaView
    Created on : 8/08/2023, 11:15:01 AM
    Author     : Ana
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="css/css.css">
        <title>Vista Factura</title>
        <script>
            function limpiarCampos() {
                const codigoAutorizacionInput = document.getElementById('inputCodigoAutorizacion');
                const codigoCompra = document.getElementById('selectcodCompra');
                const codigoEmpleado = document.getElementById('selectcodEmpleado');
                const NITEmpresa = document.getElementById('inputNitEmpresa');
                const direccionEmpresa = document.getElementById('inputDireccionEmpresa');
                const telefonoEmpresa = document.getElementById('inputTelefonoEmpresa');
                const fechaDeEmision = document.getElementById('inputFecha');
                const nombreEmpresa = document.getElementById('inputNombreEmpresa')


                // Limpiar los valores de los campos
                codigoAutorizacionInput.value = '';
                codigoCompra.value = '';
                codigoEmpleado.value = '';
                NITEmpresa.value = '';
                direccionEmpresa.value = '';
                telefonoEmpresa.value = '';
                fechaDeEmision.value = '';
                nombreEmpresa.value = '';
            }
        </script>
    </head>
    <body>
        <%
            String codigoUsuario = request.getParameter("codigoUsuario");
            String nombreUsuario = request.getParameter("nombreUsuario");
            String apellidoUsuario = request.getParameter("apellidoUsuario");
            String codigoCompra = request.getParameter("codigoCompra");
        %>



        <form id="formulario" class="row g-3" action="Controlador?menu=VistaFactura" method="POST">
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Código Factura</label>
                <input type="text" class="form-control disable" name="txtCodigoFactura" id="inputCodigoFactura" value="" readonly>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">NIT Empresa</label>
                <input type="text" class="form-control" name="txtnitEmpresa" id="inputNitEmpresa" readonly>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Nombre Empresa</label>
                <input type="text" class="form-control" name="txtNombreEmpresa" id="inputNombreEmpresa" readonly>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Dirección de la Empresa</label>
                <input type="text" class="form-control" name="txtDireccionEmpresa" id="inputDireccionEmpresa" readonly>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Teléfono Empresa </label>
                <input type="text" class="form-control" name="txtTelefonoEmpresa" id="inputTelefonoEmpresa" readonly>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Código de Autorización</label>
                <input type="text" class="form-control" name="txtCodigoAutorizacion" id="inputCodigoAutorizacion" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Fecha de Emisión</label>
                <input type="text" class="form-control" name="txtFechaEmision" id="inputFecha" readonly>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Usuario que realiza la compra</label>
                <input type="text" class="form-control" value="<%= nombreUsuario%> <%= apellidoUsuario%>" readonly>
                <input type="text" name="txtCodigoUsuarioFactura" class="invisible" id="inputEmail4" value="<%= codigoUsuario%>" readonly>
                <input type="hidden" name="nombreUsuario" value="<%= nombreUsuario%>">  
                <input type="hidden" name="apellidoUsuario" value="<%= apellidoUsuario%>"> 
                <input type="hidden" name="codigoUsuario" value="<%= codigoUsuario%>">
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Código de la compra</label>
                <select id="selectcodCompra" name="txtCodigoCompra" class="form-select">
                    <c:forEach var="compra" items="${compras}">
                        <option value="${compra.getCodigoCompra()}">${compra.getCodigoCompra()}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Seleccione el empleado</label>
                <select id="selectcodEmpleado" name="txtCodigoEmpleado" class="form-select">
                    <c:forEach var="empleado" items="${empleados}">
                        <option value="${empleado.getCodigoEmpleado()}">${empleado.getNombreEmpleado()}</option>
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
            <input id="buttonReady" type="submit" name="accion" value="Agregar"> <input id="buttonReady" type="button" value="Cancelar" onclick="limpiarCampos();"> 
            <input style="margin-left: 15px;margin-top: 10px; width: 75px; height: 30px; text-align: center; background-color: #948883;color: #dbc3b3;border: none;border-radius: 5px; " type="submit" name="accion" value="Buscar" class="btn btn-outline-success">
            <input style="margin-left: 15px;margin-top: 10px; width: 90px; height: 30px; text-align: center" type="search" name="txtBuscar" class="form-control" placeholder="Buscar">
        </form>

        <%-- Buscar
        <div class="navbar">
            <div class="form-inline"> --%>

        <!-- Campos ocultos para enviar datos junto con la búsqueda 
        <input type="hidden" name="codigoUsuario" value="<%= codigoUsuario%>">
        <input type="hidden" name="codigoEmpleado" value="<%= codigoUsuario%>">
        <input type="hidden" name="codigoCompra" value="<%= codigoCompra%>">-->

    </div>
</div>

<table class="table">
    <thead>
    <th id="etiqueta">Código Factura</th>
    <th id="etiqueta">Nit Empresa</th>
    <th id="etiqueta">Nombre Empresa</th>
    <th id="etiqueta">Dirección Empresa</th>
    <th id="etiqueta">Teléfono Empresa</th>
    <th id="etiqueta">Código Autorización</th>
    <th id="etiqueta">Fecha de Emisión</th>
    <th id="etiqueta">Código Persona</th>
    <th id="etiqueta">Código Compra</th>
    <th id="etiqueta">Código Empleado</th>
</thead>
<tbody>
    <c:forEach var="factura" items="${facturas}">
        <tr id="filaDatos" style="cursor:pointer;">
            <td id="datos">${factura.getCodigoFactura()}</td>
            <td id="datos">${factura.getNITEmpresa()}</td>
            <td id="datos">${factura.getNombreEmpresa()}</td>
            <td id="datos">${factura.getDireccionEmpresa()}</td>
            <td id="datos">${factura.getTelefonoEmpresa()}</td>
            <td id="datos">${factura.getCodigoAutorizacion()}</td>
            <td id="datos">${factura.getFechaEmision()}</td>
            <td id="datos">${factura.getCodigoUsuario()}</td>
            <td id="datos">${factura.getCodigoCompra()}</td>
            <td id="datos">${factura.getCodigoEmpleado()}</td> 
        </tr>
    </c:forEach>
</tbody>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>