package frontEnd.zxq.servlet.qiantai;

import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeMessage;

/**
 * 将一个邮件发送出去
 */
public class SendEmail {
   //发邮件的人的邮箱和其密码
   String myEmailAccount = "yfg554689981@163.com";
   String myEmailPassword = "771410qazxc";
    //  根据配置创建会话对象, 用于和邮件服务器交互
    Session session;
    // 根据 Session 获取邮件传输对象
    Transport transport;
    //已经创建号的邮件
    MimeMessage emailMessage;

    public SendEmail(Session session, MimeMessage emailMessage) throws NoSuchProviderException {

        this.session = session;
        this.transport = session.getTransport();
        this.emailMessage = emailMessage;
    }

    public SendEmail(String myEmailAccount, String myEmailPassword, Session session, MimeMessage emailMessage) throws NoSuchProviderException {
        this.myEmailAccount = myEmailAccount;
        this.myEmailPassword = myEmailPassword;

        this.session = session;
        this.transport = session.getTransport();
        this.emailMessage = emailMessage;
    }

    public  void send() throws MessagingException {
        transport.connect(myEmailAccount, myEmailPassword);

        // 6. 发送邮件, 发到所有的收件地址, message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
        transport.sendMessage(emailMessage, emailMessage.getAllRecipients());

        // 7. 关闭连接
        transport.close();
    }

}
