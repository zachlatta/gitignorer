require_relative '../../../spec_helper'

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
  end
  
  it 'should create the proper heading in new templates' do
    Gitignorer::Commands::Create.process(["Ruby"])
    contents = File.read('.gitignore')
    contents.should include "############\n" +
                            "#   Ruby   #\n" +
                            "############\n"
  end

end
