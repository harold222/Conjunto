package clases;

/*
 * Esta clase sera la encargada de poderse conectar con el servidor de correo de gmail y permitirme
 * enviar correos.
*/

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * @author Veronica Quinto
 * cc: 1073528535
 */

public class Email {
 
    public boolean enviarCorreo(String identificacion, String remitente, String clave, String asunto, String destinatario, String torre, String apartamento, String mensaje){
   
        boolean enviado = false;
        
        try {
            
            String host = "smtp.gmail.com";  
            Properties prop = System.getProperties();
            
            prop.put("mail.smtp.starttls.enable", "true");
            prop.put("mail.smtp.host", host);
            prop.put("mail.smtp.user", remitente);
            prop.put("mail.smtp.password", clave);
            prop.put("mail.smtp.port", 587);
            prop.put("mail.smtp.auth", "true");
            
            Session sesion = Session.getDefaultInstance(prop,null);
            MimeMessage message = new MimeMessage(sesion);
            message.setFrom(new InternetAddress(remitente));
                
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));
            message.setSubject(asunto);
            message.setText("\t\t...CONJUNTO RESIDENCIAL...\nEl residente con identificacion: "+identificacion+" y correo: "+remitente+" ha dejado el siguiente mensaje: \n\n"+mensaje+" \n\nDe torre numero: "+torre+" y aparatamento numero: "+apartamento);
            
            Transport transport = sesion.getTransport("smtp");
            transport.connect(host,remitente,clave);
            
            transport.sendMessage(message, message.getAllRecipients());
            
            transport.close();
            enviado =true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return enviado;
    }
}
