<%-- 
    Document   : Articulo
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
        <title>DressCode</title>
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const tabla = document.getElementById('miTabla');
                const codigoArticuloInput = document.getElementById('inputcodigoArticulo');
                const tallaArticuloInput = document.getElementById('inputtallaArticulo');
                const colorArticuloInput = document.getElementById('inputcolorArticulo');
                const materialArticuloInput = document.getElementById('inputmaterialArticulo');
                const precioArticuloInput = document.getElementById('inputprecioArticulo');
                const existenciaArticuloInput = document.getElementById('inputexistenciaArticulo');
                const codCategoria = document.getElementById('selectcodCategoria');
                const codMarca = document.getElementById('selectcodMarca');

                tabla.addEventListener('click', (event) => {
                    const fila = event.target.closest('tr');
                    if (!fila)
                        return; // Ignorar si no se hizo clic en una fila

                    const celdas = fila.querySelectorAll('td');
                    if (celdas.length !== 8)
                        return; // Ignorar si la fila no tiene cinco celdas

                    const codigoArticulo = celdas[0].textContent;
                    const tallaArticulo = celdas[1].textContent;
                    const colorArticulo = celdas[2].textContent;
                    const materialArticulo = celdas[3].textContent;
                    const precioArticulo = celdas[4].textContent;
                    const existenciaArticulo = celdas[5].textContent;
                    const codCat = celdas[6].textContent;
                    const codMar = celdas[7].textContent;

                    codigoArticuloInput.value = codigoArticulo;
                    tallaArticuloInput.value = tallaArticulo;
                    colorArticuloInput.value = colorArticulo;
                    materialArticuloInput.value = materialArticulo;
                    precioArticuloInput.value = precioArticulo;
                    existenciaArticuloInput.value = existenciaArticulo;
                    codCategoria.value = codCat;
                    codMarca.value = codMar;


                });
            });
            function limpiarCampos() {
                const codigoArticuloInput = document.getElementById('inputcodigoArticulo');
                const tallaArticuloInput = document.getElementById('inputtallaArticulo');
                const colorArticuloInput = document.getElementById('inputcolorArticulo');
                const materialArticuloInput = document.getElementById('inputmaterialArticulo');
                const precioArticuloInput = document.getElementById('inputprecioArticulo');
                const existenciaArticuloInput = document.getElementById('inputexistenciaArticulo');
                const codCategoria = document.getElementById('selectcodCategoria');
                const codMarca = document.getElementById('selectcodMarca');

                // Limpiar los valores de los campos
                codigoArticuloInput.value = "";
                tallaArticuloInput.value = "";
                colorArticuloInput.value = "";
                materialArticuloInput.value = "";
                precioArticuloInput.value = "";
                existenciaArticuloInput.value = "";
                codCategoria.value = "";
                codMarca.value = "";

            }

        </script>

    </head>
    <body>
        <form id="formulario" class="row g-3" action="Controlador?menu=VistaArticulo" method="POST">
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Código Articulo</label>
                <input type="text" class="form-control disable" id="inputcodigoArticulo" readonly name="txtCodigoArticulo" required >
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Talla</label>
                <input type="text" class="form-control" id="inputtallaArticulo"  name="txtTalla" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Color</label>
                <input type="text" class="form-control" id="inputcolorArticulo"  name="txtColor" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Material</label>
                <input type="text" class="form-control" id="inputmaterialArticulo"  name="txtMaterial" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Precio</label>
                <input type="text" class="form-control" id="inputprecioArticulo"  name="txtPrecio" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Existencia</label>
                <input type="text" class="form-control" id="inputexistenciaArticulo"  name="txtExistencia" required>
            </div>
            <div class="col-md-4">
                <label id="txtDatos" class="form-label">Seleccione el Codigo de Categoria</label>
                <select id="selectcodCategoria" name="cmbCodigoCategoria">
                    <c:forEach var="categoria" items="${categorias}">
                        <option value="${categoria.getCodigoCategoria()}">${categoria.getDescripcion()}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-md-4">
                <label id="txtDatos" class="form-label">Seleccione el codigo de la marca de la marca</label>
                <select id="selectcodMarca" name="cmbCodigoMarca">
                    <c:forEach var="marca" items="${marcas}">
                        <option value="${marca.getCodigoMarca()}">${marca.getNombreMarca()}</option>
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
            <th id="etiqueta">Código Articulo</th>
            <th id="etiqueta">Talla</th>
            <th id="etiqueta">Color</th>
            <th id="etiqueta">Material</th>
            <th id="etiqueta">Precio</th>
            <th id="etiqueta">Existencia</th>
            <th id="etiqueta">Código Categoria</th>
            <th id="etiqueta">Código Marca</th>
        </thead>
        <tbody>
            <c:forEach var="articulo" items="${articulos}">
                <tr>
                    <td id="datos">${articulo.getCodigoArticulo()}</td>
                    <td id="datos">${articulo.getTalla()}</td>
                    <td id="datos">${articulo.getColorArticulo()}</td>
                    <td id="datos">${articulo.getMaterialArticulo()}</td>
                    <td id="datos">${articulo.getPrecio()}</td>
                    <td id="datos">${articulo.getExistenciaArticulo()}</td>
                    <td id="datos">${articulo.getCodigoCategoria()}</td>
                    <td id="datos">${articulo.getCodigoMarca()}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>