# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OpenapiMerger::Input do
  describe '#call' do
    let(:target) { described_class.new(options) }

    before do
      allow_any_instance_of(OpenapiMerger::Input).to receive(:parse_json)
      allow_any_instance_of(OpenapiMerger::Input).to receive(:parse_yaml)
      allow_any_instance_of(OpenapiMerger::Input).to receive(:parse_unsupported)

      target.call
    end

    context 'Input file was YAML' do
      let(:options) { { input: 'spec/fixtures/openapi.yml' } }

      it 'Call parse_yaml method' do
        expect(target).to have_received(:parse_yaml)
      end
    end

    context 'Input file was JSON' do
      let(:options) { { input: 'spec/fixtures/openapi.json' } }

      it 'Call parse_json method' do
        expect(target).to have_received(:parse_json)
      end
    end

    context 'Input file was unsupported file' do
      let(:options) { { input: 'spec/fixtures/openapi.txt' } }

      it 'Call parse_unsupported method' do
        expect(target).to have_received(:parse_unsupported)
      end
    end
  end
end
