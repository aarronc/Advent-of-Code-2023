def parse_string_to_numbers(input)
    word_to_digit = {
      'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
      'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
    }
    result = ''
    input.chars.each_with_index do |_, i|
      if input[i].match?(/\d/)
        result += input[i]
      else
        word_to_digit.each do |word, digit|
          if input[i..-1].start_with?(word)
            result += digit
            break
          end
        end
      end
    end
    result
end
total = 0
File.readlines('Day_01.dat', chomp: true).each do |line|
    line = parse_string_to_numbers(line)
    line = line.tr('^0-9', '')
    cal_len = "#{line[0]}#{line[-1]}".to_i
    total += cal_len
end
puts "The answer is : #{total}"
