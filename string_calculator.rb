class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    number_array = if numbers.start_with?("//")
                     delimiters, numbers = extract_delimiters(numbers)
                     prepare_number_array(numbers, delimiters)
    else
                     prepare_number_array(numbers, delimiters=nil)
    end

    validate_and_raise(number_array)

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

    def validate_and_raise(numbers)
      negatives = numbers.select { |n| n < 0 }
      raise "negative not allowed- #{negatives.join(', ')}" unless negatives.empty?
    end

    def prepare_number_array(numbers, delimiters=nil)
      if delimiters.nil?
        numbers.split(/,|\n/).map(&:to_i)
      else
        delimiters = Regexp.union(delimiters)
        numbers.split(delimiters).map(&:to_i)
      end
    end
end
