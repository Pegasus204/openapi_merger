# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OpenapiMerger::Process::Optional do
  describe '#call' do
    let(:target) { described_class.new(options) }
    let(:origin) { OpenapiMerger::Input.new(options).call }
    let(:expected) do
      {
        'test' => {
          'required' => %w[
            id
            name
          ],
          'properties' => {
            'id' => {
              'hoge' => 'fuga'
            },
            'name' => {
              'hoge' => 'fuga'
            },
            'email' => {
              'hoge' => 'fuga'
            }
          }
        }
      }
    end

    context 'Replace required object from optional: false' do
      let(:options) { { input: 'spec/fixtures/optional.yml' } }
      it do
        expect(target.call(origin)).to eq expected
      end
    end
  end
end
