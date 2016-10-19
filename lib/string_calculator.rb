class StringCalculator

  def self.add(input)
      if input.empty?
          0
      else
          numbers = input.split(',').collect{ |number| number.to_i }
          # numbers.inject(0){ |sum, number| sum + number }
          numbers.inject(:+)
      end
  end

end