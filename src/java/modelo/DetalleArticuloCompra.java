
package modelo;


public class DetalleArticuloCompra {
    private int codigoDetalleArticuloCompra;
    private int cantidadCompra;
    private double precioCompra;
    private int codigoCompra;
    private int codigoArticulo;

    public DetalleArticuloCompra() {
    }

    public DetalleArticuloCompra(int codigoDetalleArticuloCompra, int cantidadCompra, double precioCompra, int codigoCompra, int codigoArticulo) {
        this.codigoDetalleArticuloCompra = codigoDetalleArticuloCompra;
        this.cantidadCompra = cantidadCompra;
        this.precioCompra = precioCompra;
        this.codigoCompra = codigoCompra;
        this.codigoArticulo = codigoArticulo;
    }

    public int getCodigoDetalleArticuloCompra() {
        return codigoDetalleArticuloCompra;
    }

    public void setCodigoDetalleArticuloCompra(int codigoDetalleArticuloCompra) {
        this.codigoDetalleArticuloCompra = codigoDetalleArticuloCompra;
    }

    public int getCantidadCompra() {
        return cantidadCompra;
    }

    public void setCantidadCompra(int cantidadCompra) {
        this.cantidadCompra = cantidadCompra;
    }

    public double getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(double precioCompra) {
        this.precioCompra = precioCompra;
    }

    public int getCodigoCompra() {
        return codigoCompra;
    }

    public void setCodigoCompra(int codigoCompra) {
        this.codigoCompra = codigoCompra;
    }

    public int getCodigoArticulo() {
        return codigoArticulo;
    }

    public void setCodigoArticulo(int codigoArticulo) {
        this.codigoArticulo = codigoArticulo;
    }
}
