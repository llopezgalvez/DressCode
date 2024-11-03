package modelo;


public class Articulo {
    private int codigoArticulo;
    private String talla;
    private String colorArticulo;
    private String materialArticulo;
    private double precio;
    private int existenciaArticulo;
    private int codigoCategoria;
    private int codigoMarca;

    public Articulo() {
    }

    public Articulo(int codigoArticulo, String talla, String colorArticulo, String materialArticulo, double precio, int existenciaArticulo, int codigoCategoria, int codigoMarca) {
        this.codigoArticulo = codigoArticulo;
        this.talla = talla;
        this.colorArticulo = colorArticulo;
        this.materialArticulo = materialArticulo;
        this.precio = precio;
        this.existenciaArticulo = existenciaArticulo;
        this.codigoCategoria = codigoCategoria;
        this.codigoMarca = codigoMarca;
    }

    public int getCodigoArticulo() {
        return codigoArticulo;
    }

    public void setCodigoArticulo(int codigoArticulo) {
        this.codigoArticulo = codigoArticulo;
    }

    public String getTalla() {
        return talla;
    }

    public void setTalla(String talla) {
        this.talla = talla;
    }

    public String getColorArticulo() {
        return colorArticulo;
    }

    public void setColorArticulo(String colorArticulo) {
        this.colorArticulo = colorArticulo;
    }

    public String getMaterialArticulo() {
        return materialArticulo;
    }

    public void setMaterialArticulo(String materialArticulo) {
        this.materialArticulo = materialArticulo;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getExistenciaArticulo() {
        return existenciaArticulo;
    }

    public void setExistenciaArticulo(int existenciaArticulo) {
        this.existenciaArticulo = existenciaArticulo;
    }

    public int getCodigoCategoria() {
        return codigoCategoria;
    }

    public void setCodigoCategoria(int codigoCategoria) {
        this.codigoCategoria = codigoCategoria;
    }

    public int getCodigoMarca() {
        return codigoMarca;
    }

    public void setCodigoMarca(int codigoMarca) {
        this.codigoMarca = codigoMarca;
    }
    
    
    
    
}
