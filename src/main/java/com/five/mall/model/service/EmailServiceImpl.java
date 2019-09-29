package com.five.mall.model.service;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.five.mall.model.dto.EmailDto;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private JavaMailSender mailSender;

	@Override
	public void sendMail(EmailDto dto) {
		try {
			String setfrom = "dnthfdl0416@naver.com"; // �븞�쟻�쑝硫� error
			String path = "";
			if (dto.getPictureUrl() != null) {
				//path = "D:\\sts-web-work\\FiveJo\\src\\main\\webapp\\resources\\images\\";
				path = "D:\\pr\\FiveJo\\src\\main\\webapp\\resources\\images\\";
			}

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper;
			messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom, dto.getSenderName()); // 蹂대궡�뒗�궗�엺 �깮�왂�븯硫� �젙�긽�옉�룞�쓣 �븞�븿

			messageHelper.setTo(dto.getReceiveMail()); // 諛쏅뒗�궗�엺 �씠硫붿씪
			messageHelper.setSubject(dto.getSubject()); // 硫붿씪�젣紐⑹� �깮�왂�씠 媛��뒫�븯�떎
			messageHelper.setText(dto.getMessage()); // 硫붿씪 �궡�슜

			if (dto.getPictureUrl() != null) {
				DataSource data = new FileDataSource(path + dto.getPictureUrl());
				messageHelper.addAttachment(MimeUtility.encodeText(dto.getPictureUrl(), "UTF-8", "B"), data);
			}
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
}
