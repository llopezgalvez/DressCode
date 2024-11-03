package modelo;


public class Marca {
    private int codigoMarca;
    private String nombreMarca;
    private String direccionMarca;
    private String correoMarca;
    private int codigoProveedor;

    public Marca() {
    }

    public Marca(int codigoMarca, String nombreMarca, String direccionMarca, String correoMarca, int codigoProveedor) {
        this.codigoMarca = codigoMarca;
        this.nombreMarca = nombreMarca;
        this.direccionMarca = direccionMarca;
        this.correoMarca = correoMarca;
        this.codigoProveedor = codigoProveedor;
    }

    public int getCodigoMarca() {
        return codigoMarca;
    }

    public void setCodigoMarca(int codigoMarca) {
        this.codigoMarca = codigoMarca;
    }

    public String getNombreMarca() {
        return nombreMarca;
    }

    public void setNombreMarca(String nombreMarca) {
        this.nombreMarca = nombreMarca;
    }

    public String getDireccionMarca() {
        return direccionMarca;
    }

    public void setDireccionMarca(String direccionMarca) {
        this.direccionMarca = direccionMarca;
    }

    public String getCorreoMarca() {
        return correoMarca;
    }

    public void setCorreoMarca(String correoMarca) {
        this.correoMarca = correoMarca;
    }

    public int getCodigoProveedor() {
        return codigoProveedor;
    }

    public void setCodigoProveedor(int codigoProveedor) {
        this.codigoProveedor = codigoProveedor;
    }
    
    
}
