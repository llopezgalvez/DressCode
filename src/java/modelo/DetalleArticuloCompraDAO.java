
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class DetalleArticuloCompraDAO{
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    // Método Listar 
    public List listar(){
       String sql = "Select * from DetalleArticuloCompra";
       List<DetalleArticuloCompra> listaDetalleArticuloCompra = new ArrayList<>();
       try{
           con = cn.Conexion();
           ps = con.prepareStatement(sql);
           rs = ps.executeQuery();
           while(rs.next()){
               DetalleArticuloCompra dac = new DetalleArticuloCompra();
               dac.setCodigoDetalleArticuloCompra(rs.getInt(1));
               dac.setCantidadCompra(rs.getInt(2));
               dac.setPrecioCompra(rs.getDouble(3));
               dac.setCodigoCompra(rs.getInt(4));
               dac.setCodigoArticulo(rs.getInt(5));
               listaDetalleArticuloCompra.add(dac);
           }
       }catch (Exception e){
           e.printStackTrace();
       }
       return listaDetalleArticuloCompra;
    }
    
    public int agregar (DetalleArticuloCompra dac){
        String sql = "Insert into DetalleArticuloCompra(cantidadCompra,"
                + "precioCompra,codigoCompra,codigoArticulo) "
                + "values(?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, dac.getCantidadCompra());
            ps.setDouble(2, dac.getPrecioCompra());
            ps.setInt(3, dac.getCodigoCompra());
            ps.setInt(4, dac.getCodigoArticulo());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
   
    public DetalleArticuloCompra listarCodigoDetalleArticuloCompra(int id){
        DetalleArticuloCompra dac = new DetalleArticuloCompra();
        String sql = "Select * from DetalleArticuloCompra where codigoDetalleArticuloCompra =" +id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                dac.setCantidadCompra(rs.getInt(2));
                dac.setPrecioCompra(rs.getDouble(3));
                dac.setCodigoCompra(rs.getInt(4));
                dac.setCodigoArticulo(rs.getInt(5));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return dac;      
    }
    
    public int actualizar(DetalleArticuloCompra dac){
        String sql = "Update DetalleArticuloCompra set cantidadCompra = ?, precioCompra = ? where codigoDetalleArticuloCompra = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, dac.getCantidadCompra());
            ps.setDouble(2, dac.getPrecioCompra());
            ps.setInt(3, dac.getCodigoDetalleArticuloCompra());
            ps.executeUpdate();           
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    public void eliminar(int id){
        String sql = "delete from DetalleArticuloCompra where codigoDetalleArticuloCompra = " +id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
