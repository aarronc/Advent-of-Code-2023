total = 0
File.readlines('Day_01.dat', chomp: true).each do |line|
    line = line.tr('^0-9', '')
    cal_len = "#{line[0]}#{line[-1]}".to_i
    total += cal_len
end
puts "The answer is : #{total}"
