# frozen_string_literal: true

require_relative 'lib/openapi_merger/version'

Gem::Specification.new do |spec|
  spec.name          = 'openapi_merger'
  spec.version       = OpenapiMerger::VERSION
  spec.authors       = ['Fukaya Temma']
  spec.email         = ['ride.or.die.2215@gmail.com']

  spec.summary       = 'Merge OpenAPI documents split into multiple files.'
  spec.description   = 'Merge OpenAPI documents split into multiple files.'
  spec.homepage      = 'https://github.com/Pegasus204/openapi_merger'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_runtime_dependency 'dotenv'
  spec.add_runtime_dependency 'filewatcher'
  spec.add_runtime_dependency 'thor'
end
