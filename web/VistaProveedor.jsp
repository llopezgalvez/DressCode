<%-- 
    Document   : Proveedor
    Created on : 12-jul-2023, 1:25:25
    Author     : Oscar Monterroso
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
                const codigoProveedorInput = document.getElementById('inputcodigoProveedor');
                const nombreProveedorInput = document.getElementById('inputnombreProveedor');
                const telefonoProveedorInput = document.getElementById('inputtelefonoProveedor');
                const direccionProveedorInput = document.getElementById('inputdireccionProveedor');
                const correoProveedorInput = document.getElementById('inputcorreoProveedor');



                tabla.addEventListener('click', (event) => {
                    const fila = event.target.closest('tr');
                    if (!fila)
                        return; // Ignorar si no se hizo clic en una fila



                    const celdas = fila.querySelectorAll('td');
                    if (celdas.length !== 5)
                        return; // Ignorar si la fila no tiene cinco celdas



                    const codigoProveedor = celdas[0].textContent;
                    const nombreProveedor = celdas[1].textContent;
                    const telefonoProveedor = celdas[2].textContent;
                    const direccionProveedor = celdas[3].textContent;
                    const correoProveedor = celdas[4].textContent;



                    codigoProveedorInput.value = codigoProveedor;
                    nombreProveedorInput.value = nombreProveedor;
                    telefonoProveedorInput.value = telefonoProveedor;
                    direccionProveedorInput.value = direccionProveedor;
                    correoProveedorInput.value = correoProveedor;
                });
            });

            function limpiarCampos() {
                const codigoProveedorInput = document.getElementById('inputcodigoProveedor');
                const nombreProveedorInput = document.getElementById('inputnombreProveedor');
                const telefonoProveedorInput = document.getElementById('inputtelefonoProveedor');
                const correoProveedorInput = document.getElementById('inputcorreoProveedor');
                const direccionProveedorInput = document.getElementById('inputdireccionProveedor');

                // Limpiar los valores de los campos
                codigoProveedorInput.value = '';
                nombreProveedorInput.value = '';
                telefonoProveedorInput.value = '';
                correoProveedorInput.value = '';
                direccionProveedorInput.value = '';
            }
        </script>
    </head>
    <body>
        <form id="formulario" class="row g-3" action="Controlador?menu=VistaProveedor" method="POST">
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Código Proveedor</label>
                <input type="text" class="form-control disable"  value="${proveedorEncontrado.getCodigoProveedor()}" id="inputcodigoProveedor" readonly name="txtCodigoProveedor" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Nombre del Proveedor</label>
                <input type="text" class="form-control"  value="${proveedorEncontrado.getNombreProveedor()}" id="inputnombreProveedor" name="txtNombreProveedor" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Teléfono Proveedor</label>
                <input type="text" pattern="[0-9]+" class="form-control"  value="${proveedorEncontrado.getTelefonoProveedor()}" id="inputtelefonoProveedor" name="txtTelefonoProveedor" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Correo Proveedor</label>
                <input type="email" class="form-control"  value="${proveedorEncontrado.getCorreoProveedor()}" id="inputcorreoProveedor" name="txtCorreoProveedor" required>
                <div id="txtInfoEmail" class="form-text">DressCode no compartirá nunca tu información personal.</div>
            </div>
            <div class="col-md-4">
                <label id="txtDatos" class="form-label">Dirección del Proveedor</label>
                <input type="text" class="form-control"  value="${proveedorEncontrado.getDireccionProveedor()}" id="inputdireccionProveedor" name="txtDireccionProveedor" required>
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
            <th id="etiqueta">Código Proveedor</th>
            <th id="etiqueta">Nombre Proveedor</th>
            <th id="etiqueta">Teléfono Proveedor</th>
            <th id="etiqueta">Dirección Proveedor</th>
            <th id="etiqueta">Correo Proveedor</th>
        </thead>
        <tbody>
            <c:forEach var="proveedor" items="${proveedores}">
                <tr id="filaDatos" style="cursor:pointer;">
                    <td id="datos">${proveedor.getCodigoProveedor()}</td>
                    <td id="datos">${proveedor.getNombreProveedor()}</td>
                    <td id="datos">${proveedor.getTelefonoProveedor()}</td>
                    <td id="datos">${proveedor.getDireccionProveedor()}</td>
                    <td id="datos">${proveedor.getCorreoProveedor()}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>