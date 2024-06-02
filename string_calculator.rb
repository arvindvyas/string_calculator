class StringCalculator
  # Public: Calculate the total of numbers given as a string input.
  # numbers: The String containing numbers separated by delimiters.
  # Returns an Integer, the sum of the numbers.
  def add(numbers)
    return 0 if numbers.empty?

    delimiters, numbers = extract_delimiters(numbers) if numbers.start_with?("//")
    number_array = prepare_number_array(numbers, delimiters)

    validate_and_raise(number_array)

    number_array.reject { |n| n > 1000 }.sum
  end

  private


    # Private: This method will take in an input of mixed numbers along with custom defined delimiters. 
    # numbers: The String with delimiters and numbers.
    # Output of this Method would be an Array having delimiters extracted alongside left over numbers.
    def extract_delimiters(numbers)
      delimiters = if numbers[2] == '['
                     numbers.scan(/\[(.*?)\]/).flatten
                   else
                     [numbers[2]]
                   end
      numbers = numbers.split("\n", 2)[1]
      [delimiters, numbers]
    end

    # numbers:  These are the numbers as integers in the array.
    # If below zero is found, throw an error.
    def validate_and_raise(numbers)
      negatives = numbers.select { |n| n < 0 }
      raise "negative not allowed- #{negatives.join(', ')}" unless negatives.empty?
    end

    # numbers:     The String containing numbers separated by delimiters.
    # delimiters:  The Array of custom delimiters (default: nil).
    # Returns an Array of integers representing the numbers.
    def prepare_number_array(numbers, delimiters = nil)
      if delimiters.nil?
        numbers.split(/,|\n/).map(&:to_i)
      else
        delimiters = Regexp.union(delimiters)
        numbers.split(delimiters).map(&:to_i)
      end
    end
end
