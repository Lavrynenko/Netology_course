import smtplib
from email.mime.text import MIMEText
from email.header import Header

def send_mail():
	mailsender = smtplib.SMTP('smtp.gmail.com', 587)
	mailsender.starttls()
	mailsender.login('oleksiy.lavrynenko@gmail.com', 'v3B7In19Ry2')
	mail_recipient = 'oleksiy.lavrynenko@outlook.com'
	mail_subject = 'Тема сообщения'
	mail_body = 'Текст сообщения'
	msg = MIMEText(mail_body, 'plain', 'utf-8')
	msg['Subject'] = Header(mail_subject, 'utf-8')
	mailsender.sendmail('oleksiy.lavrynenko@gmail.com', mail_recipient, msg.as_string())
	mailsender.quit()
	print('Сообщение на адрес', mail_recipient, 'отправлено')
send_mail()