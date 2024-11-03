/*
Programador: Franco Alejandro Paiz González 
    Sección: IN5AV
    Carné: 2022134
    Fecha de creación: 19/07/2023
*/
package modelo;

/**
 *
 * @author fpaiz
 */
public class Empleado {
    private int codigoEmpleado;
    private String nombreEmpleado;
    private String apellidoEmpleado;
    private String puestoEmpleado;
    private String telefonoEmpleado;

    public Empleado() {
    }

    public Empleado(int codigoEmpleado, String nombreEmpleado, String apellidoEmpleado, String puestoEmpleado, String telefonoEmpleado) {
        this.codigoEmpleado = codigoEmpleado;
        this.nombreEmpleado = nombreEmpleado;
        this.apellidoEmpleado = apellidoEmpleado;
        this.puestoEmpleado = puestoEmpleado;
        this.telefonoEmpleado = telefonoEmpleado;
    }
    
    

    public int getCodigoEmpleado() {
        return codigoEmpleado;
    }

    public void setCodigoEmpleado(int codigoEmpleado) {
        this.codigoEmpleado = codigoEmpleado;
    }

    public String getNombreEmpleado() {
        return nombreEmpleado;
    }

    public void setNombreEmpleado(String nombreEmpleado) {
        this.nombreEmpleado = nombreEmpleado;
    }

    public String getApellidoEmpleado() {
        return apellidoEmpleado;
    }

    public void setApellidoEmpleado(String apellidoEmpleado) {
        this.apellidoEmpleado = apellidoEmpleado;
    }

    public String getPuestoEmpleado() {
        return puestoEmpleado;
    }

    public void setPuestoEmpleado(String puestoEmpleado) {
        this.puestoEmpleado = puestoEmpleado;
    }

    public String getTelefonoEmpleado() {
        return telefonoEmpleado;
    }

    public void setTelefonoEmpleado(String telefonoEmpleado) {
        this.telefonoEmpleado = telefonoEmpleado;
    }

    
    
    
    
}
