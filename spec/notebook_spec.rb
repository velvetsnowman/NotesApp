require 'notebook'

describe Notebook do
  subject(:notebook) {described_class.new}

  describe '#new_note' do
    before do
      allow($stdout).to receive(:write)
    end

    context 'title is empty' do
      it 'should raise an error' do
        allow(notebook).to receive(:gets).and_return("\n")
        notebook.title
        expect(notebook.title).to eq nil
        expect {notebook.new_note}.to raise_error('Title is blank')
      end
    end
    it 'should let a user add a new note' do
      allow(notebook).to receive(:gets).and_return("Daniel\n", "good day\n" )
      notebook.new_note
      expect(notebook.title).to eq "Daniel"
      expect(notebook.body).to eq "good day"
    end
  end

  describe '#view_titles' do
    before do
      allow($stdout).to receive(:write)
    end

    it 'should let a user view a list of all note titles' do
      allow(notebook).to receive(:gets).and_return("Daniel\n")
      notebook.new_note
      expect{notebook.view_titles}.to output("Entry: 1. Daniel\n").to_stdout
    end
  end

  describe '#pick_note' do
    before do
      allow($stdout).to receive(:write)
    end

    specify do
      allow(notebook).to receive(:gets).and_return("Daniel\n", "good day\n")
      notebook.new_note
      allow(notebook).to receive(:gets).and_return("1\n")
      notebook.pick_note { is_expected.to include("Daniel - good day\n") }
    end
  end
 end
