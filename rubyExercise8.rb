def convert(input, type)
  case(type)
  when 'roman'
    theNumber = 0
    i = 0
    while i < input.length do
      cl = input[i]
      nl = input[i+1]
      amountToAdd = 0
      if (cl == 'I' && nl == 'V')
        amountToAdd += 4
      elsif (cl == 'I' && nl == 'X')
        amountToAdd += 9
      elsif (cl == 'X' && nl == 'L')
        amountToAdd += 40
      elsif (cl == 'X' && nl == 'C')
        amountToAdd += 90
      elsif (cl == 'C' && nl == 'D')
        amountToAdd += 400
      elsif (cl == 'C' && nl == 'M')
        amountToAdd += 900
      else
        amountToAdd = 0
      end
      
      if amountToAdd == 0
        i += 1
      else
        theNumber += amountToAdd
        i += 2
      end
      
      if amountToAdd == 0
        case(cl)
          when 'I' then theNumber += 1
          when 'V' then theNumber += 5
          when 'X' then theNumber += 10
          when 'L' then theNumber += 50
          when 'C' then theNumber += 100
          when 'D' then theNumber += 500
          when 'M' then theNumber += 1000
        end
      end
    end
    theNumber
  when 'number'
    theNumeral = ""
    currentDigit = input.length - 1
    currentLetter = 'I'
    nextLetter = 'V'
    superNextLetter = 'X'
    while (currentDigit >= 0)
      currentDigitValue = input.to_s[currentDigit]
      if currentDigitValue.to_i <= 3 && currentDigitValue.to_i != 0
        currentDigitValue.to_i.times do |i|
          theNumeral << currentLetter
        end
      elsif currentDigitValue.to_i == 4
        theNumeral << currentLetter << nextLetter
      elsif currentDigitValue.to_i == 5
        theNumeral << nextLetter
      elsif currentDigitValue.to_i >= 6 && currentDigitValue.to_i <= 8
        (currentDigitValue.to_i - 5).times do |i|
          theNumeral << currentLetter
        end
        theNumeral = nextLetter + theNumeral
      elsif currentDigitValue.to_i == 9
        theNumeral << currentLetter << superNextLetter
      else  # zero
        # Carry over somehow...
      end
      currentDigit -= 1
      currentLetter = 'X',nextLetter = 'L',superNextLetter = 'C'
    end
    theNumeral
  else puts "Problems"
  end
end

if __FILE__ == $0

input=""
if ARGV.length == 0
  puts "Enter a filename, or the number/roman numeral to be converted:"
  input = gets().chomp
else
  input = gets().chomp
end

if input =~ /^[IVXLCDM]+$/  # Valid Roman numeral.
  puts(convert(input,'roman'))
elsif input =~ /^[\d]+$/  # Valid number.
  puts(convert(input,'number'))
else
  
end

  
# Write to stout...
  
end