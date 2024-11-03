<%-- 
    Document   : compraCRUD
    Created on : 2/08/2023, 11:21:21 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="css/css.css">
        <title>DressCode</title>

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const formaDePagoInput = document.getElementById('inputformaDePago');
                const campoTarjeta = document.getElementById('campoTarjeta');
                const tabla = document.getElementById('miTabla');
                const codigoCompraInput = document.getElementById('inputcodigoCompra');
                const departamentoEntregaInput = document.getElementById('inputdepartamentoEntrega');
                const direccionEntregaInput = document.getElementById('inputdireccionEntrega');
                const horarioEntregaInput = document.getElementById('inputhorarioEntrega');
                const telefonoReferenciaInput = document.getElementById('inputtelefonoReferencia');
                const codPersona = document.getElementById('selectcodPersona');

                formaDePagoInput.addEventListener('change', () => {
                    if (formaDePagoInput.value === 'Tarjeta de crédito o débito') {
                        campoTarjeta.style.display = 'block';
                    } else {
                        campoTarjeta.style.display = 'none';
                    }
                });

                tabla.addEventListener('click', (event) => {
                    const fila = event.target.closest('tr');
                    if (!fila)
                        return;

                    const index = fila.id.replace('filaDatos', '');
                    const codigoCompra = document.getElementById('codigoCompra' + index).textContent;
                    const formaDePago = document.getElementById('formaDePago' + index).textContent;
                    const departamentoEntrega = document.getElementById('departamentoEntrega' + index).textContent;
                    const direccionEntrega = document.getElementById('direccionEntrega' + index).textContent;
                    const horarioEntrega = document.getElementById('horarioEntrega' + index).textContent;
                    const telefonoReferencia = document.getElementById('telefonoReferencia' + index).textContent;
                    const codPersonaValue = document.getElementById('codigoPersona' + index).textContent;

                    codigoCompraInput.value = codigoCompra;
                    formaDePagoInput.value = formaDePago;
                    departamentoEntregaInput.value = departamentoEntrega;
                    direccionEntregaInput.value = direccionEntrega;
                    horarioEntregaInput.value = horarioEntrega;
                    telefonoReferenciaInput.value = telefonoReferencia;


                    codPersona.value = codPersonaValue;
                });
            });

            function limpiarCampos() {
                const codigoCompraInput = document.getElementById('inputcodigoCompra');
                const formaDePagoInput = document.getElementById('inputformaDePago');
                const departamentoEntregaInput = document.getElementById('inputdepartamentoEntrega');
                const direccionEntregaInput = document.getElementById('inputdireccionEntrega');
                const horarioEntregaInput = document.getElementById('inputhorarioEntrega');
                const telefonoReferenciaInput = document.getElementById('inputtelefonoReferencia');
                const codPersona = document.getElementById('selectcodPersona');


                codigoCompraInput.value = '';
                formaDePagoInput.value = '';
                departamentoEntregaInput.value = '';
                direccionEntregaInput.value = '';
                horarioEntregaInput.value = '';
                telefonoReferenciaInput.value = '';


                codPersona.value = '';
            }


        </script>
    </head>
    <body>

        <form id="formulario" class="row g-3" action="Controlador?menu=VistaCompra" method="POST">
            <div class="col-md-6">
                <label id="txtDatos" for="inputState" class="form-label">Código Compra</label>
                <input type="text" class="form-control" id="inputcodigoCompra" readonly name="txtCodigoCompra" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Forma de pago</label>
                <select name="txtFormaDePago" class="form-select" id="inputformaDePago" required>
                    <option value="" disabled selected>Seleccione la forma de pago</option>
                    <option>Depósito o transferencia bancaria</option>
                    <option>Tarjeta de crédito o débito</option>
                    <option>Efectivo contra entrega</option>
                </select>
            </div>
            <div class="col-md-6" id="campoTarjeta" style="display: none;">
                <label id="txtDatos" class="form-label">Número de tarjeta</label>
                <input type="text" class="form-control" id="inputNumeroTarjeta" name="txtNumeroTarjeta">
            </div>
            <div class="col-md-6">

                <label id="txtDatos" class="form-label">Departamento</label>
                <select name="txtDepartamentoEntrega" id="inputdepartamentoEntrega"class="form-select" required>
                    <option value="" disabled selected>Seleccionar un departamento</option>
                    <option>Alta Verapaz</option>
                    <option>Baja Verapaz</option>
                    <option>Chimaltenango</option>
                    <option>Chiquimula</option>
                    <option>El Progreso</option>
                    <option>Escuintla</option>
                    <option>Guatemala</option>
                    <option>Huehuetenango</option>
                    <option>Izabal</option>
                    <option>Jalapa</option>
                    <option>Jutiapa</option>
                    <option>Petén</option>
                    <option>Quetzaltenango</option>
                    <option>Quiché</option>
                    <option>Retalhuleu</option>
                    <option>Sacatepéquez</option>
                    <option>San Marcos</option>
                    <option>Santa Rosa</option>
                    <option>Sololá</option>
                    <option>Suchitepéquez</option>
                    <option>Totonicapán</option>
                    <option>Zacapa</option>
                </select>


            </div>
            <div class="col-md-6">
                <label id="txtDatos" for="inputEmail4" class="form-label" >Dirección</label>
                <input type="text" class="form-control" id="inputdireccionEntrega" name="txtDireccionEntrega" placeholder="Calle, Avenida, Zona, Número de Casa o Apto. Etc." required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Horario De Entrega</label>
                <select name="txtHorarioEntrega" id="inputhorarioEntrega" class="form-select" required>
                    <option value="" disabled selected>Seleccione el dia y hora de la entrega</option>
                    <option>Lunes / 8:00 a.m. - 5:00 p.m.</option>
                    <option>Miercoles / 8:00 a.m. - 5:00 p.m.</option>
                    <option>Viernes / 8:00 a.m. - 5:00 p.m.</option>
                    <option>Sabado / 8:00 a.m. - 12:00 p.m.</option>
                </select>


            </div>
            <div class="col-md-6">
                <label id="txtDatos" for="inputState" class="form-label">Teléfono de referencia</label>
                <input type="text" class="form-control" id="inputtelefonoReferencia" name="txtTelefonoReferencia" required>
            </div>
            <div class="col-md-6">
                <label id="txtDatos" class="form-label">Seleccione el código del usuario </label>
                <select id="selectcodPersona" name="txtCodigoPersona" class="form-select">
                    <c:forEach var="persona" items="${personas}">
                        <option value="${persona.getCodigoPersona()}">${persona.getCodigoPersona()}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="col-12">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="gridCheck" required oninvalid="this.setCustomValidity('Debes marcar el checkbox para continuar.')" onchange="this.setCustomValidity('');">
                    <label class="form-check-label" for="gridCheck">
                        ¿Está de acuerdo que no se aceptan rembolsos ni devoluciones?
                    </label>
                </div>
            </div>
            <input id="buttonReady" type="submit" name="accion" value="Agregar"> <input id="buttonReady" style="width: 85px;" type="submit" name="accion" value="Actualizar"> <input id="buttonReady" style="width: 85px;" type="submit" name="accion" value="Eliminar"> <input id="buttonReady" style="width: 85px;" type="button" value="Cancelar" onclick="limpiarCampos();">
        </form>

        <table class="table" id="miTabla">
            <thead>
                <tr>
                    <th id="etiqueta">Código compra</th>
                    <th id="etiqueta">Forma de pago</th>
                    <th id="etiqueta">Departamento entega</th>
                    <th id="etiqueta">Dirección entrega</th>
                    <th id="etiqueta">Horario entrega</th>
                    <th id="etiqueta">Teléfono Referencia</th>
                    <th id="etiqueta">Código persona</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="compra" items="${compras}" varStatus="status">
                    <tr id="filaDatos${status.index}" style="cursor:pointer;">
                        <td id="codigoCompra${status.index}">${compra.getCodigoCompra()}</td>
                        <td id="formaDePago${status.index}">${compra.getFormaDePago()}</td>
                        <td id="departamentoEntrega${status.index}">${compra.getDepartamentoEntrega()}</td>
                        <td id="direccionEntrega${status.index}">${compra.getDireccionEntrega()}</td>
                        <td id="horarioEntrega${status.index}">${compra.getHorarioEntrega()}</td>
                        <td id="telefonoReferencia${status.index}">${compra.getTelefonoReferencia()}</td>
                        <td id="codigoPersona${status.index}">${compra.getCodigoPersona()}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    </body>
</html>