require 'spec_helper'

RSpec.describe OpenapiMerger::Merger::Base do
  describe '#call' do
    let(:target) { described_class.new({}) }

    it 'return JSON output' do
      allow(target).to receive(:input).and_return({'test': 'success'})

      expect(target.call).to eq "{\"test\":\"success\"}"
    end
  end
end
