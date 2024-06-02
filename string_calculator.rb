class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiters, numbers = extract_delimiters(numbers)
      regex_delimiters = Regexp.union(delimiters)
      number_array = numbers.split(regex_delimiters).map(&:to_i)
    else
      number_array = numbers.split(/,|\n/).map(&:to_i)
    end
    negatives = number_array.select { |n| n < 0 }
    raise "negative not allowed- #{negatives.join(', ')}" unless negatives.empty?

    number_array.reject { |n| n > 1000 }.sum
  end


  private
    def extract_delimiters(numbers)
      if numbers[2] == '['
        delimiters = numbers.scan(/\[(.*?)\]/).flatten
        numbers = numbers.split("\n", 2)[1]
      else
        delimiters = [numbers[2]]
        numbers = numbers[4..-1]
      end
      [delimiters, numbers]
    end
end
