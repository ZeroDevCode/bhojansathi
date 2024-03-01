@echo off

REM Step 1: Build the APK
flutter build apk --release

REM Step 2: Path to the APK file
set "APK_PATH=build\app\outputs\flutter-apk\app-release.apk"

REM Step 3: Telegram bot token and chat ID
set "BOT_TOKEN=6110241936:AAGBxN296JeP8LG-HZrIQKFHNPjpOVFFUEU"
set "CHAT_ID=+919662430979"

REM Step 4: Send the APK file to Telegram
python send_apk.py %BOT_TOKEN% %CHAT_ID% %APK_PATH%

pause