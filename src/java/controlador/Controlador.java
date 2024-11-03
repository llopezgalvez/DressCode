/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modelo.Articulo;
import modelo.ArticuloDAO;
import modelo.Categoria;
import modelo.CategoriaDAO;
import modelo.Compra;
import modelo.CompraDAO;
import modelo.ControlCalidad;
import modelo.ControlCalidadDAO;
import modelo.DetalleArticuloCompra;
import modelo.DetalleArticuloCompraDAO;
import modelo.Empleado;
import modelo.EmpleadoDAO;
import modelo.Factura;
import modelo.FacturaDAO;
import modelo.Marca;
import modelo.MarcaDAO;
import modelo.Persona;
import modelo.PersonaDAO;
import modelo.Proveedor;
import modelo.ProveedorDAO;
import modelo.Usuario;
import modelo.UsuarioDAO;

/**
 *
 * @author informatica
 */
@MultipartConfig
public class Controlador extends HttpServlet {

    //Usuario
    Usuario usuario = new Usuario();
    UsuarioDAO usuarioDao = new UsuarioDAO();
    int codUsuario;

    //MARCA
    Marca marca = new Marca();
    MarcaDAO marcaDao = new MarcaDAO();
    int codMarca;

    //COMPRA
    Compra compra = new Compra();
    CompraDAO compraDao = new CompraDAO();
    int codCompra;

    //CATEGORIA
    Categoria categoria = new Categoria();
    CategoriaDAO categoriaDao = new CategoriaDAO();
    int codCategoria;

    //PROVEEDOR
    Proveedor proveedor = new Proveedor();
    ProveedorDAO proveedorDao = new ProveedorDAO();
    int codProveedor;

    //CONTROL CALIDAD
    ControlCalidad controlCalidad = new ControlCalidad();
    ControlCalidadDAO controlCalidadDao = new ControlCalidadDAO();
    int codControlCalidad;

    //Articulo
    Articulo articulo = new Articulo();
    ArticuloDAO articuloDao = new ArticuloDAO();
    int codArticulo;

    // Empleado
    Empleado empleado = new Empleado();
    EmpleadoDAO empleadoDAO = new EmpleadoDAO();
    int codEmpleado;

    //DetalleArticulocompra
    DetalleArticuloCompra detalleArticuloCompra = new DetalleArticuloCompra();
    DetalleArticuloCompraDAO detalleArticuloCompraDao = new DetalleArticuloCompraDAO();
    int codDetalleArticuloCompra;

    // PERSONA
    Persona persona = new Persona();
    PersonaDAO personaDao = new PersonaDAO();
    int codPersona;

