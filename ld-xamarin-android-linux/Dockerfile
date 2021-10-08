ARG API_VERSION

FROM circleci/android:api-${API_VERSION}

WORKDIR /home/circleci

COPY downloads/xamarin-android.tar.bz2 .

COPY docker-build.sh .

RUN ./docker-build.sh
