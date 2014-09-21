# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mire/version'
Gem::Specification.new do |spec|
  spec.name          = 'mire'
  spec.version       = Mire::VERSION
  spec.authors       = ['Tanay Upadhyaya']
  spec.email         = ['tanay@genii.in']
  spec.summary       = %q{My IvRs gEnie}
  spec.description   = %q{The starting template for Mire}
  spec.homepage      = 'https://github.com/alienware/mire'
  spec.required_ruby_version = ">= 1.9.3"
  spec.license       = 'MIT'
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # runtime dependencies
  spec.add_runtime_dependency 'activesupport-core-ext', '~> 4.0.0.2'
  spec.add_runtime_dependency 'activesupport-inflector'
  spec.add_runtime_dependency 'thor', '~> 0.19.1'

  # development dependencies
  spec.add_development_dependency 'awesome_print', '~> 1.2.0'
  spec.add_development_dependency 'bundler', '~> 1.7.0'
  spec.add_development_dependency 'gem-ctags', '~> 1.0.6'
  spec.add_development_dependency 'guard', '~> 2.6.1'
  spec.add_development_dependency 'guard-rspec', '~> 4.3.1'
  spec.add_development_dependency 'pry', '~> 0.10.0'
  spec.add_development_dependency 'rake', '~> 10.3.2'
  spec.add_development_dependency 'rspec', '~> 3.0.0'
  spec.add_development_dependency 'rubocop', '~> 0.24.0'
  spec.add_development_dependency 'yard', '~> 0.8.7'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'factory_girl', '~> 4.0'

  # third party gem dependencies
  spec.add_runtime_dependency 'twilio-ruby', '~> 3.12'
end
