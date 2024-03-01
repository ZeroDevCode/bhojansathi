from telethon.sync import TelegramClient
import os

api_id='1402343'
api_hash='5b5336771b4579dace354e6a90265334'
phone_number = '+916355577329'

# Path to the file you want to send
file_path = r'build\app\outputs\flutter-apk\app-release.apk'

async def upload_file(client, chat, file_path):
    # Get the total file size
    total_bytes = os.path.getsize(file_path)
    uploaded_bytes = 0

    with open(file_path, 'rb') as file:
        while True:
            # Read the file in chunks
            chunk = file.read(4096)
            if not chunk:
                break

            # Upload the chunk
            await client.upload_file(chat, file=chunk)

            # Update progress
            uploaded_bytes += len(chunk)
            percent = uploaded_bytes / total_bytes * 100
            print(f"Uploaded: {percent:.2f}%")

with TelegramClient('session_name', api_id, api_hash) as client:
    client.connect()
    if not client.is_user_authorized():
        client.send_code_request(phone_number)
        client.sign_in(phone_number, input('Enter the code: '))
        
    # Replace 'username' with the username of the recipient or the chat ID
    upload_task = upload_file(client, 'coderbhavy_bot', file_path)
    client.loop.run_until_complete(upload_task)
