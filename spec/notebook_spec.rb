require 'notebook'

describe Notebook do
  subject(:notebook) {described_class.new}

  describe 'new_note' do
    before do
      allow($stdout).to receive(:write)
    end
    it { is_expected.to respond_to(:new_note) }
    context 'title is empty' do
      it 'should raise an error' do
        allow(notebook).to receive(:gets).and_return("\n")
        notebook.title
        expect(notebook.title).to eq nil
        expect {notebook.new_note}.to raise_error('Title is blank')
      end
    end
    it 'should let a user add a new note' do
      allow(notebook).to receive(:gets).and_return("Daniel\n")
      notebook.new_note
      expect(notebook.title).to eq "Daniel"
      allow(notebook).to receive(:gets).and_return("good day\n")
      notebook.new_note
      expect(notebook.body).to eq "good day"
    end
  end

  describe 'view_titles' do
    it { is_expected.to respond_to(:view_titles) }
    it 'should let a user view a list of all note titles' do
      allow(notebook).to receive(:gets).and_return("Daniel\n")
      notebook.new_note
      expect(notebook.title).to eq "Daniel"
      expect{notebook.view_titles}.to output("1. Daniel\n").to_stdout
    end
  end
 end
