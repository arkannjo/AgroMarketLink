# Usar a imagem Dart como base
FROM dart

# Atualizar o sistema e instalar as dependências necessárias
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get update && \
    apt-get install -y openjdk-11-jdk

# Clonar Flutter do repositório oficial
RUN git clone https://github.com/flutter/flutter.git -b stable --depth 1 /flutter
ENV PATH="/flutter/bin:$PATH"

# Baixar e instalar o Google Chrome
RUN curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb --output ~/google-chrome-stable_current_amd64.deb && \
    dpkg -i ~/google-chrome-stable_current_amd64.deb || apt-get install -yf && \
    rm ~/google-chrome-stable_current_amd64.deb

# Configurar variáveis de ambiente para o Android SDK
ENV ANDROID_SDK_ROOT /usr/lib/android-sdk
ENV PATH $PATH:$ANDROID_SDK_ROOT/cmdline-tools/tools/bin
ENV PATH $PATH:$ANDROID_SDK_ROOT/platform-tools

# Baixar e instalar o Android SDK Command-line tools
RUN mkdir -p ${ANDROID_SDK_ROOT}/cmdline-tools && \
    curl -o cmdline-tools.zip https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip && \
    unzip cmdline-tools.zip -d ${ANDROID_SDK_ROOT}/cmdline-tools && \
    mv ${ANDROID_SDK_ROOT}/cmdline-tools/cmdline-tools ${ANDROID_SDK_ROOT}/cmdline-tools/tools && \
    rm cmdline-tools.zip


# Atualizar e instalar os componentes do Android SDK
RUN yes | sdkmanager --licenses && \
    sdkmanager --update && \
    sdkmanager "platform-tools" "platforms;android-29" "build-tools;29.0.3"

# Rodar o flutter doctor para finalizar a configuração
RUN flutter doctor
