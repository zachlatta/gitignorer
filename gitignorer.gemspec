Gem::Specification.new do |s|
  s.name        = 'gitignorer'
  s.version     = '0.0.1'
  s.license     = 'MIT'
  s.date        = '2013-06-01'
  s.summary     = 'The best way to create gitignores.'
  s.description = 'Gitignorer is only the best way to create gitignores.'

  s.authors  = ['Zach Latta']
  s.email    = 'zchlatta@gmail.com'
  s.homepage = 'http://rubygems.org/gems/gitignorer'

  s.require_paths = %[lib]

  s.executables = ["gitignorer"]

  s.add_runtime_dependency 'commander', '~> 4.1.3'
  s.add_runtime_dependency 'octonore',  '~> 1.0.1'

  s.add_development_dependency 'bundler',   '~> 1.0'
  s.add_development_dependency 'rspec',     '~> 2.13.0'
  s.add_development_dependency 'webmock',   '~> 1.11.0'
  s.add_development_dependency 'vcr',       '~> 2.5.0'
  s.add_development_dependency 'rake',      '~> 10.0.4'
  s.add_development_dependency 'coveralls', '~> 0.6.7'
  s.add_development_dependency 'fakefs',    '~> 0.4.2'

  # = MANIFEST =
  s.files = %w[
    Gemfile
    LICENSE.md
    README.md
    Rakefile
    bin/gitignorer
    gitignorer.gemspec
    lib/gitignorer.rb
    lib/gitignorer/commands/create.rb
    spec/spec_helper.rb
    spec/lib/gitignore/commands/create_spec.rb
  ]
  # = MANIFEST =
  
  s.test_files = s.files.select { |path| path =~ /^spec\/spec|_spec.rb$/ }
end
