# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OpenapiMerger::Output do
  describe '#call' do
    let(:target) { described_class.new(options) }
    let(:output) { { 'test': 'test_output' } }

    before do
      allow_any_instance_of(OpenapiMerger::Output).to receive(:build_yaml)
      allow_any_instance_of(OpenapiMerger::Output).to receive(:build_json)
      allow_any_instance_of(OpenapiMerger::Output).to receive(:build_unsupported)

      target.call(output)
    end

    context 'Output file was YAML' do
      let(:options) { { output: 'output.yml' } }

      it 'Call build_yaml method' do
        expect(target).to have_received(:build_yaml).once
      end
    end

    context 'Output file was JSON' do
      let(:options) { { output: 'output.json' } }

      it 'Call build_json method' do
        expect(target).to have_received(:build_json).once
      end
    end

    context 'Output file was unsupported file' do
      let(:options) { { output: 'output.txt' } }

      it 'Call build_unsupported method' do
        expect(target).to have_received(:build_unsupported).once
      end
    end
  end
end
