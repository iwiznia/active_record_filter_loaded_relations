# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record_filter_loaded_relations/version'

Gem::Specification.new do |spec|
  spec.name          = 'active_record_filter_loaded_relations'
  spec.version       = ActiveRecordFilterLoadedRelations::VERSION
  spec.authors       = ['Ionatan Wiznia']
  spec.email         = ['iwiznia@hotmail.com']
  spec.summary       = %q{Use ruby to filter already loaded associations when using a simple scope}
  spec.description   = %q{It analyzes the scope, and tries to apply the filtering of the scope without hitting the db again}
  spec.homepage      = ''
  spec.license       = 'GPL'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'

  spec.add_dependency('activerecord', '>= 4.0.0')
end