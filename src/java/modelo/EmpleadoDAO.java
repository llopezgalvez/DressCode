/*
Programador: Franco Alejandro Paiz González 
    Sección: IN5AV
    Carné: 2022134
    Fecha de creación: 19/07/2023
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
 * @author fpaiz
 */
public class EmpleadoDAO {
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;
    
    // Método de Listar -  READ
    public List listarEmpleado(){
        String sql = "Select * from empleado";
        List<Empleado> listaEmpleado = new ArrayList<>();
        
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                Empleado emp = new Empleado();
                emp.setCodigoEmpleado(rs.getInt(1));
                emp.setNombreEmpleado(rs.getString(2));
                emp.setApellidoEmpleado(rs.getString(3));
                emp.setPuestoEmpleado(rs.getString(4));
                emp.setTelefonoEmpleado(rs.getString(5));
                listaEmpleado.add(emp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
            
        return listaEmpleado;
    }
    
    // Método Agregar - CREATE
    public int agregarEmpleado(Empleado emp){
        String sql = "Insert into Empleado(nombreEmpleado, apellidoEmpleado, puestoEmpleado, telefonoEmpleado) values (?, ?, ?, ?)";
        try {
            con = cn.Conexion();
            ps= con.prepareStatement(sql);
            ps.setString(1, emp.getNombreEmpleado());
            ps.setString(2, emp.getApellidoEmpleado());
            ps.setString(3, emp.getPuestoEmpleado());
            ps.setString(4, emp.getTelefonoEmpleado());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return resp;
    }
    
    //Método para buscar a través del código - READ
    
    public Empleado listarCodigoEmpleado(int idEmpleado){
        // Se instancia el objeto de Empleado
        Empleado emp = new Empleado();
        String sql = "Select * from Empleado where codigoEmpleado =" + idEmpleado ;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs= ps.executeQuery();
            
            while(rs.next()){
                emp.setCodigoEmpleado(rs.getInt(1));
                emp.setNombreEmpleado(rs.getString(2));
                emp.setApellidoEmpleado(rs.getString(3));
                emp.setPuestoEmpleado(rs.getString(4));
                emp.setTelefonoEmpleado(rs.getString(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return emp;
    }
    
    //Método Editar - UPDATE
    public int actualizarEmpleado(Empleado emp){
        String sql = "Update Empleado set nombreEmpleado = ?, apellidoEmpleado = ?, puestoEmpleado = ?, telefonoEmpleado = ? where codigoEmpleado = ?";
        
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, emp.getNombreEmpleado());
            ps.setString(2, emp.getApellidoEmpleado());
            ps.setString(3, emp.getPuestoEmpleado());
            ps.setString(4, emp.getTelefonoEmpleado());
            ps.setInt(5, emp.getCodigoEmpleado());
            ps.executeUpdate();
        } catch (Exception e) {
         e.printStackTrace();
        }
        
        return resp;
    }
    
    // Método para Eliminar - DELETE
    
    public void eliminarEmpleado(int idEmpleado){
        String sql = "Delete from Empleado where codigoEmpleado = " + idEmpleado;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }
    
    
    
}

