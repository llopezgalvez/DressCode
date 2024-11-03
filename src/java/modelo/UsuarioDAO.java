package modelo;

import config.Conexion;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public class UsuarioDAO {
    
   Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    public Usuario validar(String username, String contrasena) {
        Usuario usuario = new Usuario();

        String sql = "select * from  Usuario where username = ? and contrasena = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, contrasena);
            rs = ps.executeQuery();
            while (rs.next()) {
                usuario.setCodigoUsuario(rs.getInt("codigoUsuario"));
                usuario.setNombreUsuario(rs.getString("nombreUsuario"));
                usuario.setApellidoUsuario(rs.getString("apellidoUsuario"));
                usuario.setCorreoUsuario(rs.getString("correoUsuario"));
                usuario.setUsername(rs.getString("username"));
                usuario.setContrasena(rs.getString("contrasena"));
                usuario.setFoto(rs.getBinaryStream("foto"));
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return usuario;
    }

    public List Listar() {
        String sql = "Select * FROM Usuario";
        List<Usuario> listaUsuario = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario us = new Usuario();
                us.setCodigoUsuario(rs.getInt(1));
                us.setNombreUsuario(rs.getString(2));
                us.setApellidoUsuario(rs.getString(3));
                us.setCorreoUsuario(rs.getString(4));
                us.setUsername(rs.getString(5));
                us.setContrasena(rs.getString(6));
                us.setFoto(rs.getBinaryStream(7));
                listaUsuario.add(us);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return listaUsuario;

    }

    public void listarImg(int idUsuario, HttpServletResponse response) {
        String sql = "select * from Usuario where codigoUsuario =" + idUsuario;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        try {
            outputStream = response.getOutputStream();
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream("foto");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
        } catch (Exception e) {
            System.out.println("Error en listarimg");

        }
    }

    public int agregar(Usuario usu) {
        String sql = "Insert into Usuario(nombreUsuario, apellidoUsuario, correoUsuario, username, contrasena, foto) values(?,?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, usu.getNombreUsuario());
            ps.setString(2, usu.getApellidoUsuario());
            ps.setString(3, usu.getCorreoUsuario());
            ps.setString(4, usu.getUsername());
            ps.setString(5, usu.getContrasena());
            ps.setBlob(6, usu.getFoto());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resp;

    }

    public Usuario listarCodigoUsuario(int id) {
        Usuario us = new Usuario();
        String sql = "Select * from Usuario Where codigoUsuario =" + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                us.setNombreUsuario(rs.getString(2));
                us.setApellidoUsuario(rs.getString(3));
                us.setCorreoUsuario(rs.getString(4));
                us.setUsername(rs.getString(5));
                us.setContrasena(rs.getString(6));
                us.setFoto(rs.getBinaryStream(7));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return us;
    }

    public int actualizar(Usuario usu) {
        String sql = "Update Usuario set nombreUsuario = ?, apellidoUsuario = ?, correoUsuario = ?, username = ?, contrasena = ?, foto = ? where codigoUsuario = ?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, usu.getNombreUsuario());
            ps.setString(2, usu.getApellidoUsuario());
            ps.setString(3, usu.getCorreoUsuario());
            ps.setString(4, usu.getUsername());
            ps.setString(5, usu.getContrasena());
            ps.setBlob(6, usu.getFoto());
            ps.setInt(7, usu.getCodigoUsuario());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resp;
    }

    public void eliminar(int id) {
        String sql = "delete from Usuario where codigoUsuario = " + id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
}
