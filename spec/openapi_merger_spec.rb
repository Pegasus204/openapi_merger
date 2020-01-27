require 'spec_helper'

RSpec.describe OpenapiMerger do
  describe '#call' do
    before do
      allow(OpenapiMerger::Merger::JSONMerger).to receive_message_chain(:new, :call)
      allow(OpenapiMerger::Merger::YAMLMerger).to receive_message_chain(:new, :call)
    end

    context '.yml file specified' do
      let(:options) { {input: 'test.yml'} }
      let(:target) { OpenapiMerger::Merger::YAMLMerger.new(options) }

      it 'call YAML merger' do
        OpenapiMerger.call(options)
        expect(target).to have_received(:call).once
      end
    end

    context '.json file specified' do
      let(:options) { {input: 'test.json'} }
      let(:target) { OpenapiMerger::Merger::JSONMerger.new(options) }

      it 'call JSON merger' do
        OpenapiMerger.call(options)
        expect(target).to have_received(:call).once
      end
    end

    context '.txt file specified' do
      let(:options) { {input: 'test.txt'} }
      let(:target) { OpenapiMerger.call(options) }

      it 'return NoInputError' do
        expect(target).to eq OpenapiMerger::UnexpectedInputFileError
      end
    end

    context 'No input file is specified' do
      let(:options) { {} }
      let(:target) { OpenapiMerger.call(options) }

      it 'return NoInputFileError' do
        expect(target).to eq OpenapiMerger::NoInputFileError
      end
    end
  end
end
