package clases;

/**
 * @author Veronica Quinto
 * cc: 1073528535
 */

public class FormularioEmpresadeVigilancia {
    
    int nitempresa;
    String razonsocial;
    String direccion;
    String numerotelefonico;
    String celular;
    Boolean estadoServicio;

    public FormularioEmpresadeVigilancia() {
    }

    public FormularioEmpresadeVigilancia(int nitempresa, String razonsocial, String direccion, String numerotelefonico, String celular, Boolean estadoServicio) {
        this.nitempresa = nitempresa;
        this.razonsocial = razonsocial;
        this.direccion = direccion;
        this.numerotelefonico = numerotelefonico;
        this.celular = celular;
        this.estadoServicio = estadoServicio;
    }

    
    
    public int getNitempresa() {
        return nitempresa;
    }

    public void setNitempresa(int nitempresa) {
        this.nitempresa = nitempresa;
    }

    public String getRazonsocial() {
        return razonsocial;
    }

    public void setRazonsocial(String razonsocial) {
        this.razonsocial = razonsocial;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNumerotelefonico() {
        return numerotelefonico;
    }

    public void setNumerotelefonico(String numerotelefonico) {
        this.numerotelefonico = numerotelefonico;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public Boolean getEstadoServicio() {
        return estadoServicio;
    }

    public void setEstadoServicio(Boolean estadoServicio) {
        this.estadoServicio = estadoServicio;
    }
    
    
}
