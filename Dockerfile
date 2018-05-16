FROM jguyomard/hugo-builder

#sass
RUN apk add --update bash nodejs nodejs-npm 
RUN npm install -g sass

#for s3cmd
RUN apk add --update python py-pip py-setuptools git ca-certificates
RUN pip install python-dateutil

RUN git clone https://github.com/s3tools/s3cmd.git /opt/s3cmd
RUN ln -s /opt/s3cmd/s3cmd /usr/bin/s3cmd

COPY ./sample.aws.s3cfg /root/.s3cfg
