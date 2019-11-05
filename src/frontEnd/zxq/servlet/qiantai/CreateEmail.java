package frontEnd.zxq.servlet.qiantai;


import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

public class CreateEmail {
    //根据配置创建会话对象, 用于和邮件服务器交互
    Session session;
    //发件人的名字
    String sendName;
    //发件人的邮箱
    String sendMail;
    //收件人邮箱
    String receiveMail;
    //收件人的昵称
    String receiveName;
    //邮件主题
    String title;
    //邮件正文
    String message;

    //创建出的邮件
    MimeMessage emailMessage;

    public CreateEmail( String receiveMail, String receiveName, String title, String message) throws UnsupportedEncodingException, MessagingException {

        //给session赋值-------------------------------------------------------------------

        //1.创建参数配置，用于连接邮件服务器的参数配置
        Properties props = new Properties();//参数配置
        props.setProperty("mail.transport.protocol","smtp");//使用的协议

        // 发件人的邮箱的 SMTP 服务器地址
        props.setProperty("mail.smtp.host","smtp.163.com");
        props.setProperty("mail.smtp.auth", "true");            // 需要请求认证
        this.session = Session.getInstance(props);
        session.setDebug(true);                                 // 设置为debug模式, 可以查看详细的发送 log


        this.sendName = "天猫商城网";
        this.sendMail = "yfg554689981@163.com";
        this.receiveMail = receiveMail;
        this.receiveName = receiveName;
        this.title = title;
        this.message = message;
        //给emailMessage赋值-------------------------------------------------------------------

        emailMessage = new MimeMessage(session);

        // 2. From: 发件人（昵称有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改昵称）
        emailMessage.setFrom(new InternetAddress(sendMail, sendName, "UTF-8"));

        // 3. To: 收件人（可以增加多个收件人、抄送、密送）
        emailMessage.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, receiveName, "UTF-8"));

        // 4. Subject: 邮件主题（标题有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改标题）
        emailMessage.setSubject(title, "UTF-8");

        // 5. Content: 邮件正文（可以使用html标签）（内容有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改发送内容）
        emailMessage.setContent(message, "text/html;charset=UTF-8");

        // 6. 设置发件时间
        emailMessage.setSentDate(new Date());

        // 7. 保存设置
        emailMessage.saveChanges();


        this.emailMessage = emailMessage;
    }

    public CreateEmail(String sendName, String sendMail, String receiveMail, String receiveName, String title, String message) throws UnsupportedEncodingException, MessagingException {

        //给session赋值-------------------------------------------------------------------

        //1.创建参数配置，用于连接邮件服务器的参数配置
        Properties props = new Properties();//参数配置
        props.setProperty("mail.transport.protocol","smtp");//使用的协议

        // 发件人的邮箱的 SMTP 服务器地址
        props.setProperty("mail.smtp.host","smtp.163.com");
        props.setProperty("mail.smtp.auth", "true");            // 需要请求认证
        this.session = Session.getInstance(props);
        session.setDebug(true);                                 // 设置为debug模式, 可以查看详细的发送 log


        this.sendName = sendName;
        this.sendMail = sendMail;
        this.receiveMail = receiveMail;
        this.receiveName = receiveName;
        this.title = title;
        this.message = message;
        //给emailMessage赋值-------------------------------------------------------------------

        emailMessage = new MimeMessage(session);

        // 2. From: 发件人（昵称有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改昵称）
        emailMessage.setFrom(new InternetAddress(sendMail, sendName, "UTF-8"));

        // 3. To: 收件人（可以增加多个收件人、抄送、密送）
        emailMessage.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail, receiveName, "UTF-8"));

        // 4. Subject: 邮件主题（标题有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改标题）
        emailMessage.setSubject(title, "UTF-8");

        // 5. Content: 邮件正文（可以使用html标签）（内容有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改发送内容）
        emailMessage.setContent(message, "text/html;charset=UTF-8");

        // 6. 设置发件时间
        emailMessage.setSentDate(new Date());

        // 7. 保存设置
        emailMessage.saveChanges();


        this.emailMessage = emailMessage;
    }

    public MimeMessage getEmailMessage() {
        return emailMessage;
    }

    public Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }

    public String getSendName() {
        return sendName;
    }

    public void setSendName(String sendName) {
        this.sendName = sendName;
    }

    public String getSendMail() {
        return sendMail;
    }

    public void setSendMail(String sendMail) {
        this.sendMail = sendMail;
    }

    public String getReceiveMail() {
        return receiveMail;
    }

    public void setReceiveMail(String receiveMail) {
        this.receiveMail = receiveMail;
    }

    public String getReceiveName() {
        return receiveName;
    }

    public void setReceiveName(String receiveName) {
        this.receiveName = receiveName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public void setEmailMessage(MimeMessage emailMessage) {
        this.emailMessage = emailMessage;
    }
}
