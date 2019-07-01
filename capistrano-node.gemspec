# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-node'
  spec.version       = '0.0.1'
  spec.authors       = ['Tom Scott-Malden', 'Neil Aitken']
  spec.email         = ['tom@skywire.co.uk', 'neil@skywire.co.uk']
  spec.description   = %q{staging branch support for Skywire Capistrano}
  spec.summary       = %q{staging branch support for Skywire Capistrano}
  spec.homepage      = 'https://github.com/Skywire/capistrano-staging-branch'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '~> 3.1'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
end