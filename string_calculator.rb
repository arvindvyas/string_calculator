class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter, numbers = numbers[2..-1].split("\n", 2)
      number_array = numbers.split(delimiter).map(&:to_i)
    else
      number_array = numbers.split(/,|\n/).map(&:to_i)
    end
    number_array.sum
  end
end
