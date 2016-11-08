class DictionaryUI
  def welcome
    puts "Welcome to dictionary_app_2000"
    puts "a revolution in dictionaries.\n\n"
    puts "We dont even have definitions!\n\n"
  end

  def instructions
    puts "Please enter the term you want to search "
    puts "'?' to list advanced user options"
    puts "'q!' to quit"
  end

  def listen 
    gets.strip.downcase
  end

  def help
    puts "Use @ to search for words starting with your input"
    puts "For example '@re' will match 'return' but not 'there'\n\n"
    puts "Use $ for words ending with your input"
    puts "For example '$re' will match 'there' but not 'return'\n\n"
  end

  def save_results(matches)
    puts "\n"
    display_results(matches)
    puts "\nDo you want to save your results? y/n"
    listen
  end

  def display_results(matches)
    puts matches
  end
end