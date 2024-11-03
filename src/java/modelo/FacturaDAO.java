/*
 Fecha de creación:19/7/23
    Fecha de modificaión: 19/7/23
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ana
 */
public class FacturaDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    //Método Listar Factura
    public List listarFactura() {
        String sql = "Select * from Factura";
        List<Factura> listaFactura = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Factura factura = new Factura();
                factura.setCodigoFactura(rs.getInt(1));
                factura.setNITEmpresa(rs.getString(2));
                factura.setNombreEmpresa(rs.getString(3));
                factura.setDireccionEmpresa(rs.getString(4));
                factura.setTelefonoEmpresa(rs.getString(5));
                factura.setCodigoAutorizacion(rs.getString(6));
                factura.setFechaEmision(rs.getString(7));
                factura.setCodigoUsuario(rs.getInt(8));
                factura.setCodigoCompra(rs.getInt(9));
                factura.setCodigoEmpleado(rs.getInt(10));
                listaFactura.add(factura);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaFactura;
    }

    //Método Agrear Factura
    public int agregar(Factura fac) {
        //no se agregara nombreEmpresa, dirección, teléfono y NIT ya que estos tienen un valor default en la DB y no deben ser diferentes en cada factura emitida
        String sql = "Insert into Factura(codigoAutorizacion,fechaEmision,codigoUsuario,codigoCompra, codigoEmpleado)\n" +
"	values(?,now(),?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, fac.getCodigoAutorizacion());
            ps.setInt(2, fac.getCodigoUsuario());
            ps.setInt(3, fac.getCodigoCompra());
            ps.setInt(4, fac.getCodigoEmpleado());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    //Método Buscar por codigoFactura
    public Factura listarCodigoFactura(int id) {
        Factura factura = new Factura();
        String sql = "Select * from Factura where codigoFactura =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                factura.setNITEmpresa(rs.getString(2));
                factura.setNombreEmpresa(rs.getString(3));
                factura.setDireccionEmpresa(rs.getString(4));
                factura.setTelefonoEmpresa(rs.getString(5));
                factura.setCodigoAutorizacion(rs.getString(6));
                factura.setFechaEmision(rs.getString(7));
                factura.setCodigoUsuario(rs.getInt(8));
                factura.setCodigoCompra(rs.getInt(9));
                factura.setCodigoEmpleado(rs.getInt(10));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return factura;
    }

    //Método Editar Factura
    public int actualizar(Factura factura) {
        String sql = "Update Factura set NITEmpresa=?, nombreEmpresa=?, direccionEmpresa=?, telefonoEmpresa=?,codigoAutorizacion = ?, fechaEmision = ? where codigoFactura = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, factura.getNITEmpresa());
            ps.setString(2, factura.getNombreEmpresa());
            ps.setString(3, factura.getDireccionEmpresa());
            ps.setString(1, factura.getTelefonoEmpresa());
            ps.setString(1, factura.getCodigoAutorizacion());
            ps.setString(1, factura.getFechaEmision());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
    
    public void eliminar(int id){
        String sql = "delete from Factura where codigoFactura = " + id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
     //Método Buscar Contenido
    public List buscarContenido(int id){
        List<Factura> listaContenido = new ArrayList<>();
        String sql = "select * from Factura where codigoFactura =" + id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Factura factura = new Factura();
                factura.setNITEmpresa(rs.getString(2));
                factura.setNombreEmpresa(rs.getString(3));
                factura.setDireccionEmpresa(rs.getString(4));
                factura.setTelefonoEmpresa(rs.getString(5));
                factura.setCodigoAutorizacion(rs.getString(6));
                factura.setFechaEmision(rs.getString(7));
                factura.setCodigoUsuario(rs.getInt(8));
                factura.setCodigoCompra(rs.getInt(9));
                factura.setCodigoEmpleado(rs.getInt(10));
                listaContenido.add(factura);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return listaContenido;
    }
}
