

class DictionaryLoader

  def self.load(file_path)
    load_dict(file_path) if valid_input?(file_path)
  end

  def self.valid_input?(file_path)
    unless file_path.is_a?(Array)
      raise ArgumentError unless File.exist?(file_path)
    end
    true
  end

  def self.load_dict(file_path)
    if file_path.is_a?(Array) 
      words = file_path
    else 
      words = load_file(file_path)
    end
    words
  end


  def self.load_file(file_path)
    words = File.readlines(file_path).map {|w| w.strip }
  end

end