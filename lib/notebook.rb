class Notebook
  attr_reader :notes

  def initialize
    @list_of_notes = []
  end

  def new_note
    puts "What is the title of this note?"
    @title = gets.chomp
    puts "What is the body of your note?"
    @body = gets.chomp
    @list_of_notes.push({title: @title, body: @body})
  end
end
