require 'notebook'
describe Notebook do
  subject(:notebook) {described_class.new}

  describe '#new_note' do
    it { is_expected.to respond_to(:new_note) }
    it 'should let you add a new_note for your note' do
      allow(notebook).to receive(:gets).and_return("Daniel")
      expect(notebook.new_note).to be == [{:title=>"Daniel", :body=>"Daniel"}]
    end
  end
end
