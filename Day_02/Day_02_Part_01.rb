output = {}
File.readlines('Day_02.dat', chomp: true).each do |line|
    line = line.split(":")
    line[0] = line[0].gsub("Game ","").to_i
    output[line[0]] = {}
    output[line[0]]["red"] = 0
    output[line[0]]["green"] = 0
    output[line[0]]["blue"] = 0
    line[1] = line[1].split(";")
    parry = []
    line[1].each do |picks|
        picks = picks.split(",")
        picks.each do |item|
            item = item.split(" ")
            item[0] = item[0].to_i
            if item[1] == "red"
                if output[line[0]]["red"] < item[0]
                    output[line[0]]["red"] = item[0]
                end
            end
            if item[1] == "green"
                if output[line[0]]["green"] < item[0]
                    output[line[0]]["green"] = item[0]
                end
            end
            if item[1] == "blue"
                if output[line[0]]["blue"] < item[0]
                    output[line[0]]["blue"] = item[0]
                end
            end
        end
    end
end
final_number = 0
output.each do |number, max|
    if max["red"] <= 12 and max["green"] <= 13 and max["blue"] <= 14
        final_number += number
    end
end
puts final_number