package com.globalin.shine.service.mail;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {
	
	@Autowired
	private JavaMailSender sender;
	
	public Map<String, Object> send(String emailfrom, String name, String emailto, String title, String body) {
		
		MailHandler mail;
		
		try {
			mail = new MailHandler(sender);
			mail.setFrom(emailfrom, name);
			mail.setTo(emailto);
			mail.setSubject(title);
			mail.setText(body);
			mail.send();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> result = new HashMap<>();
		String resultCode = "S-1";
		String msg = "메일이 발송되었습니다";
	    result.put("resultCode", resultCode);
	    result.put("msg", msg);
	    
	    return result;
	}
}