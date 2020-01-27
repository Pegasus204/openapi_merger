require 'spec_helper'

RSpec.describe OpenapiMerger::Merger::Base do
  describe '#call' do
    let(:target) { described_class.new({}) }

    it 'return yaml output' do
      allow(target).to receive(:inputfile).and_return("test: success!")
      expect(target.call).to eq "--- 'test: success!'\n"
    end
  end
end
