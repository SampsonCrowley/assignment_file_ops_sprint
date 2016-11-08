class ResultsSaver
  def initialize
    @results_path = "results.txt"
  end
  def save(results, keyword)
    results_file = File.open(@results_path, "a+")
    results_file << "Results for #{search_type(keyword)}\n"
    results.each { |word| results_file << "#{word}\n" }
    results_file << "\n\n"
    results_file.close
  end
  def search_type(keyword)
    return "starts with: '#{keyword[1..-1]}'" if keyword[0] == "@"
    return "ends with: '#{keyword[1..-1]}'" if keyword[0] == "$"
    "'#{keyword}'"
  end
end