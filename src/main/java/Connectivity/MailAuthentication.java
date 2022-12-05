package Connectivity;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.ResourceBundle;

public class MailAuthentication {

        public static void main( String[] args ) {
            System.out.println("Preparing to send Message");
            String message ="Hello Dear this is for confirmation message";
            String subject= "Monika : Confirmation";
            String to = "monikasingh0126gmail.com";
            String from = "nikki.ns266@gmail.com";

            sendEmail (message, subject, to, from);
        }

        private static void sendEmail(String message, String subject, String to, String from) {
            String host = "smtp.gmail.com";
            Properties p = System.getProperties();
            System.out.println("PROPERTIES" +p);
            p.put("mail.smtp.host", host);
            p.put("mail.smtp.port", 465);
            p.put("mail.smtp.ssl.enable", true);
            p.put("mail.smtp.auth", true);

            Session session = Session.getInstance(p, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {

                    ResourceBundle resourceBundle = ResourceBundle.getBundle("email");
                    String username = resourceBundle.getString("username");
                    String password= resourceBundle.getString("password");
                    return new PasswordAuthentication("username", "password");
                }
            });

            session.setDebug(true);
            MimeMessage m = new MimeMessage(session);

            try {
                m.setFrom(from);
                m.addRecipients(Message.RecipientType.TO, String.valueOf(new InternetAddress(to)));
                m.setSubject(subject);
                m.setText(message);

            } catch (MessagingException e) {
                e.printStackTrace();
            }

            try {
            Transport.send(m);
        } catch (javax.mail.MessagingException e) {
            e.printStackTrace();
        }
        System.out.println("Sent Successfully");
        }
    }
