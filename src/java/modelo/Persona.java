package modelo;

public class Persona {
    //Atributos de la entidad Persona
    private int codigoPersona;
    public String nombrePersona;
    public String apellidoPersona;
    public String DPI;
    public String telefonoContacto;
    public String correoPersona;
    public String direccionPersona;
    public String NITPersona;
    public int codigoUsuario;
    
    //Constructor sin parámetros
    public Persona() {
    }
    
    //Constructor con parámetros
    public Persona(int codigoPersona, String nombrePersona, String apellidoPersona, String DPI, String telefonoContacto, String correoPersona, String direccionPersona, String NITPersona, int codigoUsuario) {
        this.codigoPersona = codigoPersona;
        this.nombrePersona = nombrePersona;
        this.apellidoPersona = apellidoPersona;
        this.DPI = DPI;
        this.telefonoContacto = telefonoContacto;
        this.correoPersona = correoPersona;
        this.direccionPersona = direccionPersona;
        this.NITPersona = NITPersona;
        this.codigoUsuario = codigoUsuario;
    }
    
    //Métodos Get and Set

    public int getCodigoPersona() {
        return codigoPersona;
    }

    public void setCodigoPersona(int codigoPersona) {
        this.codigoPersona = codigoPersona;
    }

    public String getNombrePersona() {
        return nombrePersona;
    }

    public void setNombrePersona(String nombrePersona) {
        this.nombrePersona = nombrePersona;
    }

    public String getApellidoPersona() {
        return apellidoPersona;
    }

    public void setApellidoPersona(String apellidoPersona) {
        this.apellidoPersona = apellidoPersona;
    }

    public String getDPI() {
        return DPI;
    }

    public void setDPI(String DPI) {
        this.DPI = DPI;
    }

    public String getTelefonoContacto() {
        return telefonoContacto;
    }

    public void setTelefonoContacto(String telefonoContacto) {
        this.telefonoContacto = telefonoContacto;
    }

    public String getCorreoPersona() {
        return correoPersona;
    }

    public void setCorreoPersona(String correoPersona) {
        this.correoPersona = correoPersona;
    }

    public String getDireccionPersona() {
        return direccionPersona;
    }

    public void setDireccionPersona(String direccionPersona) {
        this.direccionPersona = direccionPersona;
    }

    public String getNITPersona() {
        return NITPersona;
    }

    public void setNITPersona(String NITPersona) {
        this.NITPersona = NITPersona;
    }

    public int getCodigoUsuario() {
        return codigoUsuario;
    }

    public void setCodigoUsuario(int codigoUsuario) {
        this.codigoUsuario = codigoUsuario;
    } 
}

