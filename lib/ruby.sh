#!/bin/bash

customize_ruby() {
  e_header "Installing ruby along with gems ..."

  chruby 2.5.3

  gem install \
    bundler \
    pry \
    pry-byebug \
    awesome_print
}
