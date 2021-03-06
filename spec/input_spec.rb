require_relative 'spec_helper'

module Blooper
  describe Input do

    before(:each) do
      @stdin = stub_const('STDIN', Class.new)
      @stdin.stub(set_encoding: 'UTF-8')
    end

    it 'should bind proper flow' do
      Input.new.flow.should eql(@stdin)
      Input.new(STDIN).flow.should eql(@stdin)
      Input.new(STDOUT).flow.should_not eql(@stdin)
    end

    it 'should return correct line' do
      mock_str = 'Ltime 2013-01-20_07:40:39.3N+0200'
      @stdin.should_receive(:each).and_yield(mock_str)
      expect { |b| Input.each(&b) }.to yield_with_args(Tuple)
    end

  end
end
