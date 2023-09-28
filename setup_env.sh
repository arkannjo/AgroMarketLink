#!/bin/bash

# Atualiza o sistema
sudo apt-get update
sudo apt-get upgrade -y

# Instala dependências necessárias
sudo apt-get install -y software-properties-common openjdk-11-jdk git curl unzip xz-utils

# Clona Flutter do repositório oficial
git clone https://github.com/flutter/flutter.git -b stable --depth 1 ~/flutter
export PATH="$PATH:$HOME/flutter/bin"

# Baixa e instala o Google Chrome
curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb --output ~/google-chrome-stable_current_amd64.deb
sudo dpkg -i ~/google-chrome-stable_current_amd64.deb || sudo apt-get install -yf
rm ~/google-chrome-stable_current_amd64.deb

# Configura variáveis de ambiente para o Android SDK
export ANDROID_SDK_ROOT="/lib/android-sdk"
export PATH="$PATH:$ANDROID_SDK_ROOT/cmdline-tools/tools/bin"
export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"
export ANDROID_HOME=/lib/android-sdk/

# Baixa e instala Android SDK Command-line tools
mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools
curl -o cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip
unzip cmdline-tools.zip -d ${ANDROID_SDK_ROOT}/cmdline-tools
mv ${ANDROID_SDK_ROOT}/cmdline-tools/cmdline-tools ${ANDROID_SDK_ROOT}/cmdline-tools/tools
rm cmdline-tools.zip

# Aceita licenças e atualiza componentes do Android SDK
yes | sdkmanager --licenses
sdkmanager --update
sdkmanager "platform-tools" "platforms;android-29" "build-tools;29.0.3"

# Roda flutter doctor
flutter doctor
