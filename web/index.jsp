<%-- 
    Document   : index
    Created on : 16/08/2023, 08:17:22 PM
    Author     : al3ja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="css/cssPrincipal.css">
        <title>DressCode</title>
    </head>
    <body>
        <div class="card mb-3" style="width: 900px;">
            <div class="row g-0">
                <!-- Columna para la imagen (mitad izquierda) -->
                <div id="imgLogin2" class="col-md-4 d-flex justify-content-center align-items-center">
                    <img id="imgInicio" src="images/Inicio.png" class="img-fluid">
                </div>
                <!-- Columna para el contenido (mitad derecha) -->
                <div id="content2" class="col-md-4  d-flex justify-content-center align-items-center">
                    <div class="card-body">
                        <center>
                            <h5 class="card-title">¡Bienvenido!</h5>
                            <h4 class="card-title">DressCode</h4>
                            <form class="form-sign" action="Validar" method="POST">
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Usuario</label>
                                    <input type="text" class="form-control" id="inputsIngreso" name="txtUser" aria-describedby="emailHelp" placeholder="usuario">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Contraseña</label>
                                    <input type="password" class="form-control" id="inputsIngreso" name="txtPass" placeholder="******">
                                </div>
                                <label id="note" class="form-label">Si no tienes usuario, puedes registrarte</label><br>
                                <a type="button" class="btn btn-dark" data-toggle="modal" data-target="#registroModal">Registrarme</a>
                                <input type="submit" name="accion" value="Ingresar" class="btn btn-primary btn-block">
                            </form>
                        </center>
                    </div>
                </div>
            </div>
        </div>



        <div class="modal fade modal-blur" id="registroModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <h4 class="modal-title" style="margin: 0 auto; margin-top: 5px;">Registro de Usuario</h4>
                    <br>
                    <div class="modal-body">
                        <form action="Controlador?menu=index" method="POST" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label id="registroData"  for="nombre">Nombre:</label>
                                        <input type="text" style="text-align: right" class="form-control" id="inputsIngresoR" name="txtNombreUsuarioL" placeholder="Ingresa tu nombre">
                                    </div>
                                    <br>
                                    <div class="form-group">
                                        <label id="registroData" for="apellido">Apellido:</label>
                                        <input type="text" style="text-align: right" class="form-control" id="inputsIngresoR" name="txtApellidoUsuarioL" placeholder="Ingresa tu apellido">
                                    </div>
                                    <br>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label id="registroData" for="correoElectronico">Correo electrónico:</label>
                                        <input type="email" style="text-align: right" class="form-control" id="inputsIngresoR" name="txtCorreoUsuarioL" placeholder="micorreo@gmail.com">
                                    </div>
                                    <br>
                                    <div class="form-group">
                                        <label id="registroData" for="username">Username:</label>
                                        <input type="text" style="text-align: right" class="form-control" id="inputsIngresoR" name="txtUsernameL" placeholder="Crea tu usuario">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label id="registroData" for="contraseña">Contraseña:</label>
                                    <input type="text" style="text-align: right" class="form-control" id="inputsIngresoR" name="txtContrasenaL" placeholder="Crea una contraseña">
                                    <br>
                                </div>
                                <div class="form-group">
                                    <label id="registroData" for="contraseña">Foto de perfil:</label>
                                    <input type="file" class="form-control" id="fotoPerfil" name="fotoUsuarioL">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-dark" data-dismiss="modal">Cancelar</button>
                                <input type="submit" class="btn btn-primary" name="accion" value="Agregar">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
