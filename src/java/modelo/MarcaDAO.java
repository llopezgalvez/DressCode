package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class MarcaDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    
    
    // Método Listar 
    public List listar() {
        String sql = "select * from Marca";
        List<Marca> listaMarca = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Marca cc = new Marca();
                cc.setCodigoMarca(rs.getInt(1));
                cc.setNombreMarca(rs.getString(2));
                cc.setDireccionMarca(rs.getString(3));
                cc.setCorreoMarca(rs.getString(4));
                cc.setCodigoProveedor(rs.getInt(5));
                listaMarca.add(cc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaMarca;
    }
    
    // Método Agregar
    public int agregar(Marca cont) {
        String sql = "insert into Marca (nombreMarca, direccionMarca, correoMarca, codigoProveedor) values (?, ?, ?, ?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cont.getNombreMarca());
            ps.setString(2, cont.getDireccionMarca());
            ps.setString(3, cont.getCorreoMarca());
            ps.setInt(4, cont.getCodigoProveedor());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
    
    // Método Buscar por código
    public Marca listarCodigoMarca (int id) {
        Marca cont = new Marca();
        String sql = "select * from Marca where codigoMarca = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cont.setCodigoMarca(rs.getInt(1));
                cont.setNombreMarca(rs.getString(2));
                cont.setDireccionMarca(rs.getString(3));
                cont.setCorreoMarca(rs.getString(4));
                cont.setCodigoProveedor(rs.getInt(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cont;
    }
    
    
    // Método Actualizar
    public int actualizar (Marca cont) {
        String sql = "update Marca set nombreMarca = ?, direccionMarca = ? ,correoMarca = ? where codigoMarca = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cont.getNombreMarca());
            ps.setString(2, cont.getDireccionMarca());
            ps.setString(3, cont.getCorreoMarca());
            ps.setInt(4, cont.getCodigoMarca());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
    
    // Método Eliminar 
    public void eliminar (int id){
        String sql = "delete from Marca where codigoMarca = " +id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}


