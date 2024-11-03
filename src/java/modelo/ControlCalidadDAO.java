package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ControlCalidadDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    //Método Listar
    public List listar() {
        String sql = "select * from ControlCalidad";
        List<ControlCalidad> listaControlCalidad = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ControlCalidad cc = new ControlCalidad();
                cc.setCodigoControlCalidad(rs.getInt(1));
                cc.setMotivo(rs.getString(2));
                cc.setDescripcionCalidad(rs.getString(3));
                cc.setCodigoUsuario(rs.getInt(4));
                listaControlCalidad.add(cc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaControlCalidad;
    }

    //Método Agregar
    public int agregar(ControlCalidad cont) {
        String sql = "Insert into ControlCalidad(motivo, descripcionCalidad, codigoUsuario) Values(?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cont.getMotivo());
            ps.setString(2, cont.getDescripcionCalidad());
            ps.setInt(3, cont.getCodigoUsuario());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    //Método Buscar por código
    public ControlCalidad listarCodigoControlCalidad(int id) {
        ControlCalidad cont = new ControlCalidad();
        String sql = "select * from ControlCalidad where codigoControlCalidad = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cont.setMotivo(rs.getString(2));
                cont.setDescripcionCalidad(rs.getString(3));
                cont.setCodigoUsuario(rs.getInt(4));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cont;
    }

    //Método Editar
    public int actualizar(ControlCalidad cont) {
        String sql = "update ControlCalidad set motivo = ?, descripcionCalidad = ? where codigoControlCalidad = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cont.getMotivo());
            ps.setString(2, cont.getDescripcionCalidad());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    //Método Eliminar
    public void eliminar(int id){
        String sql = "delete from ControlCalidad where codigoControlCalidad = " + id;
        try{
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
