<%-- 
    Document   : plantillaCRUD
    Created on : 1/08/2023, 01:32:19 PM
    Author     : informatica
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <title>DressCode</title>
        <link rel="stylesheet" href="css/css.css">
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const tabla = document.getElementById('miTabla');
                const codigoDetalleInput = document.getElementById('inputcodigoDetalle');
                const cantidadInput = document.getElementById('inputcantidad');
                const precioInput = document.getElementById('inputprecio');
                const codCompra = document.getElementById('selectcodCompra');
                const codArticulo = document.getElementById('selectcodArticulo');

                tabla.addEventListener('click', (event) => {
                    const fila = event.target.closest('tr');
                    if (!fila)
                        return; 

                    const celdas = fila.querySelectorAll('td');
                    if (celdas.length !== 5)
                        return; 

                    const codigoDetalle = celdas[0].textContent;
                    const cantidad = celdas[1].textContent;
                    const precio = celdas[2].textContent;
                    const codComp = celdas[3].textContent;
                    const codArti = celdas[4].textContent;

                    codigoDetalleInput.value = codigoDetalle;
                    cantidadInput.value = cantidad;
                    precioInput.value = precio;
                    codCompra.value = codComp;
                    codArticulo.value = codArti;
                });
            });

            function limpiarCajas() {
                const codigoDetalleInput = document.getElementById('inputcodigoDetalle');
                const cantidadInput = document.getElementById('inputcantidad');
                const precioInput = document.getElementById('inputprecio');
                const codCompra = document.getElementById('selectcodCompra');
                const codArticulo = document.getElementById('selectcodArticulo');

                // Limpiar los valores que contienen los campos
                codigoDetalleInput.value = '';
                cantidadInput.value = '';
                precioInput.value = '';
                codCompra.value = '';
                codArticulo.value = '';
            }
        </script>
    </head>
    <body>
        <form id="formulario" class="row g-3" action="Controlador?menu=VistaDetalleArticuloCompra" method="POST">
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Código Detalle Artículo Compra</label>
                <input type="text" class="form-control disable" id="inputcodigoDetalle" name="txtDetArtCom" readonly>
            </div>
            <div class="col-md-6"> 
                <label id="txtDatos" class="form-label">Cantidad de Artículos</label>
                <input type="number" class="form-control" id="inputcantidad" name="txtCantArti" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Precio total de la compra</label>
                <input type="number" class="form-control" id="inputprecio" name="txtPreTotal" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Código de Compra</label>
                <select name="txtCodCompra" id="selectcodCompra">
                    <c:forEach var="compras" items="${compra}" >
                        <option value="${compras.getCodigoCompra()}">${compras.getCodigoCompra()}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Código del Artículo</label>
                <select name="txtCodArticulo" id="selectcodArticulo">
                    <c:forEach var="articulo" items="${articulos}">
                        <option value="${articulo.getCodigoArticulo()}">${articulo.getCodigoArticulo()}</option>
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
            <div class="col-12">
                <button id="buttonReady" type="submit" name="accion" value="Agregar">Agregar</button>
                <input id="buttonReady" style="width: 85px;" type="submit" name="accion" value="Actualizar"> 
                <input id="buttonReady" style="width: 85px;" type="button" value="Cancelar" onclick="limpiarCajas();">
            </div>
        </form>


        <table class="table" id="miTabla">
            <thead>
            <th id="etiqueta">Código Detalle Artículo Compra</th>
            <th id="etiqueta">Cantidad de Artículos</th>
            <th id="etiqueta">Precio total de la compra</th>
            <th id="etiqueta">Código de Compra</th>
            <th id="etiqueta">Código del Artículo</th>
        </thead>
        <tbody>

            <c:forEach var="detalleArticuloCompra" items="${detalleArticuloCompras}">
                <tr id="filaDatos" style="cursor:pointer;">
                    <td id="datos">${detalleArticuloCompra.getCodigoDetalleArticuloCompra()}</td>
                    <td id="datos">${detalleArticuloCompra.getCantidadCompra()}</td>
                    <td id="datos">${detalleArticuloCompra.getPrecioCompra()}</td>
                    <td id="datos">${detalleArticuloCompra.getCodigoCompra()}</td>
                    <td id="datos">${detalleArticuloCompra.getCodigoArticulo()}</td>
                </tr>

            </c:forEach>
        </tbody>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>

