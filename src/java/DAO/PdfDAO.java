package DAO;

import clases.Database;
import VO.PdfVO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * @author Veronica Quinto
 * cc: 1073528535
 */

public class PdfDAO {

    Database db = new Database();
    String sql= "";
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    
    /*Metodo listar*/
    public ArrayList<PdfVO> Listar_PdfVO() {
        ArrayList<PdfVO> list = new ArrayList<PdfVO>();
        
        sql = "SELECT * FROM informe;";
        ResultSet rs = null;
        try {
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getContra());
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                PdfVO vo = new PdfVO();
                vo.setCodigopdf(rs.getInt(1));
                vo.setNombrepdf(rs.getString(2));
                vo.setArchivopdf2(rs.getBytes(3));
                list.add(vo);
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                pst.close();
                rs.close();
            } catch (Exception ex) {
            }
        }
        return list;
    }


    /*Metodo agregar*/
    public void Agregar_PdfVO(PdfVO vo) {
        sql = "INSERT INTO Informe (codigopdf, nombrepdf, archivopdf) VALUES(?, ?, ?);";
   
        try {
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getContra());
            pst = con.prepareStatement(sql);
            pst.setInt(1, vo.getCodigopdf());
            pst.setString(2, vo.getNombrepdf());
            pst.setBlob(3, vo.getArchivopdf());
            pst.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                pst.close();
            } catch (Exception ex) {
            }
        }
    }


    /*Metodo Modificar*/
    public void Modificar_PdfVO(PdfVO vo) {
        String sql = "UPDATE Informe SET nombrepdf = ?, archivopdf = ? WHERE codigopdf = ?;";

        try {
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getContra());
            pst = con.prepareStatement(sql);
            pst.setString(1, vo.getNombrepdf());
            pst.setBlob(2, vo.getArchivopdf());
            pst.setInt(3, vo.getCodigopdf());
            pst.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                pst.close();
            } catch (Exception ex) {
            }
        }
    }

    /*Metodo Modificar*/
    public void Modificar_PdfVO2(PdfVO vo) {
        String sql = "UPDATE Informe SET nombrepdf = ? WHERE codigopdf = ?;";
      
        try {
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getContra());
            pst = con.prepareStatement(sql);
            pst.setString(1, vo.getNombrepdf());
            pst.setInt(2, vo.getCodigopdf());
            pst.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                pst.close();
            } catch (Exception ex) {
            }
        }
    }

    /*Metodo Eliminar*/
    public void Eliminar_PdfVO(int id) {
        String sql = "DELETE FROM Informe WHERE codigopdf = ?;";
        try {
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getContra());
            pst = con.prepareStatement(sql);
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                pst.close();
            } catch (Exception ex) {
            }
        }
    }


    /*Metodo Consulta id*/
    public PdfVO getPdfVOById(int studentId) {
        PdfVO vo = new PdfVO();
        String query = "SELECT * FROM Informe WHERE codigopdf = ?;";
        try {
            con = DriverManager.getConnection(db.getUrl(), db.getUser(), db.getContra());
            pst = con.prepareStatement(sql);
            pst.setInt(1, studentId);
            rs = pst.executeQuery();
            while (rs.next()) {
                vo.setCodigopdf(rs.getInt(1));
                vo.setNombrepdf(rs.getString(2));
                vo.setArchivopdf2(rs.getBytes(3));
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                rs.close();
                pst.close();
            } catch (Exception ex) {
            }
        }
        return vo;
    }

}
