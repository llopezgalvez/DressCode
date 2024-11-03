package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProveedorDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    //Listar
    public List listar() {
        String sql = "Select * from proveedor";
        List<Proveedor> listaProveedor = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Proveedor pr = new Proveedor();
                pr.setCodigoProveedor(rs.getInt(1));
                pr.setNombreProveedor(rs.getString(2));
                pr.setTelefonoProveedor(rs.getString(3));
                pr.setDireccionProveedor(rs.getString(4));
                pr.setCorreoProveedor(rs.getString(5));
                listaProveedor.add(pr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaProveedor;
    }
    
    //Agregar
    public int agregar(Proveedor pr) {
        String sql = "Insert into Proveedor(nombreProveedor, telefonoProveedor, direccionProveedor,correoProveedor ) Values(?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, pr.getNombreProveedor());
            ps.setString(2, pr.getTelefonoProveedor());
            ps.setString(3, pr.getDireccionProveedor());
            ps.setString(4, pr.getCorreoProveedor());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    //Buscar
    public Proveedor listarCodigoProveedor(int id) {
        Proveedor pr = new Proveedor();
        String sql = "Select * from Proveedor where codigoProveedor = "+id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                pr.setNombreProveedor(rs.getString(2));
                pr.setTelefonoProveedor(rs.getString(3));
                pr.setDireccionProveedor(rs.getString(4));
                pr.setCorreoProveedor(rs.getString(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return pr;
    }
    
    //Editar
    
    public int actualizar(Proveedor pr) {
        String sql = "Update Proveedor set nombreProveedor = ?, telefonoProveedor = ?, direccionProveedor = ?, correoProveedor = ? where codigoProveedor = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, pr.getNombreProveedor());
            ps.setString(2, pr.getTelefonoProveedor());
            ps.setString(3, pr.getDireccionProveedor());
            ps.setString(4, pr.getCorreoProveedor());
            ps.setInt(5, pr.getCodigoProveedor());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
    
    //Eliminar
    
    public void eliminar(int id) {
        String sql = "delete from Proveedor where codigoProveedor ="+id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}