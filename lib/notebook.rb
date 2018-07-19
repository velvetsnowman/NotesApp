class Notebook
  attr_accessor :title, :body

  def initialize
    @list_of_notes = []
  end

  def new_note
    puts "What is the title of your new note?"
    @title = gets.chomp
    fail 'Title is blank' if blank?
    puts "What is the body of your new note?"
    @body = gets.chomp
    @list_of_notes << {:title => @title, :body => @body}
  end

  def view_titles
    index = 1
    @list_of_notes.each do |hash|
      puts "#{index}. #{hash[:title]}"
      index += 1
    end
  end
  
  private
  def blank?
    title.empty?
  end
end
