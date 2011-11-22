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
        when 'I'
          theNumber += 1
        when 'V'
          theNumber += 5
        when 'X'
          theNumber += 10
        when 'L'
          theNumber += 50
        when 'C'
          theNumber += 100
        when 'D'
          theNumber += 500
        when 'M'
          theNumber += 1000
        end
      end
    end
    puts(theNumber)
  when 'number'
    puts "aye"
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
  convert(input,'roman')
elsif input =~ /^[\d]+$/  # Valid number.
  convert(input,'number')
else
  
end

  
# Write to stout...
  
end