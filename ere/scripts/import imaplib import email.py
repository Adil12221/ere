import    imaplib import    email
import    time
import    re
import    os
import    logging
from      email.header import decode_header
# Set up logging
logging.basicConfig(filename='email_processor.log', level=logging.INFO, format='%(asctime)s
                    
                    %(levelname)s:%(message)s')
# Email account credentials
EMAIL_USER = '


                   def process_email(subject, sender, body):
    # Check for specific keywords in the subject or body
    if 'urgent' in subject.lower() or 'urgent' in body.lower():
        logging.info(f"Urgent email from {sender}: {subject}")
        # Add your processing logic here (e.g., send a notification)
    else:
        logging.info(f"Processed email from {sender}: {subject}")
def main():
    # Connect to the email server
    mail = imaplib.IMAP4_SSL('imap.example.com')
    mail.login(EMAIL_USER, 'your_password')
    mail.select('inbox')
    while True:
        # Search for all emails in the inbox
        status, messages = mail.search(None, 'ALL')
        email_ids = messages[0].split()
        for email_id in email_ids:
            # Fetch the email by ID
            status, msg_data = mail.fetch(email_id, '(RFC822)')
            for response_part in msg_data:
                if isinstance(response_part, tuple):
                    msg = email.message_from_bytes(response_part[1])
                    subject, encoding = decode_header(msg['Subject'])[0]
                    if isinstance(subject, bytes):
                        subject = subject.decode(encoding if encoding else 'utf-8')
                    sender = msg.get('From')
                    body = ''
                    if msg.is_multipart():
                        for part in msg.walk():
                            content_type = part.get_content_type()
                            content_disposition = str(part.get('Content-Disposition'))
                            if content_type == 'text/plain' and 'attachment' not in content_disposition:
                                body += part.get_payload(decode=True).decode()
                    else:
                        body += msg.get_payload(decode=True).decode()
                    process_email(subject, sender, body)
        time.sleep(60)  # Check for new emails every minute
if __name__ == "__main__":
    main()
    gmail.logout()
         lf
         filemode='w'
         help   ='Process incoming emails and log urgent ones.'
                        