#!/bin/bash

customize_ruby() {
  chruby 2.6.6

  gem install \
    bundler \
    pry \
    pry-byebug \
    awesome_print
}
