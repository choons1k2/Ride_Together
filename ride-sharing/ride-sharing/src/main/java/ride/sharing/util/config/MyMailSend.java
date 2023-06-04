package ride.sharing.util.config;

import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import lombok.Data;

@Data
@Configuration
public class MyMailSend {

	@Autowired
	private HttpServletRequest request;

	private String host; // host 네이버일 경우(smtp.naver.com), gmail경우(smtp.gmail.com) 로컬일 경우 localhost
	private String username; // 아이디
	private String password; // 비밀번호
	private int size;

	public void emailSend(String fromEmail, String nickname, InternetAddress[] toEmail, String subject, String text,
			String contentType) {

		Properties props = System.getProperties();
		props.put("mail.smtp.host", host);

		if (!host.equals("localhost")) {
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 465);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.trust", host);
		}

		// .Session.getDefaultInstance(props) 첨부파일과같이 발송될 경우 에러
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		MimeMessage msg = new MimeMessage(session);

		try {
			// 편지보낸시간
			msg.setSentDate(new Date());
			msg.setFrom(new InternetAddress(fromEmail, nickname));
			// 이메일 수신자
			// InternetAddress to = new InternetAddress(toEmail);
			// msg.setRecipient(Message.RecipientType.TO, to);

			msg.addRecipients(Message.RecipientType.TO, toEmail);

			// 이메일 제목
			msg.setSubject(subject, "UTF-8");
			// 이메일 내용
			msg.setText(text, "UTF-8");

			// 이메일 헤더
			msg.setHeader("content-Type", contentType);

			// 메일보내기
			javax.mail.Transport.send(msg, msg.getAllRecipients());

		} catch (AddressException addr_e) {
			addr_e.printStackTrace();
		} catch (MessagingException msg_e) {
			msg_e.printStackTrace();
		} catch (Exception msg_e) {
			msg_e.printStackTrace();
		}

	}

	// 인증키 생성
	public String getKey(int size) {
		this.size = size;
		return getAuthCode();
	}

	// 인증코드 난수 발생
	private String getAuthCode() {
		Random random = new Random();
		StringBuffer buffer = new StringBuffer();
		int num = 0;

		while (buffer.length() < size) {
			num = random.nextInt(10);
			buffer.append(num);
		}

		return buffer.toString();
	}



}
