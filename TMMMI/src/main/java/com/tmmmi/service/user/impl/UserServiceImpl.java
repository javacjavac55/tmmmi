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
	public Map<String, Object> getUserList(Search search) throws Exception {
		List<User> list= userDao.getUserList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}
	
	public boolean sendMail(String email, String authNum)throws Exception {
		
		System.out.println("�̸��� ���� ����");

		String host = "smtp.gmail.com";// smtp����
		String subject = "������ȣ ����";
		String fromName = "������";
		String from = "jaavaa05@gmail.com";// ������ ���� �ּ�
		String to = email;// ������ȣ ���� ������ �̸���

		String content = "������ȣ[" + authNum + "]";

		try {

			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");// �̰��� �����ΰ� �� 465 ��Ʈ�ϱ�
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
			msg.setRecipients(Message.RecipientType.TO, address1);// �޴»��
			msg.setSubject(subject);// ��������
			msg.setSentDate(new Date());// ������ ��¥
			msg.setContent(content, "text/html;charset=euc-kr");// ���� ����(HTML����)

			Transport.send(msg);// ���Ϻ�����
			System.out.println("�̸��� ���� ��");
			
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
		if(user != null) {
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
	public User searchUserPw(User user) {
		return userDao.searchUserPw(user);
	}

}
