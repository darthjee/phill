shared_examples 'a module that is configurable' do
  it { expect(described_class).to respond_to(:config) }
  it { expect(described_class).to respond_to(:config=) }

  describe '.config' do
    context 'after configuration' do
      let(:config) { { a: 1, b: [{ c: 2 }] } }
      before do
        described_class.config = config
      end

      it { expect(described_class.config).to be_a(RecursiveOpenStruct) }

      it do
        expect(described_class.config.to_h).to eq(config)
      end

      it 'recurse over arrays' do
        expect(described_class.config.b.first).to be_a(RecursiveOpenStruct)
      end
    end
  end
end
