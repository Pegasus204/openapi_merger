# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OpenapiMerger::Merge do
  describe '#call' do
    let(:target) { described_class.new(options) }
    let(:origin) { OpenapiMerger::Input.new(options).call }
    let(:expected) do
      {
        'test' => {
          'hoge' => 'hoge',
          'merge' => {
            'yaml' => 'This is merged YAML'
          },
          'fuga' => 'fuga',
          'openapi' => 'merger'
        }
      }
    end

    context 'Replace $ref flag to relational file' do
      let(:options) { { input: 'spec/fixtures/dummy.yml' } }

      it 'Returns merged object' do
        expect(target.call(origin)).to eq expected
      end
    end
  end
end
