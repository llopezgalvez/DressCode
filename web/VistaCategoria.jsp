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
        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const tabla = document.getElementById('miTabla');
                const codigoCategoriaInput = document.getElementById('inputcodigoCategoria');
                const descripcionInput = document.getElementById('inputDescripcion');
                const clasificacionInput = document.getElementById('inputClasificacion');
                const tallasDisponiblesInput = document.getElementById('inputTallasDisponibles');
                const temporadaInput = document.getElementById('inputTemporada');



                tabla.addEventListener('click', (event) => {
                    const fila = event.target.closest('tr');
                    if (!fila)
                        return; // Ignorar si no se hizo clic en una fila



                    const celdas = fila.querySelectorAll('td');
                    if (celdas.length !== 5)
                        return; // Ignorar si la fila no tiene cinco celdas



                    const codigoCategoria = celdas[0].textContent;
                    const descripcion = celdas[1].textContent;
                    const clasificacion = celdas[2].textContent;
                    const tallasDisponibles = celdas[3].textContent;
                    const temporada = celdas[4].textContent;



                    codigoCategoriaInput.value = codigoCategoria;
                    descripcionInput.value = descripcion;
                    clasificacionInput.value = clasificacion;
                    tallasDisponiblesInput.value = tallasDisponibles;
                    temporadaInput.value = temporada;
                });
            });
            
            function limpiarCampos() {
                const codigoCategoriaInput = document.getElementById('inputcodigoCategoria');
                const descripcionInput = document.getElementById('inputDescripcion');
                const clasificacionInput = document.getElementById('inputClasificacion');
                const tallasDisponiblesInput = document.getElementById('inputTallasDisponibles');
                const temporadaInput = document.getElementById('inputTemporada');

                // Limpiar los valores de los campos
                codigoCategoriaInput.value = '';
                descripcionInput.value = '';
                clasificacionInput.value = '';
                tallasDisponiblesInput.value = '';
                temporadaInput.value = '';
            }
            
        </script>
        <link rel="stylesheet" type="text/css" href="css/css.css">
    </head>
    <body>

        <form id="formulario" class="row g-3" action="Controlador?menu=VistaCategoria" method="POST">
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Código Categoria</label>
                <input type="text" class="form-control disable" id="inputcodigoCategoria" readonly name="txtCodigoCategoria" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Descripcion</label>
                <input type="text" class="form-control" id="inputDescripcion"  name="txtDescripcion" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Clasificacion</label>
                <input type="text" class="form-control" id="inputClasificacion"  name="txtClasificacion" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Tallas Disponibles</label>
                <input type="number" class="form-control" id="inputTallasDisponibles"  name="txtTallasDisponibles" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Temporada</label>
                <input type="text" class="form-control" id="inputTemporada"  name="txtTemporada" required>
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

            <th id="etiqueta">Codigo Categoria</th>
            <th id="etiqueta">Descripcion </th>
            <th id="etiqueta">Clasificacion </th>
            <th id="etiqueta">Tallas Disponibles </th>
            <th id="etiqueta">Temporada</th>

        </thead>
        <tbody>
            <c:forEach var="categoria" items="${categoria}">
                <tr id="filaDatos" style="cursor:pointer;">
                    <td id="datos">${categoria.getCodigoCategoria()}</td>
                    <td id="datos">${categoria.getDescripcion()}</td>
                    <td id="datos">${categoria.getClasificacion()}</td>
                    <td id="datos">${categoria.getTallasDisponibles()}</td>
                    <td id="datos">${categoria.getTemporada()}</td>

                </tr>

            </c:forEach>

        </tbody>
    </table>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
