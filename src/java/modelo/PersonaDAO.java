package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PersonaDAO {
    Conexion cn = new Conexion(); 
    Connection con;
    PreparedStatement ps; 
    ResultSet rs; 
    int resp;
    
    //Método Listar
    public List listar(){
    String sql = "select * from Persona";
    List<Persona> listaPersona = new ArrayList<>();
    try{
        con = cn.Conexion();
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while(rs.next()){
            Persona cc = new Persona();
            cc.setCodigoPersona(rs.getInt(1));
            cc.setNombrePersona(rs.getString(2));
            cc.setApellidoPersona(rs.getString(3));
            cc.setDPI(rs.getString(4));
            cc.setTelefonoContacto(rs.getString(5));
            cc.setCorreoPersona(rs.getString(6));
            cc.setDireccionPersona(rs.getString(7));
            cc.setNITPersona(rs.getString(8));
            cc.setCodigoUsuario(rs.getInt(9));
            listaPersona.add(cc);
        }
    }catch(Exception e){
        e.printStackTrace();
    }
    return listaPersona;
    }
    
    //Método Agregar
    public int agregar(Persona cont){
        String sql = "Insert into Persona(nombrePersona, apellidoPersona, DPI, telefonoContacto, correoPersona, direccionPersona, NITPersona, codigoUsuario) Values(?,?,?,?,?,?,?,?)"; 
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cont.getNombrePersona());
            ps.setString(2, cont.getApellidoPersona());
            ps.setString(3, cont.getDPI());
            ps.setString(4, cont.getTelefonoContacto());
            ps.setString(5, cont.getCorreoPersona());
            ps.setString(6, cont.getDireccionPersona());
            ps.setString(7, cont.getNITPersona());    
            ps.setInt(8, cont.getCodigoUsuario());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;    
    }
    
    //Método Buscar
    public Persona listarPersona(int id){
        Persona cont = new Persona();
        String sql = "select * form Persona where codigoPersona = " + id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                cont.setNombrePersona(rs.getString(2));
                cont.setApellidoPersona(rs.getString(3));
                cont.setDPI(rs.getString(4));
                cont.setTelefonoContacto(rs.getString(5));
                cont.setCorreoPersona(rs.getString(6));
                cont.setDireccionPersona(rs.getString(7));
                cont.setNITPersona(rs.getString(8));
                cont.setCodigoUsuario(rs.getInt(9));
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return cont;
    }
    
    //Método Editar
    public int actualizar(Persona cont){
        String sql = "update Persona set nombrePersona = ?, apellidoPersona = ?, DPI = ?, telefonoContacto = ?, correoPersona = ?, direccionPersona = ?, NITPersona = ? where codigoPersona = ?";
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cont.getNombrePersona());
            ps.setString(2, cont.getApellidoPersona());
            ps.setString(3, cont.getDPI());
            ps.setString(4, cont.getTelefonoContacto());
            ps.setString(5, cont.getCorreoPersona());
            ps.setString(6, cont.getDireccionPersona());
            ps.setString(7, cont.getNITPersona());
             ps.setInt(8, cont.getCodigoPersona());
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return resp;
    }
    
    //Método Eliminar
    public void eliminar(int id){
        String sql = "delete from Persona where codigoPersona = " + id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
