class Notebook
  attr_accessor :title, :body

  def initialize
    @list_of_notes = []
  end

  def notebook_menu
    loop do
      print_menu
      process(STDIN.gets.chomp)
    end
  end

  def print_menu
    puts "1. Input a new note"
    puts "2. Show me all my notes"
    puts "3. Pick a note"
    puts "9. Exit"
  end

  def process(selection)
    case selection
    when "1"
      new_note
    when "2"
      view_titles
    when "3"
      pick_note
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
    end
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
    puts "#{@list_of_notes[input-1][:title]} - #{@list_of_notes[input-1][:body]}"
  end

  private
  def blank?
    title.empty?
  end
end

Notebook.new.notebook_menu
