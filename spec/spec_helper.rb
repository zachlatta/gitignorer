require 'coveralls'
Coveralls.wear!

require 'gitignorer'
require 'webmock/rspec'
require 'vcr'
require 'fakefs/spec_helpers'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies.
  config.order = 'random'
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/gitignorer_cassettes'
  c.hook_into :webmock
end
