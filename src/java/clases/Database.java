/*
 * Esta clase se encargar de administrar la conexion a la base de datos
 */

package clases;

/**
 * @author Harold Pedraza
 * date: 29/05/2019
 */

public class Database {
    
    private String url;
    private String user;
    private String contra;
    private String driver;

    public Database() {
        this.url = "jdbc:mysql://localhost:3306/ingsoftware";
        this.user = "root";
        this.contra = "";
        this.driver = "com.mysql.jdbc.Driver";
    }

    public String getUrl() {
        return url;
    }

    public String getUser() {
        return user;
    }

    public String getContra() {
        return contra;
    }

    public String getDriver() {
        return driver;
    }
    
}
