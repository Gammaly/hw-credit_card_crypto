module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    sum_digits = nums_a.reverse.each_with_index.map { |digit, index| index.odd? ? digit * 2 : digit }
    sum_digits = sum_digits.map { |digit| digit > 9 ? digit - 9 : digit }
    (sum_digits.inject(0, :+) % 10).zero?
  end
end
