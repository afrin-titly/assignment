FROM ruby:latest
WORKDIR /root
COPY . /root
RUN gem install nokogiri
CMD ["/bin/bash"]