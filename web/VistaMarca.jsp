<%-- 
    Document   : Empleado
    Created on : 12-jul-2023, 1:25:25
    Author     : Alejandro
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
                const codigoMarcaInput = document.getElementById('inputcodigoMarca');
                const nombreMarcaInput = document.getElementById('inputnombreMarca');
                const direccionMarcaInput = document.getElementById('inputdireccionMarca');
                const correoMarcaInput = document.getElementById('inputcorreoMarca');
                const codProveedor = document.getElementById('selectcodProveedor');

                tabla.addEventListener('click', (event) => {
                    const fila = event.target.closest('tr');
                    if (!fila)
                        return; // Ignorar si no se hizo clic en una fila

                    const celdas = fila.querySelectorAll('td');
                    if (celdas.length !== 5)
                        return; // Ignorar si la fila no tiene cinco celdas

                    const codigoMarca = celdas[0].textContent;
                    const nombreMarca = celdas[1].textContent;
                    const direccionMarca = celdas[2].textContent;
                    const correoMarca = celdas[3].textContent;
                    const codProv = celdas[4].textContent;

                    codigoMarcaInput.value = codigoMarca;
                    nombreMarcaInput.value = nombreMarca;
                    direccionMarcaInput.value = direccionMarca;
                    correoMarcaInput.value = correoMarca;
                    codProveedor.value = codProv;
                });
            });

            function limpiarCampos() {
                const codigoMarcaInput = document.getElementById('inputcodigoMarca');
                const nombreMarcaInput = document.getElementById('inputnombreMarca');
                const direccionMarcaInput = document.getElementById('inputdireccionMarca');
                const correoMarcaInput = document.getElementById('inputcorreoMarca');
                const codProveedor = document.getElementById('selectcodProveedor');

                // Limpiar los valores de los campos
                codigoMarcaInput.value = '';
                nombreMarcaInput.value = '';
                direccionMarcaInput.value = '';
                correoMarcaInput.value = '';
                codProveedor.value = '';
            }
        </script>
    </head>
    <body>
        <form id="formulario" class="row g-3" action="Controlador?menu=VistaMarca" method="POST">
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Código Marca</label>
                <input type="text" class="form-control disable" id="inputcodigoMarca" readonly name="txtCodigoMarca" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Nombre de la marca</label>
                <input type="text" class="form-control" id="inputnombreMarca" name="txtNombreMarca" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Dirección de la marca</label>
                <input type="text" class="form-control" id="inputdireccionMarca" name="txtDireccionMarca" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Correo electrónico de la marca</label>
                <input type="email" class="form-control" id="inputcorreoMarca" name="txtCorreoMarca" required>
                <div id="txtInfoEmail" class="form-text">DressCode no compartirá nunca tu información personal.</div>
            </div>
            <div class="col-md-4">
                <label id="txtDatos" class="form-label">Seleccione el proveedor de la marca</label>
                <select id="selectcodProveedor" name="txtCodigoProveedor">
                    <c:forEach var="proveedor" items="${proveedores}">
                        <option value="${proveedor.getCodigoProveedor()}">${proveedor.getNombreProveedor()}</option>
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
            <th id="etiqueta">Código Marca</th>
            <th id="etiqueta">Nombre Marca</th>
            <th id="etiqueta">Dirección Marca</th>
            <th id="etiqueta">Correo Marca</th>
            <th id="etiqueta">Código Proveedor</th>
        </thead>
        <tbody>
            <c:forEach var="marca" items="${marcas}">
                <tr id="filaDatos" style="cursor:pointer;">
                    <td id="datos">${marca.getCodigoMarca()}</td>
                    <td id="datos">${marca.getNombreMarca()}</td>
                    <td id="datos">${marca.getDireccionMarca()}</td>
                    <td id="datos">${marca.getCorreoMarca()}</td>
                    <td id="datos">${marca.getCodigoProveedor()}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>