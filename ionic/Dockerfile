#
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#

FROM alpine:latest
LABEL maintainer="João Prado <contato@joaoprado.com.br>"

USER root

ENV GLIB_PACKAGE_BASE_URL https://github.com/sgerrand/alpine-pkg-glibc/releases/download
#ENV GLIB_VERSION 2.25-r0
ENV GLIB_VERSION 2.30-r0

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

ENV GRADLE_HOME /usr/local/gradle
#ENV GRADLE_VERSION 4.4
ENV GRADLE_VERSION 6.0.1

ENV ANDROID_SDK_ROOT /usr/local/android-sdk-linux
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV ANDRDOID_TOOLS_VERSION r25.2.5
#ENV ANDRDOID_TOOLS_VERSION r26.0.2
ENV ANDROID_API_LEVELS android-26
#ENV ANDROID_BUILD_TOOLS_VERSION 26.0.2
ENV ANDROID_BUILD_TOOLS_VERSION 29.0.0

ENV IONIC_VERSION 4.12.0

ENV PATH /usr/local/gradle/bin:/usr/lib/jvm/java-1.8-openjdk/bin:/usr/local/android-sdk-linux/tools:/usr/local/android-sdk-linux/platform-tools:$PATH

RUN apk upgrade && apk update \
    & apk add --no-cache --update \
    curl openjdk8-jre openjdk8 \
    nodejs nodejs-npm \
    git \
    python python-dev py-pip build-base \
    && npm i -g --unsafe-perm cordova cordova-res ionic@${IONIC_VERSION} npm-check \
    && rm -rf /var/cache/apk/* /tmp/*

RUN mkdir -p ${GRADLE_HOME} \
    && curl -L https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip > /tmp/gradle.zip \
    && unzip /tmp/gradle.zip -d ${GRADLE_HOME} \
    && mv ${GRADLE_HOME}/gradle-${GRADLE_VERSION}/* ${GRADLE_HOME} \
    && rm -r ${GRADLE_HOME}/gradle-${GRADLE_VERSION}/

RUN mkdir -p ${ANDROID_HOME} \
  && curl -L https://dl.google.com/android/repository/tools_${ANDRDOID_TOOLS_VERSION}-linux.zip > /tmp/tools.zip \
  && unzip /tmp/tools.zip -d ${ANDROID_HOME}

RUN curl -L https://raw.githubusercontent.com/wassim6/alpine-pkg-glibc/master/sgerrand.rsa.pub > /etc/apk/keys/sgerrand.rsa.pub \
    && curl -L ${GLIB_PACKAGE_BASE_URL}/${GLIB_VERSION}/glibc-${GLIB_VERSION}.apk > /tmp/glibc.apk \
    && curl -L ${GLIB_PACKAGE_BASE_URL}/${GLIB_VERSION}/glibc-bin-${GLIB_VERSION}.apk > /tmp/glibc-bin.apk \
    &&  apk add /tmp/glibc-bin.apk /tmp/glibc.apk

RUN echo y | android update sdk --no-ui -a --filter platform-tools,${ANDROID_API_LEVELS},build-tools-${ANDROID_BUILD_TOOLS_VERSION}

RUN mkdir $ANDROID_HOME/licenses \
    && echo 8933bad161af4178b1185d1a37fbf41ea5269c55 > $ANDROID_HOME/licenses/android-sdk-license \
    && echo d56f5187479451eabf01fb78af6dfcb131a6481e >> $ANDROID_HOME/licenses/android-sdk-license \
    && echo 24333f8a63b6825ea9c5514f83c2829b004d1fee >> $ANDROID_HOME/licenses/android-sdk-license \
    && echo 84831b9409646a918e30573bab4c9c91346d8abd > $ANDROID_HOME/licenses/android-sdk-preview-license

RUN rm -rf /tmp/* /var/cache/apk/*

ADD profile.sh /etc/profile.d

WORKDIR /usr/src