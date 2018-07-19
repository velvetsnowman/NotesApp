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

  def pick_note
    view_titles
    puts "What note would you like to see?"
    input = gets.chomp.to_i
    return "#{@list_of_notes[input-1][:title]} - #{@list_of_notes[input-1][:body]}"
  end

  private
  def blank?
    title.empty?
  end
end
