# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'authman/version'

Gem::Specification.new do |s|
  s.name        = 'authman'
  s.version     = Authman::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['David François']
  s.email       = ['david.francois@paymium.com']
  s.homepage    = 'https://github.com/paymium/authman'
  s.summary     = 'Software TOTP generator'
  s.description = s.summary

  s.required_rubygems_version = '>= 1.3.6'

  s.add_runtime_dependency 'gpgme'
  s.add_runtime_dependency 'rotp'

  s.files        = Dir.glob('lib/**/*') + %w(LICENSE README.md)
  s.require_path = 'lib'

  s.bindir = 'bin'
  s.executables << 'authman'
end

