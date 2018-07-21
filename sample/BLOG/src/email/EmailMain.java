package email;

public class EmailMain {
 public static void main(String[] args) {
	 
 String to = "받는사람@이메일.주소";
 String subject = "반갑습니다.";
 String content = "가입을 축하드립니다.";
 SMTPAuthenticator smtp = new SMTPAuthenticator();
 Mailer mailer = new Mailer();
 
 mailer.sendMail(to, subject, content, smtp);
 }
}