    //FACTURA
    Factura factura = new Factura();
    FacturaDAO facturaDao = new FacturaDAO();
    int codFactura;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if (menu.equals("Principal")) {
            request.getRequestDispatcher("Principal.jsp").forward(request, response);

            //CRUD USUARIO
        } else if (menu.equals("VistaUsuario")) {
            switch (accion) {
                case "Listar":
                    List listaUsuarios = usuarioDao.Listar();
                    request.setAttribute("usuario", listaUsuarios);
                    break;
                case "Agregar":
                    String nombreUsuario = request.getParameter("txtNombreUsuario");
                    String apellidoUsuario = request.getParameter("txtApellidoUsuario");
                    String correoUsuario = request.getParameter("txtCorreoUsuario");
                    String username = request.getParameter("txtUsername");
                    String contrasena = request.getParameter("txtContrasena");
                    Part part = request.getPart("fotoUsuario");
                    InputStream inputStream = part.getInputStream();
                    usuario.setNombreUsuario(nombreUsuario);
                    usuario.setApellidoUsuario(apellidoUsuario);
                    usuario.setCorreoUsuario(correoUsuario);
                    usuario.setUsername(username);
                    usuario.setContrasena(contrasena);
                    usuario.setFoto(inputStream);
                    usuarioDao.agregar(usuario);
                    request.getRequestDispatcher("Controlador?menu=VistaUsuario&accion=Listar").forward(request, response);
                    break;
                /*    
                case "Editar":
                    codUsuario = Integer.parseInt(request.getParameter("txtCodigoUsuario"));
                    Usuario u = usuarioDao.listarCodigoUsuario(codUsuario);
                    request.setAttribute("usuarioEncontrado", u);
                    request.getRequestDispatcher("Controlador?menu=VistaUsuario&accion=Listar").forward(request, response);
                    break;
                 */

                case "Actualizar":
                    int codUsuarioA = Integer.parseInt(request.getParameter("txtCodigoUsuario"));
                    String nombreUsuarioE = request.getParameter("txtNombreUsuario");
                    String apellidoUsuarioE = request.getParameter("txtApellidoUsuario");
                    String correoUsuarioE = request.getParameter("txtCorreoUsuario");
                    String usernameE = request.getParameter("txtUsername");
                    String contrasenaE = request.getParameter("txtContrasena");
                    Part partE = request.getPart("fotoUsuario");
                    InputStream inputStreamE = partE.getInputStream();
                    usuario.setNombreUsuario(nombreUsuarioE);
                    usuario.setApellidoUsuario(apellidoUsuarioE);
                    usuario.setCorreoUsuario(correoUsuarioE);
                    usuario.setUsername(usernameE);
                    usuario.setContrasena(contrasenaE);
                    usuario.setFoto(inputStreamE);
                    usuario.setCodigoUsuario(codUsuarioA);
                    usuarioDao.actualizar(usuario);
                    request.getRequestDispatcher("Controlador?menu=VistaUsuario&accion=Listar").forward(request, response);
                    break;

                case "Eliminar":
                    int codUsuarioE = Integer.parseInt(request.getParameter("txtCodigoUsuario"));
                    usuarioDao.eliminar(codUsuarioE);
                    request.getRequestDispatcher("Controlador?menu=VistaUsuario&accion=Listar").forward(request, response);

                    break;
            }
            request.getRequestDispatcher("VistaUsuario.jsp").forward(request, response);

            //CRUD Marca
        } else if (menu.equals("VistaMarca")) {
            switch (accion) {
                case "Listar":
                    List listaMarcas = marcaDao.listar();
                    request.setAttribute("marcas", listaMarcas);

                    List listaProveedor = proveedorDao.listar();
                    request.setAttribute("proveedores", listaProveedor);
                    break;
                case "Agregar":
                    String nameMarca = request.getParameter("txtNombreMarca");
                    String direcMarca = request.getParameter("txtDireccionMarca");
                    String corrMarca = request.getParameter("txtCorreoMarca");
                    int codProvee = Integer.parseInt(request.getParameter("txtCodigoProveedor"));
                    marca.setNombreMarca(nameMarca);
                    marca.setDireccionMarca(direcMarca);
                    marca.setCorreoMarca(corrMarca);
                    marca.setCodigoProveedor(codProvee);
                    marcaDao.agregar(marca);
                    request.getRequestDispatcher("Controlador?menu=VistaMarca&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    int codMarcaA = Integer.parseInt(request.getParameter("txtCodigoMarca"));
                    String nameMarcaA = request.getParameter("txtNombreMarca");
                    String direcMarcaA = request.getParameter("txtDireccionMarca");
                    String corrMarcaA = request.getParameter("txtCorreoMarca");
                    marca.setNombreMarca(nameMarcaA);
                    marca.setDireccionMarca(direcMarcaA);
                    marca.setCorreoMarca(corrMarcaA);
                    marca.setCodigoMarca(codMarcaA);
                    marcaDao.actualizar(marca);
                    request.getRequestDispatcher("Controlador?menu=VistaMarca&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codMarca = Integer.parseInt(request.getParameter("txtCodigoMarca"));
                    marcaDao.eliminar(codMarca);
                    request.getRequestDispatcher("Controlador?menu=VistaMarca&accion=Listar").forward(request, response);
                    break;
            }
            request.getRequestDispatcher("VistaMarca.jsp").forward(request, response);
            // CRUD COMPRA
        } else if (menu.equals("VistaCompra")) {
            switch (accion) {
                case "Listar":
                    List listaCompra = compraDao.listar();
                    request.setAttribute("compras", listaCompra);

                    List listaPersona = personaDao.listar();
                    request.setAttribute("personas", listaPersona);
                    break;
                case "Agregar":

                    String FormaPago = request.getParameter("txtFormaDePago");
                    String DepartamentoEntrega = request.getParameter("txtDepartamentoEntrega");
                    String DireccionEntrega = request.getParameter("txtDireccionEntrega");
                    String HorarioEntrega = request.getParameter("txtHorarioEntrega");
                    String TelefonoRef = request.getParameter("txtTelefonoReferencia");
                    int codPer = Integer.parseInt(request.getParameter("txtCodigoPersona"));
                    compra.setFormaDePago(FormaPago);
                    compra.setDepartamentoEntrega(DepartamentoEntrega);
                    compra.setDireccionEntrega(DireccionEntrega);
                    compra.setHorarioEntrega(HorarioEntrega);
                    compra.setTelefonoReferencia(TelefonoRef);
                    compra.setCodigoPersona(codPer);
                    compraDao.agregar(compra);
                    request.getRequestDispatcher("Controlador?menu=VistaCompra&accion=Listar").forward(request, response);

                case "Actualizar":
                    int codCompraA = Integer.parseInt(request.getParameter("txtCodigoCompra"));
                    String FormaPagoA = request.getParameter("txtFormaDePago");
                    String DepartamentoEntregaA = request.getParameter("txtDepartamentoEntrega");
                    String DireccionEntregaA = request.getParameter("txtDireccionEntrega");
                    String HorarioEntregaA = request.getParameter("txtHorarioEntrega");
                    String TelefonoRefA = request.getParameter("txtTelefonoReferencia");
                    compra.setFormaDePago(FormaPagoA);
                    compra.setDepartamentoEntrega(DepartamentoEntregaA);
                    compra.setDireccionEntrega(DireccionEntregaA);
                    compra.setHorarioEntrega(HorarioEntregaA);
                    compra.setTelefonoReferencia(TelefonoRefA);
                    compra.setCodigoCompra(codCompraA);
                    compraDao.actualizar(compra);
                    request.getRequestDispatcher("Controlador?menu=VistaCompra&accion=Listar").forward(request, response);

                    break;

                case "Eliminar":
                    codCompra = Integer.parseInt(request.getParameter("txtCodigoCompra"));
                    compraDao.eliminar(codCompra);
                    request.getRequestDispatcher("Controlador?menu=VistaCompra&accion=Listar").forward(request, response);

                    break;
            }

            request.getRequestDispatcher("VistaCompra.jsp").forward(request, response);

            //CRUD CATEGORIA
        } else if (menu.equals("VistaCategoria")) {
            switch (accion) {
                case "Listar":
                    List listaCategoria = categoriaDao.listar();
                    request.setAttribute("categoria", listaCategoria);
                    break;
                case "Agregar":

                    String descripcion = request.getParameter("txtDescripcion");
                    String clasificacion = request.getParameter("txtClasificacion");
                    int tallasDisponibles = Integer.parseInt(request.getParameter("txtTallasDisponibles"));
                    String temporada = request.getParameter("txtTemporada");
                    categoria.setDescripcion(descripcion);
                    categoria.setClasificacion(clasificacion);
                    categoria.setTallasDisponibles(tallasDisponibles);
                    categoria.setTemporada(temporada);
                    categoriaDao.agregar(categoria);
                    request.getRequestDispatcher("Controlador?menu=VistaCategoria&accion=Listar").forward(request, response);

                    break;
                case "Actualizar":
                    int codigoCate = Integer.parseInt(request.getParameter("txtCodigoCategoria"));
                    String descrip = request.getParameter("txtDescripcion");
                    String clasifi = request.getParameter("txtClasificacion");
                    int tallasD = Integer.parseInt(request.getParameter("txtTallasDisponibles"));
                    String tempo = request.getParameter("txtTemporada");
                    categoria.setDescripcion(descrip);
                    categoria.setClasificacion(clasifi);
                    categoria.setTallasDisponibles(tallasD);
                    categoria.setTemporada(tempo);
                    categoria.setCodigoCategoria(codigoCate);
                    categoriaDao.actualizar(categoria);
                    request.getRequestDispatcher("Controlador?menu=VistaCategoria&accion=Listar").forward(request, response);
                    break;

                case "Eliminar":
                    int codCategoriaC = Integer.parseInt(request.getParameter("txtCodigoCategoria"));
                    categoriaDao.eliminar(codCategoriaC);
                    request.getRequestDispatcher("Controlador?menu=VistaCategoria&accion=Listar").forward(request, response);
                    break;
            }

            request.getRequestDispatcher("VistaCategoria.jsp").forward(request, response);

            //CRUD CONTROL CALIDAD
        } else if (menu.equals("VistaControlCalidad")) {
            switch (accion) {
                case "Listar":
                    List listaControlCalidad = controlCalidadDao.listar();
                    request.setAttribute("control", listaControlCalidad);
                    break;
                case "Agregar":
                    int codigoUsuarioControl = Integer.parseInt(request.getParameter("txtCodigoUsuarioControl"));
                    String nombreUsuarioControl = request.getParameter("txtNombreUsuario");
                    String nombreUser = request.getParameter("txtUserName");

                    String motivo = request.getParameter("txtMotivo");
                    String descripcionMotivo = request.getParameter("txtMotivoDescripcion");

                    controlCalidad.setMotivo(motivo);
                    controlCalidad.setDescripcionCalidad(descripcionMotivo);
                    controlCalidad.setCodigoUsuario(codigoUsuarioControl);

                    controlCalidadDao.agregar(controlCalidad);

                    request.getRequestDispatcher("Controlador?menu=VistaControlCalidad&accion=Listar&codigoUsuario=" + codigoUsuarioControl + "&nombreUsuario=" + nombreUsuarioControl + "&usuario=" + nombreUser).forward(request, response);
                    break;

            }

            request.getRequestDispatcher("VistaControlCalidad.jsp").forward(request, response);

            //CRUD PROVEEDOR
        } else if (menu.equals("VistaProveedor")) {
            switch (accion) {
                case "Listar":
                    List listaProveedor = proveedorDao.listar();
                    request.setAttribute("proveedores", listaProveedor);
                    break;
                case "Agregar":
                    String nameProv = request.getParameter("txtNombreProveedor");
                    String teleProv = request.getParameter("txtTelefonoProveedor");
                    String direcProv = request.getParameter("txtDireccionProveedor");
                    String correProv = request.getParameter("txtCorreoProveedor");
                    proveedor.setNombreProveedor(nameProv);
                    proveedor.setTelefonoProveedor(teleProv);
                    proveedor.setDireccionProveedor(direcProv);
                    proveedor.setCorreoProveedor(correProv);
                    proveedorDao.agregar(proveedor);
                    request.getRequestDispatcher("Controlador?menu=VistaProveedor&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    int codProvA = Integer.parseInt(request.getParameter("txtCodigoProveedor"));
                    String nameProvA = request.getParameter("txtNombreProveedor");
                    String teleProvA = request.getParameter("txtTelefonoProveedor");
                    String direcProvA = request.getParameter("txtDireccionProveedor");
                    String correProvA = request.getParameter("txtCorreoProveedor");
                    proveedor.setNombreProveedor(nameProvA);
                    proveedor.setTelefonoProveedor(teleProvA);
                    proveedor.setDireccionProveedor(direcProvA);
                    proveedor.setCorreoProveedor(correProvA);
                    proveedor.setCodigoProveedor(codProvA);
                    proveedorDao.actualizar(proveedor);
                    request.getRequestDispatcher("Controlador?menu=VistaProveedor&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codProveedor = Integer.parseInt(request.getParameter("txtCodigoProveedor"));
                    proveedorDao.eliminar(codProveedor);
                    request.getRequestDispatcher("Controlador?menu=VistaProveedor&accion=Listar").forward(request, response);
                    break;
            }

            request.getRequestDispatcher("VistaProveedor.jsp").forward(request, response);

            //CRUD ARTICULO
        } else if (menu.equals("VistaArticulo")) {
            switch (accion) {
                case "Listar":
                    List listaArticulos = articuloDao.listar();
                    request.setAttribute("articulos", listaArticulos);

                    List listaMarcas = marcaDao.listar();
                    request.setAttribute("marcas", listaMarcas);

                    List listaCategorias = categoriaDao.listar();
                    request.setAttribute("categorias", listaCategorias);
                    break;
                case "Agregar":

                    String tallaArt = request.getParameter("txtTalla");
                    String colorArt = request.getParameter("txtColor");
                    String materialArt = request.getParameter("txtMaterial");
                    Double precioArt = Double.parseDouble(request.getParameter("txtPrecio"));
                    int existenciaArt = Integer.parseInt(request.getParameter("txtExistencia"));
                    int codCat = Integer.parseInt(request.getParameter("cmbCodigoCategoria"));
                    int codMar = Integer.parseInt(request.getParameter("cmbCodigoMarca"));
                    articulo.setTalla(tallaArt);
                    articulo.setColorArticulo(colorArt);
                    articulo.setMaterialArticulo(materialArt);
                    articulo.setPrecio(precioArt);
                    articulo.setExistenciaArticulo(existenciaArt);
                    articulo.setCodigoCategoria(codCat);
                    articulo.setCodigoMarca(codMar);
                    articuloDao.agregar(articulo);
                    request.getRequestDispatcher("Controlador?menu=VistaArticulo&accion=Listar").forward(request, response);
                    break;

                case "Actualizar":
                    int codArticuloArti = Integer.parseInt(request.getParameter("txtCodigoArticulo"));
                    String tallaArti = request.getParameter("txtTalla");
                    String colorArti = request.getParameter("txtColor");
                    String materialArti = request.getParameter("txtMaterial");
                    Double precioArti = Double.parseDouble(request.getParameter("txtPrecio"));
                    int existenciaArti = Integer.parseInt(request.getParameter("txtExistencia"));

                    articulo.setTalla(tallaArti);
                    articulo.setColorArticulo(colorArti);
                    articulo.setMaterialArticulo(materialArti);
                    articulo.setPrecio(precioArti);
                    articulo.setExistenciaArticulo(existenciaArti);
                    articulo.setCodigoArticulo(codArticuloArti);
                    articuloDao.actualizar(articulo);

                    request.getRequestDispatcher("Controlador?menu=VistaArticulo&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":

                    codArticulo = Integer.parseInt(request.getParameter("txtCodigoArticulo"));
                    articuloDao.eliminar(codArticulo);
                    request.getRequestDispatcher("Controlador?menu=VistaArticulo&accion=Listar").forward(request, response);
                    break;
            }

            request.getRequestDispatcher("VistaArticulo.jsp").forward(request, response);

            //CRUD EMPLEADO
        } else if (menu.equals("VistaEmpleado")) {
            switch (accion) {
                case "Listar":
                    //Guardamos los datos en la lista a través del método listar.
                    List listaEmpleados = empleadoDAO.listarEmpleado();
                    //Asignamos el objeto que los engloba para asignarlos en la tabla del JSP.
                    request.setAttribute("empleados", listaEmpleados);
                    break;
                case "Agregar":
                    // Asignamos los datos del JSP en variables.
                    String nomEmpleado = request.getParameter("txtNombreEmpleado");
                    String apellEmpleado = request.getParameter("txtApellidoEmpleado");
                    String puestEmpleado = request.getParameter("txtPuestoEmpleado");
                    String telEmpleado = request.getParameter("txtTelefonoEmpleado");
                    // Mandamos a asignar los datos directo en el modelo.
                    empleado.setNombreEmpleado(nomEmpleado);
                    empleado.setApellidoEmpleado(apellEmpleado);
                    empleado.setPuestoEmpleado(puestEmpleado);
                    empleado.setTelefonoEmpleado(telEmpleado);
                    //Llamamos al método Agregar.
                    empleadoDAO.agregarEmpleado(empleado);
                    //Redireccionamos a Listar para observar los cambios.
                    request.getRequestDispatcher("Controlador?menu=VistaEmpleado&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    // Asignamos los datos obtenidos de JSP en varibales para actualizarlo.
                    int codEmpleadoE = Integer.parseInt(request.getParameter("txtCodigoEmpleado"));
                    String nomEmpleadoE = request.getParameter("txtNombreEmpleado");
                    String apellEmpleadoE = request.getParameter("txtApellidoEmpleado");
                    String puestEmpleadoE = request.getParameter("txtPuestoEmpleado");
                    String telEmpleadoE = request.getParameter("txtTelefonoEmpleado");
                    // Seteamos los cambios en el modelo.
                    empleado.setNombreEmpleado(nomEmpleadoE);
                    empleado.setApellidoEmpleado(apellEmpleadoE);
                    empleado.setPuestoEmpleado(puestEmpleadoE);
                    empleado.setTelefonoEmpleado(telEmpleadoE);
                    empleado.setCodigoEmpleado(codEmpleadoE);
                    //Mandamos los cambios junto con el código para ejecutar la sentencia.
                    empleadoDAO.actualizarEmpleado(empleado);
                    //Redireccionamos a Listar para observar los cambios.
                    request.getRequestDispatcher("Controlador?menu=VistaEmpleado&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    // Obtenemos el código del elemento seleccionado para eliminarlo.
                    int codEmpleadoS = Integer.parseInt(request.getParameter("txtCodigoEmpleado"));
                    //Eliminamos al empleado.
                    empleadoDAO.eliminarEmpleado(codEmpleadoS);
                    //Redireccionamos a Listar para observar los cambios.
                    request.getRequestDispatcher("Controlador?menu=VistaEmpleado&accion=Listar").forward(request, response);
                    break;
            }

            request.getRequestDispatcher("VistaEmpleado.jsp").forward(request, response);

            //CRUD DETALLE ARTICULO COMPRA
        } else if (menu.equals("VistaDetalleArticuloCompra")) {
            switch (accion) {
                case "Listar":
                    List listaDetalleArticuloCompras = detalleArticuloCompraDao.listar();
                    request.setAttribute("detalleArticuloCompras", listaDetalleArticuloCompras);

                    List listaArticulos = articuloDao.listar();
                    request.setAttribute("articulos", listaArticulos);

                    List listaCompra = compraDao.listar();
                    request.setAttribute("compra", listaCompra);
                    break;
                case "Agregar":
                    int cantidad = Integer.parseInt(request.getParameter("txtCantArti"));
                    double precio = Double.parseDouble(request.getParameter("txtPreTotal"));
                    int codiCompra = Integer.parseInt(request.getParameter("txtCodCompra"));
                    int codiArticulo = Integer.parseInt(request.getParameter("txtCodArticulo"));
                    detalleArticuloCompra.setCantidadCompra(cantidad);
                    detalleArticuloCompra.setPrecioCompra(precio);
                    detalleArticuloCompra.setCodigoCompra(codiCompra);
                    detalleArticuloCompra.setCodigoArticulo(codiArticulo);
                    detalleArticuloCompraDao.agregar(detalleArticuloCompra);
                    request.getRequestDispatcher("Controlador?menu=VistaDetalleArticuloCompra&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    int codDetalleArt = Integer.parseInt(request.getParameter("txtDetArtCom"));
                    int cant = Integer.parseInt(request.getParameter("txtCantArti"));
                    double prec = Double.parseDouble(request.getParameter("txtPreTotal"));
                    detalleArticuloCompra.setCantidadCompra(cant);
                    detalleArticuloCompra.setPrecioCompra(prec);
                    detalleArticuloCompra.setCodigoDetalleArticuloCompra(codDetalleArt);
                    detalleArticuloCompraDao.actualizar(detalleArticuloCompra);
                    request.getRequestDispatcher("Controlador?menu=VistaDetalleArticuloCompra&accion=Listar").forward(request, response);
                    break;
            }

            request.getRequestDispatcher("VistaDetalleArticuloCompra.jsp").forward(request, response);

            //CRUD PERSONA
        } else if (menu.equals("VistaPersona")) {
            switch (accion) {
                case "Listar":
                    List listaPersonas = personaDao.listar();
                    request.setAttribute("personas", listaPersonas);

                    List listaUsuario = usuarioDao.Listar();
                    request.setAttribute("usuarios", listaUsuario);
                    break;
                case "Agregar":
                    String namePersona = request.getParameter("txtNombrePersona");
                    String apellPersona = request.getParameter("txtApellidoPersona");
                    String dpiPersona = request.getParameter("txtDPIPersona");
                    String telPersona = request.getParameter("txtTelefonoPersona");
                    String corrPersona = request.getParameter("txtCorreoPersona");
                    String direcPersona = request.getParameter("txtDireccionPersona");
                    String nitPersona = request.getParameter("txtNITPersona");
                    int codUser = Integer.parseInt(request.getParameter("txtCodigoUsuario"));
                    persona.setNombrePersona(namePersona);
                    persona.setApellidoPersona(apellPersona);
                    persona.setDPI(dpiPersona);
                    persona.setTelefonoContacto(telPersona);
                    persona.setCorreoPersona(corrPersona);
                    persona.setDireccionPersona(direcPersona);
                    persona.setNITPersona(nitPersona);
                    persona.setCodigoUsuario(codUser);
                    personaDao.agregar(persona);
                    request.getRequestDispatcher("Controlador?menu=VistaPersona&accion=Listar").forward(request, response);
                    break;
                case "Actualizar":
                    int codPersonaA = Integer.parseInt(request.getParameter("txtCodigoPersona"));
                    String nomPersonaA = request.getParameter("txtNombrePersona");
                    String apellPersonaA = request.getParameter("txtApellidoPersona");
                    String dpiPersonaA = request.getParameter("txtDPIPersona");
                    String telPersonaA = request.getParameter("txtTelefonoPersona");
                    String corrPersonaA = request.getParameter("txtCorreoPersona");
                    String direcPersonaA = request.getParameter("txtDireccionPersona");
                    String nitPersonaA = request.getParameter("txtNITPersona");

                    persona.setNombrePersona(nomPersonaA);
                    persona.setApellidoPersona(apellPersonaA);
                    persona.setDPI(dpiPersonaA);
                    persona.setTelefonoContacto(telPersonaA);
                    persona.setCorreoPersona(corrPersonaA);
                    persona.setDireccionPersona(direcPersonaA);
                    persona.setNITPersona(nitPersonaA);
                    persona.setCodigoPersona(codPersonaA);
                    personaDao.actualizar(persona);
                    request.getRequestDispatcher("Controlador?menu=VistaPersona&accion=Listar").forward(request, response);
                    break;
                case "Eliminar":
                    codPersona = Integer.parseInt(request.getParameter("txtCodigoPersona"));
                    personaDao.eliminar(codPersona);
                    request.getRequestDispatcher("Controlador?menu=VistaPersona&accion=Listar").forward(request, response);
                    break;

            }

            request.getRequestDispatcher("VistaPersona.jsp").forward(request, response);

            //CRUD FACTURA
        } else if (menu.equals("VistaFactura")) {
            switch (accion) {
                case "Listar":
                    List listaFacturas = facturaDao.listarFactura();
                    request.setAttribute("facturas", listaFacturas);

                    List listaEmpleados = empleadoDAO.listarEmpleado();
                    request.setAttribute("empleados", listaEmpleados);

                    List listaCompra = compraDao.listar();
                    request.setAttribute("compras", listaCompra);
                    break;
                case "Agregar":
                    String codigoAutorizacion = request.getParameter("txtCodigoAutorizacion");
                    int codigoUsuario = Integer.parseInt(request.getParameter("txtCodigoUsuarioFactura"));
                    int codigoCompra = Integer.parseInt(request.getParameter("txtCodigoCompra"));
                    int codigoEmpleado = Integer.parseInt(request.getParameter("txtCodigoEmpleado"));

                    factura.setCodigoAutorizacion(codigoAutorizacion);
                    factura.setCodigoUsuario(codigoUsuario);
                    factura.setCodigoCompra(codigoCompra);
                    factura.setCodigoEmpleado(codigoEmpleado);

                    facturaDao.agregar(factura);

                    request.getRequestDispatcher("Controlador?menu=VistaFactura&accion=Listar&codigoUsuario= ").forward(request, response);
                    break;

                case "Buscar":
                    int dato = Integer.parseInt(request.getParameter("txtBuscar"));
                    factura = facturaDao.listarCodigoFactura(dato);
                    int codigoFactura = factura.getCodigoFactura();
                    request.setAttribute("codigoFactura", codigoFactura);
                    String NITEmpresa = factura.getNITEmpresa();
                    request.setAttribute("NITEmpresa", NITEmpresa);
                    String direccionEmpresa = factura.getDireccionEmpresa();
                    request.setAttribute("direccionEmpresa", direccionEmpresa);
                    String numeroEmpresa = factura.getTelefonoEmpresa();
                    request.setAttribute("numeroEmpresa", numeroEmpresa);
                    String nombreEmpresa = factura.getNombreEmpresa();
                    request.setAttribute("nombreEmpresa", nombreEmpresa);
                    String codigoAutorizaion = factura.getCodigoAutorizacion();
                    request.setAttribute("codigoAutorizaion", codigoAutorizaion);
                    String fecha = factura.getFechaEmision();
                    request.setAttribute("fecha", fecha);
                    request.getRequestDispatcher("Controlador?menu=VistaFactura&accion=Listar&codigoUsuario").forward(request, response);
                    break;
            }

            request.getRequestDispatcher("VistaFactura.jsp").forward(request, response);
        } else if (menu.equals("index")) {

            switch (accion) {

                case "Agregar":

                    String nombreUserL = request.getParameter("txtNombreUsuarioL");

                    String apellidoUsuarioL = request.getParameter("txtApellidoUsuarioL");

                    String correoUsuarioL = request.getParameter("txtCorreoUsuarioL");

                    String usernameL = request.getParameter("txtUsernameL");

                    String contrasenaL = request.getParameter("txtContrasenaL");

                    Part part = request.getPart("fotoUsuarioL");

                    InputStream inputStream = part.getInputStream();

                    usuario.setNombreUsuario(nombreUserL);

                    usuario.setApellidoUsuario(apellidoUsuarioL);

                    usuario.setCorreoUsuario(correoUsuarioL);

                    usuario.setUsername(usernameL);

                    usuario.setContrasena(contrasenaL);

                    usuario.setFoto(inputStream);

                    usuarioDao.agregar(usuario);

                    break;

            }

            request.getRequestDispatcher("index.jsp").forward(request, response);

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
