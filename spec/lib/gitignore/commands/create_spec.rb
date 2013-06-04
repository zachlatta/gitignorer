require_relative '../../../spec_helper.rb'

describe Gitignorer::Commands::Create do
  include FakeFS::SpecHelpers

  before { VCR.insert_cassette 'command_create', :record => :new_episodes }

  after { VCR.eject_cassette }

  it 'should have a process method' do
    Gitignorer::Commands::Create.should respond_to :process
  end

  it 'should raise an ArgumentError if args are empty' do
    expect {
      Gitignorer::Commands::Create.process("")
    }.to raise_error(ArgumentError)
  end

  it 'should raise an ArgumentError if args are invalid' do
    expect {
      Gitignorer::Commands::Create.process(["asdfa", "jasdf"])
    }.to raise_error(ArgumentError)
  end
  
  it 'should create a new template' do
    Gitignorer::Commands::Create.process(["Java", "Maven"])
    File.exists?(".gitignore").should == true

    file = File.open('.gitignore', 'rb')
  end

end
