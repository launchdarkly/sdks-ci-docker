ARG API_VERSION

FROM circleci/android:api-${API_VERSION}

WORKDIR /home/circleci

ADD downloads/xamarin-android.tar.bz2 .

ADD docker-build.sh .

RUN ./docker-build.sh
