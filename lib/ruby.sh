#!/bin/bash

customize_ruby() {
  e_header "Installing ruby along with gems ..."

  ruby-install


  chruby 2.4.1

  gem install \
    bundler \
    pry \
    pry-byebug \
    awesome_print
}
