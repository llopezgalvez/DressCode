<%-- 
    Document   : HomePage
    Created on : 13/09/2023, 01:43:44 AM
    Author     : Ana
--%>

<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
  <link rel="stylesheet" href="css/style.css">
  <link rel="shortcut icon" href="favicon.ico" type="image/iconoDC.png">
  <title>Dress Code</title>
</head>

<body style="background-color: #EFEFEF;">
  <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
          <img src="img/banner6.png" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
          <img src="img/banner7.png" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
          <img src="img/banner8.png" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
          <img src="img/banner9.png" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
          <img src="img/banner10.png" class="d-block w-100" alt="...">
      </div>
    </div>
  </div>

  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid justify-content-center text-center">
        <a class="navbar-brand" href="HomePage.jsp">DressCode</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse flex-grow-0" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
              <a class="nav-link" aria-current="page" href="VistaArticulosFormales.jsp">Ropa Formal</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" href="VistaArticulosCasuales.jsp">Ropa Casual</a>
          </li>
          <li class="nav-item">
              <a class="nav-link" href="VistaArticulosDeportivos.jsp">Ropa Deportiva</a>
          </li>
          <li class="nav-item">
            <button class="nav-link" id="btnAbrirCarrito">Mi carrito</button>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Principal.jsp">Mi perfil</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <center>
    <h1>Las mejores ofertas</h1>
  </center>

  <div id="carouselExampleDark" class="carousel carousel-dark slide">
    <div id="cuerpoCarru" class="carousel-inner">
      <div class="carousel-item active" data-bs-interval="10000">
        <div class="cards-wrapper">
          <div class="row row-cols-1 row-cols-md-3 g-4 mb-4">
            <div class="col col-md-4 mb-4">
              <div id="cartita" class="card" style="max-width: 40%; max-height: 200px;">
                <span class="badge rounded-pill text-bg-warning" style="width: 30%;">50%</span>
                <img src="img/Blue Mustang Regular Jeans, Celeste.jpeg" class="img-fluid rounded-start"
                  alt="...">
                <div class="card-body d-flex flex-column">
                  <center>
                    <h5 class="card-title">Blue Mustang Regular Jeans, Celeste</h5>
                    <p id="precioNormal">Q520</p>
                    <p id="precioDescuento" class="card-text">Q260</p>
                    <button class="button-add">Agregar al carrito</button>
                  </center>
                </div>
              </div>
            </div>
            <div class="col col-md-4 mb-4">
              <div id="cartita" class="card" style="max-width: 40%; max-height: 200px;">
                <span class="badge rounded-pill text-bg-warning" style="width: 30%;">30%</span>
                <img src="img/Sudadera con capucha de felpa de algodon con ilustracion de temporada.jpeg"
                  class="img-fluid rounded-start" alt="...">
                <div class="card-body d-flex flex-column">
                  <center>
                    <h5 class="card-title">Sudadera con capucha</h5>
                    <p id="precioNormal">Q600</p>
                    <p id="precioDescuento" class="card-text">Q420</p>
                    <button class="button-add">Agregar al carrito</button>
                  </center>
                </div>
              </div>
            </div>
            <div class="col col-md-4 mb-4">
              <div id="cartita" class="card" style="max-width: 40%; max-height: 200px;">
                <span class="badge rounded-pill text-bg-warning" style="width: 30%;">35%</span>
                <img src="img/Camisa extra slim fit de popelin de mezcla de algodon de planchado facil.jpeg"
                  class="img-fluid rounded-start" alt="...">
                <div class="card-body d-flex flex-column">
                  <center>
                    <h5 class="card-title">Camisa extra Slim Fit</h5>
                    <p id="precioNormal">Q1100</p>
                    <p id="precioDescuento" class="card-text">Q715</p>
                    <button class="button-add">Agregar al carrito</button>
                  </center>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="carousel-item" data-bs-interval="2000">
        <div class="cards-wrapper">
          <div class="row row-cols-1 row-cols-md-3 g-4 mb-4">
            <div class="col col-md-4 mb-4">
              <div id="cartita" class="card" style="max-width: 50%; max-height: 200px;">
                <span class="badge rounded-pill text-bg-warning" style="width: 30%;">10%</span>
                <img src="img/Tenis futsal deportivo in bk.jpeg" class="img-fluid rounded-start" alt="...">
                <div class="card-body d-flex flex-column">
                  <center>
                    <h5 class="card-title">Tenis Futsal Deportivo IN Bk</h5>
                    <p id="precioNormal">Q530</p>
                    <p id="precioDescuento" class="card-text">Q477</p>
                    <button class="button-add">Agregar al carrito</button>
                  </center>
                </div>
              </div>
            </div>
            <div class="col col-md-4 mb-4">
              <div id="cartita" class="card" style="max-width: 60%; max-height: 200px;">
                <span class="badge rounded-pill text-bg-warning" style="width: 30%;">25%</span>
                <img src="img/Adidas Gamemode TF.jpeg" class="img-fluid rounded-start" alt="...">
                <div class="card-body d-flex flex-column">
                  <center>
                    <h5 class="card-title">Adidas Gamemode TF</h5>
                    <p id="precioNormal">Q1030</p>
                    <p id="precioDescuento" class="card-text">Q773</p>
                    <button class="button-add">Agregar al carrito</button>
                  </center>
                </div>
              </div>
            </div>
            <div class="col col-md-4 mb-4">
              <div id="cartita" class="card" style="max-width: 50%; max-height: 200px;">
                <span class="badge rounded-pill text-bg-warning" style="width: 30%;">15%</span>
                <img src="img/Pans Training RM Tiro 23.jpeg" class="img-fluid rounded-start" alt="...">
                <div class="card-body d-flex flex-column">
                  <center>
                    <h5 class="card-title">Pans Training RM Tiro 23</h5>
                    <p id="precioNormal">Q765</p>
                    <p id="precioDescuento" class="card-text">Q650</p>
                    <button class="button-add">Agregar al carrito</button>
                  </center>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <div class="cards-wrapper">
          <div class="row row-cols-1 row-cols-md-3 g-4 mb-4">
            <div class="col col-md-4 mb-4">
              <div id="cartita" class="card h-100" style="max-width: 40%; max-height: 200px;">
                <span class="badge rounded-pill text-bg-warning" style="width: 30%;">20%</span>
                <img src="img/Productos/saco-negro-1.png" class="img-fluid rounded-start" alt="...">
                <div class="card-body d-flex flex-column">
                  <center>
                    <h5 class="card-title">Saco Color Negro</h5>
                    <p id="precioNormal">Q1400</p>
                    <p id="precioDescuento" class="card-text">Q1120</p>
                    <button class="button-add">Agregar al carrito</button>
                  </center>
                </div>
              </div>
            </div>
            <div class="col col-md-4 mb-4">
              <div id="cartita" class="card" style="max-width: 50%; max-height: 200px;">
                <span class="badge rounded-pill text-bg-warning" style="width: 30%;">10%</span>
                <img src="img/Productos/Tenis Casuales Color Pastel.jpg" class="img-fluid rounded-start" alt="...">
                <div class="card-body d-flex flex-column">
                  <center>
                    <h5 class="card-title">Tenis casuales colores pastel</h5>
                    <p id="precioNormal">Q350</p>
                    <p id="precioDescuento" class="card-text">Q315</p>
                    <button class="button-add">Agregar al carrito</button>
                  </center>
                </div>
              </div>
            </div>
            <div class="col col-md-4 mb-4">
              <div id="cartita" class="card" style="max-width: 40%; max-height: 200px;">
                <span class="badge rounded-pill text-bg-warning" style="width: 30%;">50%</span>
                <img src="img/Productos/Joey Slim Jeans, Azul Claro.jpeg" class="img-fluid rounded-start" alt="...">
                <div class="card-body d-flex flex-column">
                  <center>
                    <h5 class="card-title">Joey slim jeans, azul claro</h5>
                    <p id="precioNormal">Q520</p>
                    <p id="precioDescuento" class="card-text">Q260</p>
                    <button class="button-add">Agregar al carrito</button>
                  </center>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
  <br>

  <center>
    <div id="cartita2" class="card" style="max-width: 20%; max-height: 300px;"">
      <div class=" card-body" style="background-color: #900C3F; color: white;">
      <h4 class="card-title">Compras f�ciles</h4><br>
      <hr>
      <br>
      <p class="card-text" style="font-size: large;">DressCode est� hecho para que puedas realizar tus compras online de la mejor manera, con una p�gina intuitiva que te ayuda a realizar tus compras, de una manera r�pida y sencilla.</p>
    </div>
    </div>
    <div id="cartita2" class="card" style="max-width: 20%; max-height: 300px;"">
      <div class=" card-body" style="background-color: #C70039; color: white;">
      <h4 class="card-title">Seguridad</h4><br>
      <hr>
      <br>
      <br>
      <p class="card-text" style="font-size: large;">DressCode es una empresa que cuida cada peque�o detalle en cuanto a la seguridad de tu compra y producto, siente seguro comprando en DressCode.</p>
    </div>
    </div>
    <div id="cartita2" class="card" style="max-width: 20%; max-height: 500px;"">
      <div class=" card-body" style="background-color: #F94C10; color: white;">
      <h4 class="card-title">Env�os</h4><br>
      <hr>
      <br>
      <p class="card-text" style="font-size: large;">No importa donde residas, con los env�os a domicilio, puedes recibir los mejores productos al mejor precio, con la mejor seguridad e integridad, solo en DressCode.</p>
    </div>
    </div>
    <div id="cartita2" class="card" style="max-width: 20%; max-height: 300px;"">
      <div class=" card-body" style="background-color: #51050F; color: white;">
      <h4 class="card-title">Marcas originales</h4><br>
      <hr>
      <br>
      <p class="card-text" style="font-size: large;">El producto que DressCode tiene, es 100% original, y cuentan con la garant�a del proveedor, as� que si�ntete tranquilo, que en DressCode, obtienes siempre la mejor calidad.</p>
    </div>
    </div>
  </center>



  <!-- Carrito de Compras -->
  <div class="offcanvas offcanvas-end" tabindex="-1" id="carrito" data-bs-backdrop="false">
    <div class="offcanvas-header">
      <h5 class="offcanvas-title">Carrito de Compras</h5>
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
      <ul class="list-group" id="lista-carrito">
        <!-- Cada elemento del carrito tendr� botones para modificar la cantidad -->
        <li class="list-group-item">
          <div class="d-flex justify-content-between align-items-center">
            <div>
              <h6 class="mb-0">Nombre del producto</h6>
              <p class="mb-0">Q0.00</p>
            </div>
            <div class="d-flex align-items-center">
              <button class="btn btn-sm btn-primary modificar-cantidad" data-operacion="restar">-</button>
              <button class="btn btn-sm btn-primary modificar-cantidad" data-operacion="sumar">+</button>
              <span class="cantidad">1</span>
            </div>
            <!-- Bot�n de eliminaci�n -->
            <button class="btn btn-danger btn-sm eliminar-producto">Eliminar</button>
          </div>
        </li>
        <!-- Otros elementos del carrito se agregar�n de manera similar -->
      </ul>
      <div class="mt-3">
        <h6>Total: <span id="total">Q0.00</span></h6>
        <input type="button" class="btn btn-success" value="Realizar compra" onclick="comprar()">
      </div>
    </div>
  </div>

  <footer>
    <div class="footer-container">
      <h2>DressCode</h2>
      <ul class="footer-menu">
        <li><a href="#">Qui�nes somos</a></li>
        <li><a href="#">Pol�ticas de privacidad</a></li>
        <li><a href="#">Pol�ticas de garant�a</a></li>
        <li><a href="#">Preguntas frecuentes</a></li>
        <li><a href="#">Nuestros fundadores</a></li>
        <li><a href="#">Proveedores</a></li>
        <li><a href="#">Derechos de autor</a></li>
        <li><a href="#">Servicio al cliente</a></li>
      </ul>
    </div>
  </footer>


  <script src="app.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
    crossorigin="anonymous"></script>
</body>

</html>
