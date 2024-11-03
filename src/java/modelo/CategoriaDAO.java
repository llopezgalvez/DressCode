package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    public List listar() {
        String sql = "select * from Categoria";
        List<Categoria> listaCategoria = new ArrayList<>();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Categoria c = new Categoria();
                c.setCodigoCategoria(rs.getInt(1));
                c.setDescripcion(rs.getString(2));
                c.setClasificacion(rs.getString(3));
                c.setTallasDisponibles(rs.getInt(4));
                c.setTemporada(rs.getString(5));
                listaCategoria.add(c);

            }
        } catch (Exception e) {
            e.printStackTrace();

        }

        return listaCategoria;

    }

    //Método Agregar
    public int agregar(Categoria cat) {
        String sql = "Insert into Categoria(descripcion, clasificacion, tallasDisponibles, temporada) Values(?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cat.getDescripcion());
            ps.setString(2, cat.getClasificacion());
            ps.setInt(3, cat.getTallasDisponibles());
            ps.setString(4, cat.getTemporada());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    //Método buscar por código
    public Categoria listarCodigoCategoria(int id) {
        Categoria cat = new Categoria();
        String sql = "select * from Categoria where codigoCategoria = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cat.setDescripcion(rs.getString(2));
                cat.setClasificacion(rs.getString(3));
                cat.setTallasDisponibles(rs.getInt(4));
                cat.setTemporada(rs.getString(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }

    public int actualizar(Categoria cat) {
        String sql = "Update Categoria set descripcion = ?, clasificacion = ?, tallasDisponibles = ?, temporada = ? where codigoCategoria = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cat.getDescripcion());
            ps.setString(2, cat.getClasificacion());
            ps.setInt(3, cat.getTallasDisponibles());
            ps.setString(4, cat.getTemporada());
            ps.setInt(5, cat.getCodigoCategoria());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }

    //Método Eliminar
    public void eliminar(int id) {
        String sql = "delete from Categoria where codigoCategoria = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
