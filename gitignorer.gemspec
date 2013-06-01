lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'gitignorer/version'

Gem::Specification.new do |s|
  s.authors  = ['Zach Latta']
  s.email    = 'zchlatta@gmail.com'
  s.homepage = 'http://rubygems.org/gems/gitignorer'

  s.name        = 'Gitignorer'
  s.version     = Gitignorer::VERSION
  s.date        = '2013-06-01'
  s.summary     = 'Only the best way to create gitignore templates.'
  s.description = s.summary

  s.license = 'MIT'
  s.add_development_dependency 'bundler', '~> 1.0'
  s.add_dependency 'commander', '~> 4.1.3'
  s.add_dependency 'octonore',  '~> 1.0.0'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f|
                    File.basename(f)
                  }
  s.require_paths = ['lib']
end
