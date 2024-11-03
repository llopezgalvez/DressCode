$(document).ready(function () {
    // Inicializa el total en 0 y el array de productos en el carrito
    var carritoOffcanvas;
    var totalCarrito = 0;
    var carrito = [];

    // Función para agregar un producto al carrito
    function agregarAlCarrito(titulo, precio, imagen) {
        // Verificar si el producto ya está en el carrito
        var productoExistente = carrito.find(function (producto) {
            return producto.titulo === titulo;
        });

        if (productoExistente) {
            // Si el producto existe, aumenta la cantidad en 1
            productoExistente.cantidad++;
        } else {
            // Si el producto no existe, agrégalo al carrito con cantidad 1
            carrito.push({ titulo: titulo, precio: precio, cantidad: 1, imagen: imagen });
        }

        // Actualizar el HTML del carrito
        actualizarCarritoHTML();

        // Actualizar el total del carrito
        totalCarrito += precio;
        $("#total").text("Q" + totalCarrito.toFixed(2));
    }

    // Función para actualizar el HTML del carrito
    function actualizarCarritoHTML() {
        $("#lista-carrito").empty();

        carrito.forEach(function (producto) {
            // Crear una miniatura de la imagen (ajusta el ancho y alto según tus necesidades)
            var miniaturaImagen = '<img src="' + producto.imagen + '" alt="Producto" width="50" height="70">';

            // Crear un nuevo elemento de lista con la información del producto y la miniatura
            var elementoProducto = '<li class="list-group-item">' +
                '<div class="d-flex justify-content-between align-items-center">' +
                '<div>' +
                '<h6 class="mb-0">' + producto.titulo + '</h6>' +
                '<p class="mb-0">Q' + producto.precio.toFixed(2) + '</p>' +
                '</div>' +
                '<div class="d-flex align-items-center">' +
                '<button class="btn btn-sm btn-primary modificar-cantidad" style="margin: 2px;" data-operacion="restar">-</button>' +
                '<button class="btn btn-sm btn-primary modificar-cantidad" style="margin: 2px;" data-operacion="sumar">+</button>' +
                '<span class="cantidad">' + producto.cantidad + '</span>' +
                '</div>' +
                '<div class="mr-3">' + miniaturaImagen + '</div>' +
                '<!-- Botón de eliminación -->' +
                '<button class="btn btn-danger btn-sm eliminar-producto">Eliminar</button>' +
                '</div>' +
                '</li>';

            $("#lista-carrito").append(elementoProducto);
        });
    }

    // Manejar el evento clic en el botón "Agregar al carrito"
    $(".button-add").click(function () {
        // Obtener información del producto desde la tarjeta
        var imagenProducto = $(this).closest(".card").find(".img-fluid").attr("src");
        var tituloProducto = $(this).closest(".card").find(".card-title").text();
        var precioProducto = parseFloat($(this).closest(".card").find(".card-text").text().replace("Q", ""));

        // Agregar el producto al carrito
        agregarAlCarrito(tituloProducto, precioProducto, imagenProducto);

        // Mostrar el off-canvas con animación usando Bootstrap
        carritoOffcanvas = new bootstrap.Offcanvas(document.getElementById("carrito"));
        carritoOffcanvas.show();
        actualizarOffcanvas();
    });

    $('#carrito').on('hidden.bs.offcanvas', function () {
        // Restablecer data-bs-backdrop a "false" para permitir el desplazamiento
        $(this).attr('data-bs-backdrop', 'false');
    });

    $('#carrito').on('shown.bs.offcanvas', function () {
        // Asegurarse de que el off-canvas esté completamente abierto antes de permitir que se cierre
        $(this).attr('data-bs-backdrop', 'true');
    });

    $("#btnAbrirCarrito").click(function () {
        // Mostrar el off-canvas con animación usando Bootstrap
        var carritoOffcanvas = new bootstrap.Offcanvas(document.getElementById("carrito"));
        carritoOffcanvas.show();
    });

    // Manejar el evento clic en el botón "Eliminar" de cada producto
    $(document).on("click", ".eliminar-producto", function () {
        // Obtener el índice del producto en el carrito
        var index = $(this).closest("li").index();

        // Obtener el precio del producto a eliminar
        var precioEliminar = carrito[index].precio;
        var cantidadEliminar = carrito[index].cantidad;

        // Restar el precio del producto eliminado del total del carrito
        totalCarrito -= precioEliminar * cantidadEliminar;
        // Eliminar el producto del carrito y del HTML
        carrito.splice(index, 1);
        $(this).closest("li").remove();
        $("#total").text("Q" + totalCarrito.toFixed(2));
    });

    // Manejar el evento clic en los botones de modificar cantidad
    $(document).on("click", ".modificar-cantidad", function (e) {
        e.stopPropagation();
        var operacion = $(this).data("operacion"); // Obtener la operación (sumar o restar)
        var index = $(this).closest("li").index(); // Obtener el índice del producto en el carrito

        if (!$(this).hasClass("modificar-cantidad")) {
            return;
        }

        if (operacion === "sumar") {
            // Aumentar la cantidad en 1
            carrito[index].cantidad++;
        } else if (operacion === "restar" && carrito[index].cantidad > 1) {
            // Restar la cantidad en 1, pero no permitir que sea menor a 1
            carrito[index].cantidad--;
        }

        // Actualizar el HTML del carrito y el total
        actualizarCarritoHTML();
        actualizarTotalCarrito();
    });

    // Función para actualizar el total del carrito
    function actualizarTotalCarrito() {
        totalCarrito = carrito.reduce(function (total, producto) {
            return total + producto.precio * producto.cantidad;
        }, 0);

        $("#total").text("Q" + totalCarrito.toFixed(2));
    }

    function actualizarOffcanvas() {
        if (carritoOffcanvas && carritoOffcanvas.isShown) {
            // Establecer data-bs-backdrop en "true" cuando el off-canvas se muestra
            $("#carrito").removeAttr("data-bs-backdrop");
        }
    }
});


function comprar() {
    Swal.fire({
        icon: 'success',
        title: '¡Compra realizada correctamente!',
        text: 'Gracias por ser parte de la familia Dresscode. ¡Esperamos verte pronto!',
        confirmButtonText: 'Aceptar',
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            location.reload();
        }
    })
}