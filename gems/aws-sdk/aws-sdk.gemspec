# frozen_string_literal: true

Gem::Specification.new do |spec|

  spec.name          = 'aws-sdk'
  spec.version       = File.read(File.expand_path('../VERSION', __FILE__)).strip
  spec.summary       = 'AWS SDK for Ruby'
  spec.description   = 'The official AWS SDK for Ruby. Provides both resource oriented interfaces and API clients for AWS services.'
  spec.author        = 'Amazon Web Services'
  spec.homepage      = 'https://github.com/aws/aws-sdk-ruby'
  spec.license       = 'Apache-2.0'
  spec.email         = ['aws-dr-rubygems@amazon.com']
  spec.files         = Dir['LICENSE.txt', 'CHANGELOG.md', 'VERSION', 'lib/**/*.rb']

  # gem dependency
  spec.add_dependency('aws-sdk-resources', '~> 3')
  # end gem dependency

  spec.metadata = {
    'source_code_uri' => 'https://github.com/aws/aws-sdk-ruby/tree/version-3/gems/aws-sdk',
    'changelog_uri'   => 'https://github.com/aws/aws-sdk-ruby/tree/version-3/gems/aws-sdk/CHANGELOG.md'
  }

  spec.required_ruby_version = '>= 2.5'
end
