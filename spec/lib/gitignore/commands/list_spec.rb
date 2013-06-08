require_relative '../../../spec_helper'

describe Gitignorer::Commands::List do
  include FakeFS::SpecHelpers

  before { VCR.insert_cassette 'command_list', :record => :new_episodes }

  after { VCR.eject_cassette }

  it 'should have a process method' do
    Gitignorer::Commands::List.should respond_to :process
  end

  it 'should list available templates' do
    output = capture_stdout { Gitignorer::Commands::List.process }
    output.should include "Ruby"
  end

end

def capture_stdout(&block)
  original_stdout = $stdout
  $stdout = fake = StringIO.new
  begin
    yield
  ensure
    $stdout = original_stdout
  end
  fake.string
end
