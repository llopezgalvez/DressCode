<%-- 
    Document   : index
    Created on : 5/07/2023, 05:19:57 PM
    Author     : informatica mchuquiej
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="css/cssInicio.css">
        <title>DressCode</title>
    </head>
    <body>
        <nav id="barraNavegacion" class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="images/iconoDC.png">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav">
                        
                        <li><a class="nav-link" aria-current="page" href="HomePage.jsp" target="frameDC">Home Page</a></li>
                        
                        <!-- Gestion de compra -->
                        <div class="dropdown">
                            <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-pressed="false" autocomplete="off">
                                Gestion de compra
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="nav-link" aria-current="page" href="Controlador?menu=VistaCompra&accion=Listar" target="frameDC">Compra</a></li>
                                <li><a class="nav-link" aria-current="page" href="Controlador?menu=VistaDetalleArticuloCompra&accion=Listar" target="frameDC">Detalle Artículo Compra</a></li>                                
                                <li><a class="nav-link" aria-current="page" href="Controlador?menu=VistaFactura&accion=Listar&codigoUsuario=${username.getCodigoUsuario()}&nombreUsuario=${username.getNombreUsuario()}&userName=${username.getUsername()}&apellidoUsuario=${username.getApellidoUsuario()}" target="frameDC">Factura</a></li>
                            </ul>
                        </div>
                            
                            
                            <!-- Boutique -->
                        <div class="dropdown">
                            <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-pressed="false" autocomplete="off">
                                Boutique
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="nav-link" aria-current="page" href="Controlador?menu=VistaCategoria&accion=Listar" target="frameDC">Categoria</a></li>
                                <li><a class="nav-link" aria-current="page" href="Controlador?menu=VistaMarca&accion=Listar" target="frameDC">Marca</a></li>
                                <li><a class="nav-link" aria-current="page" href="Controlador?menu=VistaArticulo&accion=Listar" target="frameDC">Artículo</a></li>
                            </ul>
                        </div>

                            <!-- Stakehouders -->
                        <div class="dropdown">
                            <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-pressed="false" autocomplete="off">
                                Stakehouders
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="nav-link" aria-current="page" href="Controlador?menu=VistaProveedor&accion=Listar" target="frameDC">Proveedor</a></li>
                                <li><a class="nav-link" aria-current="page" href="Controlador?menu=VistaEmpleado&accion=Listar" target="frameDC">Empleado</a></li>
                                <li><a class="nav-link" aria-current="page" href="Controlador?menu=VistaPersona&accion=Listar" target="frameDC">Persona</a></li>
                            </ul>
                        </div>

                        <div class="dropdown">
                            <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-pressed="false" autocomplete="off">
                                Clientes
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="nav-link" aria-current="page" href="Controlador?menu=VistaControlCalidad&accion=Listar&codigoUsuario=${username.getCodigoUsuario()}&nombreUsuario=${username.getNombreUsuario()}&usuario=${username.getUsername()}" target="frameDC">Control Calidad</a></li>
                                <li><a class="nav-link" aria-current="page" href="Controlador?menu=VistaUsuario&accion=Listar" target="frameDC">Usuario</a></li>
                            </ul>
                        </div>

                        <div class="dropdown">
                            <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-pressed="false" autocomplete="off">
                                ${username.getNombreUsuario()} ${username.getApellidoUsuario()}
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <center><img id="imgPerfil" src="ControladorIMG?idUsuario=${username.getCodigoUsuario()}"  width="30px" height="30px"></center>
                                <center><hr width="75%"></center>
                                <li><a class="dropdown-item bg-transparent" href="#">Usuario: ${username.getUsername()}</a></li>
                                <li><a class="dropdown-item bg-transparent" href="#">Contraseña: ${username.getContrasena()}</a></li>
                                <li><a class="dropdown-item bg-transparent" href="index.jsp">Salir</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <div class="m-4" style="height: 555px;">
            <iframe name="frameDC" style="height: 100%; width: 100%; border:none"></iframe>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    </body>
</html>