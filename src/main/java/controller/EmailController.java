/*
 * Email controller
 */
package controller;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.StudentService;

/**
 *
 * @author Dev
 */
@Controller
public class EmailController {

    private StudentService studentService;
    
    @Autowired(required = true)
    @Qualifier(value = "studentService")
    public void setStudentService(StudentService studentService) {
        this.studentService = studentService;
    }
    
    @RequestMapping(value = "/emailForm/{id}", method = RequestMethod.GET)
    public String sendEmail(
            @PathVariable("id") int sId,
            HttpServletRequest request,
            Model model) {
        
        model.addAttribute("student",studentService.getStudentById(sId, true));
        return "mail_form";
    }

    @RequestMapping(value = "/send_email", method = RequestMethod.POST)
    public String mailStudent(HttpServletRequest request, Model model) {
        
        String firstName = request.getParameter("fName");
        String lastName = request.getParameter("lName");
        String mailContent = request.getParameter("mailBody");
        String mailAddress = request.getParameter("mailAddress");

        System.out.println("email :" + mailAddress);
        System.out.println("body :" + mailContent);

        model.addAttribute("result", "Email sent");

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("mcitmymail", "July2018");
            }
        });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("mcitmymail@gmail.com"));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(mailAddress));
            message.setSubject("News");
            message.setText("Dear " + firstName + " " + lastName  
                    + "\n\n" + mailContent);

            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);

        }                
        return "redirect:/student_list";
    }
}
