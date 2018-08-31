import smtplib
from email.mime.text import MIMEText
from email.header import Header

def send_mail():
	mailsender = smtplib.SMTP('smtp.gmail.com', 587)
	mailsender.starttls()
	mailsender.login('Адрес почты отправителя', 'Пароль к почте отправителя')
	mail_recipient = 'Адрес почты получателя'
	mail_subject = 'Тема сообщения'
	mail_body = 'Текст сообщения'
	msg = MIMEText(mail_body, 'plain', 'utf-8')
	msg['Subject'] = Header(mail_subject, 'utf-8')
	mailsender.sendmail('Адрес почты отправителя', mail_recipient, msg.as_string())
	mailsender.quit()
	print('Сообщение на адрес', mail_recipient, 'отправлено')
send_mail()