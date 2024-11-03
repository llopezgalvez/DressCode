package modelo;

public class Compra {

    private int codigoCompra;
    private String formaDePago;
    private String departamentoEntrega;
    private String direccionEntrega;
    private String horarioEntrega;
    private String telefonoReferencia;
    private int codigoPersona;

    public Compra() {
    }

    public Compra(int codigoCompra, String formaDePago, String departamentoEntrega, String direccionEntrega, String horarioEntrega, String telefonoReferencia, int codigoPersona) {
        this.codigoCompra = codigoCompra;
        this.formaDePago = formaDePago;
        this.departamentoEntrega = departamentoEntrega;
        this.direccionEntrega = direccionEntrega;
        this.horarioEntrega = horarioEntrega;
        this.telefonoReferencia = telefonoReferencia;
        this.codigoPersona = codigoPersona;
    }

    public int getCodigoCompra() {
        return codigoCompra;
    }

    public void setCodigoCompra(int codigoCompra) {
        this.codigoCompra = codigoCompra;
    }

    public String getFormaDePago() {
        return formaDePago;
    }

    public void setFormaDePago(String formaDePago) {
        this.formaDePago = formaDePago;
    }

    public String getDepartamentoEntrega() {
        return departamentoEntrega;
    }

    public void setDepartamentoEntrega(String departamentoEntrega) {
        this.departamentoEntrega = departamentoEntrega;
    }

    public String getDireccionEntrega() {
        return direccionEntrega;
    }

    public void setDireccionEntrega(String direccionEntrega) {
        this.direccionEntrega = direccionEntrega;
    }

    public String getHorarioEntrega() {
        return horarioEntrega;
    }

    public void setHorarioEntrega(String horarioEntrega) {
        this.horarioEntrega = horarioEntrega;
    }

    public String getTelefonoReferencia() {
        return telefonoReferencia;
    }

    public void setTelefonoReferencia(String telefonoReferencia) {
        this.telefonoReferencia = telefonoReferencia;
    }

    public int getCodigoPersona() {
        return codigoPersona;
    }

    public void setCodigoPersona(int codigoPersona) {
        this.codigoPersona = codigoPersona;
    }
    
    

}
