package com.tmmmi.service.user.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tmmmi.common.Search;
import com.tmmmi.service.domain.User;
import com.tmmmi.service.user.UserDao;
import com.tmmmi.service.user.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
	
	///Field
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addUser(User user) throws Exception {
		userDao.addUser(user);
	}

	@Override
	public User getUser(int userNo) throws Exception {
		return userDao.getUser(userNo);
	}

	@Override
	public void updateUser(User user) throws Exception {
		userDao.updateUser(user);
	}

	@Override
	public void withdrawUser(User user) throws Exception{
		userDao.withdrawUser(user);
	}
	
	@Override
	public void cancleUser(User user) throws Exception{
		userDao.cancleUser(user);
	}

	@Override
	public Map<String, Object> getUserList(Search search) throws Exception {
		List<User> list= userDao.getUserList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	public boolean sendMail(String email, String authNum)throws Exception {
		
		System.out.println("이메일 전송 시작");

		String host = "smtp.gmail.com";// smtp서버
		String subject = "TMMMI 인증번호";
		String fromName = "관리자";
		String from = "jaavaa05@gmail.com";// 관리자 메일 주소
		String to = email;// 인증번호 받을 유저의 이메일

		String content =
				"<img src=http://192.168.0.9:8080/images/Logo/logo2.png>"+
				"<br/><br/>환영합니다! TMMMI에서 인증번호를 알려드립니다. <br/> 인증번호:[" + authNum + "]";
		

		try {

			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");// 이것은 무엇인가 왜 465 포트일까
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("jaavaa05@gmail.com", "tmmmi1234");
				}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));

			InternetAddress[] address1 = { new InternetAddress(to) };
			msg.setRecipients(Message.RecipientType.TO, address1);// 받는사람
			msg.setSubject(subject);// 메일제목
			msg.setSentDate(new Date());// 보내는 날짜
			msg.setContent(content, "text/html;charset=euc-kr");// 내용 설정(HTML형식)

			Transport.send(msg);// 메일보내기
			System.out.println("이메일 전송 끝");
			
			return true;
			
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean checkDuplication(String userId) throws Exception {
		boolean result = true;
		User user = userDao.getUserId(userId);
		if(user.getUserId().equals("no")) {
			result = false;
		}
		return result;
	}
	
	@Override
	public boolean emailCheckDuplication(String email) {
		boolean result = true;
		email = email.replaceAll("\"", "");
		User user = userDao.emailCheckDuplication(email);
		if(user != null) {
			result = false;
		}
		return result;
	}

	@Override
	public User getUserId(String userId) throws Exception {
		return userDao.getUserId(userId);
	}
	
	@Override
	public User searchUserId(User user) {
		return userDao.searchUserId(user);
	}
	
	@Override
	public void searchUserPw(User user) {
		userDao.searchUserPw(user);
	}

}
