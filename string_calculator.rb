class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter, numbers = extract_delimiter(numbers)
      number_array = numbers.split(delimiter).map(&:to_i)
    else
      number_array = numbers.split(/,|\n/).map(&:to_i)
    end
    negatives = number_array.select { |n| n < 0 }
    raise "negative not allowed- #{negatives.join(', ')}" unless negatives.empty?

    number_array.reject { |n| n > 1000 }.sum
  end


  private
    def extract_delimiter(numbers)
     if numbers[2] == '['
       delimiter = numbers[3..-1].split(']')[0]
       numbers = numbers.split("\n", 2)[1]
       [delimiter, numbers]
    else
       delimiter = numbers[2]
       numbers = numbers[4..-1]
       [delimiter, numbers]
    end
  end
end
