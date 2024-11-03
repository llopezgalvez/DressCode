package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class CompraDAO {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    //Método Listar
    
    public List listar(){
        String sql = "select * from Compra";
        List<Compra> listaCompra = new ArrayList<>();
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Compra comp = new Compra();
                comp.setCodigoCompra(rs.getInt(1));
                comp.setFormaDePago(rs.getString(2));
                comp.setDepartamentoEntrega(rs.getString(3));
                comp.setDireccionEntrega(rs.getString(4));
                comp.setHorarioEntrega(rs.getString(5));
                comp.setTelefonoReferencia(rs.getString(6));
                comp.setCodigoPersona(rs.getInt(7));
                listaCompra.add(comp);
                
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return listaCompra;
    }
    
    public int agregar (Compra comp){
        String sql = "Insert into Compra (formaDePago, departamentoEntrega, direccionEntrega, horarioEntrega, telefonoReferencia,codigoPersona) value (?,?,?,?,?,?)";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, comp.getFormaDePago());
            ps.setString(2, comp.getDepartamentoEntrega());
            ps.setString(3, comp.getDireccionEntrega());
            ps.setString(4, comp.getHorarioEntrega());
            ps.setString(5, comp.getTelefonoReferencia());
            ps.setInt(6, comp.getCodigoPersona());
            ps.executeUpdate();
            
        }catch (Exception e){
            e.printStackTrace();
        }
        
        return resp;
    }
    
    public Compra listarCodigoCompra (int id){
        Compra comp = new Compra();
        String sql = "Select * from Compra where codigoCompra = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                comp.setCodigoCompra(rs.getInt(1));
                comp.setFormaDePago(rs.getString(2));
                comp.setDepartamentoEntrega(rs.getString(3));
                comp.setDireccionEntrega(rs.getString(4));
                comp.setHorarioEntrega(rs.getString(5));
                comp.setTelefonoReferencia(rs.getString(6));
                comp.setCodigoPersona(rs.getInt(7));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return comp;
    }
    
    public int actualizar (Compra comp){
        
        String sql = "Update Compra set formaDePago = ?, departamentoEntrega = ?, direccionEntrega = ?, horarioEntrega = ?, telefonoReferencia = ? where codigoCompra = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, comp.getFormaDePago());;
            ps.setString(2, comp.getDepartamentoEntrega());
            ps.setString(3, comp.getDireccionEntrega());
            ps.setString(4, comp.getHorarioEntrega());
            ps.setString(5, comp.getTelefonoReferencia());
            ps.setInt(6, comp.getCodigoCompra());
            ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return resp;
        
    }
    
    public void eliminar (int id){
        String sql = "Delete from Compra where codigoCompra = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
