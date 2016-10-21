shared_examples 'a module that is configurable' do
  it { expect(described_class).to respond_to(:config) }
  it { expect(described_class).to respond_to(:config=) }

  describe '.config' do
    context 'after configuration' do
      before do
        described_class.config = {a: 1}
      end

      it { expect(described_class.config).to be_a(RecursiveOpenStruct) }
    end
  end
end
