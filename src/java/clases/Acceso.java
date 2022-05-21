/*
 * Esta clase sera la encargada de ejecutar las respectivas consultas o procesos que hacen uso de la base de datos
*/

package clases;

import java.sql.*;
import java.util.LinkedList;


/**
 * @author Veronica Quinto
 * cc: 1073528535
 */
public class Acceso {
    
    Database db = new Database();
    String sql= "";
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    
    public Acceso(){
        
    }
    
    public int validar(String identificacion,String contra){ //retorna int por el tipo de usuario
        int nivel =0;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getContra());
            sql ="SELECT nivel FROM persona WHERE identificacion='" + identificacion + "' AND clave='" + contra + "';";
            pst = con.prepareStatement(sql);//define lo que se ejecutara
            rs = pst.executeQuery(); //ejecuto la consulta
            
            while(rs.next()){
                nivel = rs.getInt(1);
            }
            
            con.close(); //me desconecto
            rs.close(); //salgo del contenido del resultSet
            
            return nivel; // retorno el nivel de la persona que se logueo
        } catch (SQLException | ClassNotFoundException e) {//por si no se ejecuta el sql o no se encuentra el diver 
            return nivel; //los niveles 0 significan que los usuarios no existen
        }
    }
    
    public String obtenerNombre(String identificacion,String contra){
        String nombre = null;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getContra());
            sql ="SELECT nombre FROM persona WHERE identificacion='" + identificacion + "' AND clave='" + contra + "';";
            pst = con.prepareStatement(sql);//define lo que se ejecutara
            rs = pst.executeQuery(); //ejecuto la consulta
            
            while(rs.next()){
                nombre = rs.getString(1);
            }
            
            con.close(); //me desconecto
            rs.close(); //salgo del contenido del resultSet
            
            return nombre; // retorno el nivel de la persona que se logueo
        } catch (SQLException | ClassNotFoundException e) {//por si no se ejecuta el sql o no se encuentra el diver 
            return nombre; //los niveles 0 significan que los usuarios no existen
        }
    }
    
    public String obtenerCorreo(String identificacion,String contra){
        String correo = null;
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getContra());
            sql ="SELECT correoElectronico FROM persona WHERE identificacion='" + identificacion + "' AND clave='" + contra + "';";
            pst = con.prepareStatement(sql);//define lo que se ejecutara
            rs = pst.executeQuery(); //ejecuto la consulta
            
            while(rs.next()){
                correo = rs.getString(1);
            }
            
            con.close(); //me desconecto
            rs.close(); //salgo del contenido del resultSet
            
            return correo; // retorno el nivel de la persona que se logueo
        } catch (SQLException | ClassNotFoundException e) {//por si no se ejecuta el sql o no se encuentra el diver 
            return correo; //los niveles 0 significan que los usuarios no existen
        }
    }
    
    public boolean registro(String identi,String nom, String ape,String correo, String cel,String tel, String pass){
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getContra());
            sql ="INSERT INTO persona (identificacion,nombre,apellido,correoElectronico,celular,telefono,clave,nivel) VALUES ('" +identi+"', '"+nom+"', '"+ape+"', '"+correo+"', '"+cel+"' ,'"+tel+"', '"+pass+"', 2);";                                                                  
            pst = con.prepareStatement(sql);//define lo que se ejecutara
            //rs = pst.executeQuery(); //ejecuto la consulta
            pst.executeUpdate();         
            con.close(); //me desconecto
            rs.close(); //salgo del contenido del resultSet

            return true;
        } catch (SQLException | ClassNotFoundException e) {//por si no se ejecuta el sql o no se encuentra el diver 
            return false;
        }
    }
    
    public static LinkedList<FormularioEmpresadeVigilancia> FormularioEmpresaVigi(){
        
        LinkedList<FormularioEmpresadeVigilancia> listaContactos=new LinkedList<FormularioEmpresadeVigilancia>();
        try{
         Class.forName("com.mysql.jdbc.Driver");
         Connection conexion = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ingsoftware", "root", "");
         Statement st = conexion.createStatement();
         ResultSet rs = st.executeQuery("SELECT * FROM EmpresaVigilancia;" );
         
         while (rs.next()){
            FormularioEmpresadeVigilancia op = new FormularioEmpresadeVigilancia();
            op.setNitempresa(rs.getInt("NitEmpresa"));
            op.setRazonsocial(rs.getString("razonSocial"));
            op.setDireccion(rs.getString("direccion"));
            op.setNumerotelefonico(rs.getString("numeroTelefonico"));
            op.setCelular(rs.getString("celular"));
            op.setEstadoServicio(rs.getBoolean("EstadoServicio"));
            listaContactos.add(op);
         }
         rs.close();
         st.close();
         conexion.close();
      }
      catch (Exception e){
         e.printStackTrace();
      }
      return listaContactos;
    }
   
    public static LinkedList<FormularioEmpresadeAseo> FormularioEmpresaAs(){
        
        LinkedList<FormularioEmpresadeAseo> listaContacto=new LinkedList<FormularioEmpresadeAseo>();
        
        try{
         Class.forName("com.mysql.jdbc.Driver");
         Connection conexion = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/ingsoftware", "root", "");
         Statement st = conexion.createStatement();
         ResultSet rs = st.executeQuery("SELECT * FROM EmpresaAseo;" );
         
         while (rs.next()){
            FormularioEmpresadeAseo op = new FormularioEmpresadeAseo();
            op.setNitempresa(rs.getInt("NitEmpresa"));
            op.setRazonsocial(rs.getString("razonSocial"));
            op.setDireccion(rs.getString("direccion"));
            op.setNumerotelefonico(rs.getString("numeroTelefonico"));
            op.setCelular(rs.getString("celular"));
            op.setEstadoServicio(rs.getBoolean("EstadoServicio"));
            listaContacto.add(op);
         }
         rs.close();
         st.close();
         conexion.close();
      }
      catch (Exception e){
         e.printStackTrace();
      }
      return listaContacto;
    }
    
    public int auto_increm(String sql) {
        int id = 1;
        
        try{   
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getContra());
            pst = con.prepareStatement(sql);//define lo que se ejecutara
            rs = pst.executeQuery(); //ejecuto la consulta
                while(rs.next()){
                    id = rs.getInt(1)+1;
                }
        }catch(Exception ex){
            System.out.println("idmaximo"+ex.getMessage());
            id = 1;
        }
        finally{
            try{
                pst.close();
                rs.close();
            }catch(Exception ex){}
        }
        return id;
    }
}
