# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'svg_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "svg_rails"
  spec.version       = SvgRails::VERSION
  spec.authors       = ["Vlad Andersen"]
  spec.email         = ["vlad.andersen@gmail.com"]
  spec.summary       = %q{Support for SVG in Rails.}
  spec.description   = %q{Best practices to use SVG assets in Rails view helpers
                       is to wrap them in object/embed tags.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_dependency 'sass', '> 0'

  spec.add_runtime_dependency "rails", '> 4'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end