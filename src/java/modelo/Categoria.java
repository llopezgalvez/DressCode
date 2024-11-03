
package modelo;


public class Categoria {
    private int codigoCategoria;
    private String descripcion;
    private String clasificacion;
    private int tallasDisponibles;
    private String temporada;
    
    
    public Categoria () {
    
    }

    public Categoria(int codigoCategoria, String descripcion, String clasificacion, int tallasDisponibles, String temporada) {
        this.codigoCategoria = codigoCategoria;
        this.descripcion = descripcion;
        this.clasificacion = clasificacion;
        this.tallasDisponibles = tallasDisponibles;
        this.temporada = temporada;
    }
    
    
    public int getCodigoCategoria (){
        return codigoCategoria;
    }
    
    
    public void setCodigoCategoria( int codigoCategoria){
       this.codigoCategoria = codigoCategoria;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getClasificacion() {
        return clasificacion;
    }

    public void setClasificacion(String clasificacion) {
        this.clasificacion = clasificacion;
    }

    public int getTallasDisponibles() {
        return tallasDisponibles;
    }

    public void setTallasDisponibles(int tallasDisponibles) {
        this.tallasDisponibles = tallasDisponibles;
    }

    public String getTemporada() {
        return temporada;
    }

    public void setTemporada(String temporada) {
        this.temporada = temporada;
    }
    
    
    
    
}
