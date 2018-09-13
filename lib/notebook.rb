class Notebook
  attr_reader :title,
              :body

  def initialize
    @list_of_notes = []
  end

  def new_note
    puts "TITLE: "
    @title = gets.chomp
    fail 'Title is blank' if blank?
    puts "BODY: "
    @body = gets.chomp
    @list_of_notes << {:title => @title, :body => @body}
  end

  def view_titles
    index = 1
    @list_of_notes.each do |hash|
      puts "Entry: #{index}. #{hash[:title]}"
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

  def notebook_menu
    loop do
      print_menu
      process(STDIN.gets.chomp)
    end
  end

  def print_menu
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "1. Input a new note".upcase
    puts "2. Show me all my notes".upcase
    puts "3. Pick a note".upcase
    puts "4. Save my notes".upcase
    puts "5. Load my saved notes".upcase
    puts "9. Exit".upcase
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  end

  def process(selection)
    case selection
    when "1"
      new_note
    when "2"
      view_titles
    when "3"
      pick_note
    when "4"
      save_notes
    when "5"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, enter a number from the list above"
    end
  end

  def save_notes
    file = File.open("my_notes.csv", "w")
    @list_of_notes.each do |note|
      note_data = [note[:title], note[:body]]
      csv_line = note_data.join(",,,")
      file.puts csv_line
    end
    file.close
  end

  def load_students
    file = File.open("my_notes.csv", "r")
    file.readlines.each do |line|
      title, body = line.chomp.split(',,,')
      @list_of_notes << {:title => title, :body => body}
    end
    file.close
  end

  def blank?
    title.empty?
  end
end
