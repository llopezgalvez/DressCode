package modelo;
import config.Conexion;
import modelo.Articulo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class ArticuloDAO {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    
    // Listar Articulo
    public List listar(){
        String sql = "Select * from Articulo";
        List<Articulo> listaArticulo = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Articulo ar = new Articulo();
                ar.setCodigoArticulo(rs.getInt(1));
                ar.setTalla(rs.getString(2));
                ar.setColorArticulo(rs.getString(3));
                ar.setMaterialArticulo(rs.getString(4));
                ar.setPrecio(rs.getDouble(5));
                ar.setExistenciaArticulo(rs.getInt(6));
                ar.setCodigoCategoria(rs.getInt(7));
                ar.setCodigoMarca(rs.getInt(8));
                listaArticulo.add(ar);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return listaArticulo;
    }
    
    //agregar articulo
    
    public int agregar(Articulo ar){
        String sql = "Insert into Articulo(talla, colorArticulo, materialArticulo, precio, existenciaArticulo, codigoCategoria, codigoMarca) values(?, ?, ?, ?, ?, ?, ?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, ar.getTalla());
            ps.setString(2, ar.getColorArticulo());
            ps.setString(3, ar.getMaterialArticulo());
            ps.setDouble(4, ar.getPrecio());
            ps.setInt(5, ar.getExistenciaArticulo());
            ps.setInt(6, ar.getCodigoCategoria());
            ps.setInt(7,ar.getCodigoMarca());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return resp;
    }
    
    //Buscar por codigo
    
    public Articulo listarCodigoArticulo(int id){
        Articulo ar = new Articulo();
        String sql = "Select * from Articulo where codigoArticulo =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                ar.setTalla(rs.getString(2));
                ar.setColorArticulo(rs.getString(3));
                ar.setMaterialArticulo(rs.getString(4));
                ar.setPrecio(rs.getDouble(5));
                ar.setExistenciaArticulo(rs.getInt(6));
                ar.setCodigoCategoria(rs.getInt(7));
                ar.setCodigoMarca(rs.getInt(8));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ar;
    }
    
    //Editar
    
    public int actualizar(Articulo ar){
        String sql = "Update Articulo set talla = ?,colorArticulo = ?,materialArticulo = ?,precio = ?,existenciaArticulo = ? where codigoArticulo = ?";
        
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, ar.getTalla());
            ps.setString(2, ar.getColorArticulo());
            ps.setString(3, ar.getMaterialArticulo());
            ps.setDouble(4, ar.getPrecio());
            ps.setInt(5, ar.getExistenciaArticulo());
            ps.setInt(6, ar.getCodigoArticulo());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return resp;
    }
    
    public void eliminar(int id ){
        String sql = "Delete from Articulo where codigoArticulo = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    } 
}
