#!/usr/bin/env ruby

require_relative 'dictionary_loader'
require_relative 'dictionary_searcher'
require_relative 'dictionary_ui'
require_relative 'results_saver'

class Dictionary
  attr_reader :words, :searcher, :ui, :writer
  def initialize(dict = "dictionary.txt")
    @words = DictionaryLoader.load(dict)
    @searcher = DictionarySearcher.new(words)
    @ui = DictionaryUI.new
    @writer = ResultsSaver.new
  end

  def logic_loop
    ui.welcome
    loop do
      ui.instructions
      input = ui.listen
      break if quit?(input)
      output = select_task(input)
      save_to_file(output, input) if save?(ui.save_results(output))
    end
  end

  def quit?(input)
    return true if input == "q!"
    false
  end

  def select_task(input)
    return searcher.starts_with(input[1..-1]) if input[0] == "@"
    return searcher.ends_with(input[1..-1]) if input[0] == "$"
    searcher.find(input) 
  end

  def save?(input)
    input == "y"
  end

  def save_to_file(results, keyword)
    writer.save(results, keyword)
  end
end

Dictionary.new.logic_loop