# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OpenapiMerger::Process::Optional do
  describe '#call' do
    let(:target) { described_class.new(options) }
    let(:origin) { OpenapiMerger::Input.new(options).call }

    context 'Replace required object from optional: false' do
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
      let(:options) { {input: 'spec/fixtures/optional.yml'} }
      it do
        expect(target.call(origin)).to eq expected
      end
    end

    context 'Replace required object from optional: false. even if number of hash key is more than one.' do
      let(:expected) do
        {
          'other' => 'test',
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
          },
          'required' => %w[
            id
            name
          ]
        }
      end
      let(:options) { {input: 'spec/fixtures/optional2.yml'} }
      it do
        expect(target.call(origin)).to eq expected
      end
    end
  end
end
