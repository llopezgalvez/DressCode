package modelo;

public class ControlCalidad {
    private int codigoControlCalidad;
    private String motivo;
    private String descripcionCalidad;
    private int codigoUsuario;

    public ControlCalidad() {
    }

    public ControlCalidad(int codigoControlCalidad, String motivo, String descripcionCalidad, int codigoUsuario) {
        this.codigoControlCalidad = codigoControlCalidad;
        this.motivo = motivo;
        this.descripcionCalidad = descripcionCalidad;
        this.codigoUsuario = codigoUsuario;
    }

    public int getCodigoControlCalidad() {
        return codigoControlCalidad;
    }

    public void setCodigoControlCalidad(int codigoControlCalidad) {
        this.codigoControlCalidad = codigoControlCalidad;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getDescripcionCalidad() {
        return descripcionCalidad;
    }

    public void setDescripcionCalidad(String descripcionCalidad) {
        this.descripcionCalidad = descripcionCalidad;
    }

    public int getCodigoUsuario() {
        return codigoUsuario;
    }

    public void setCodigoUsuario(int codigoUsuario) {
        this.codigoUsuario = codigoUsuario;
    }
    
    
}
