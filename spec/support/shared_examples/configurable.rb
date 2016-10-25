shared_examples 'a module that is configurable' do
  it { expect(described_class).to respond_to(:config) }
  it { expect(described_class).to respond_to(:config=) }

  describe '.config' do
    it { expect(described_class.config).to be_nil }

    context 'after configuration' do
      let(:config) { {a: 1} }
      before do
        described_class.config = config
      end

      it { expect(described_class.config).to be_a(RecursiveOpenStruct) }

      it do
        expect(described_class.config.to_h).to eq(config)
      end
    end
  end
end
