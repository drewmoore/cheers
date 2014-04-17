puts "What's Your Name, Yo?"

name = gets.chomp
vowels = ["a", "e", "f", "i", "o", "h", "l", "m", "n", "r", "s", "x", "A", "E", "F", "I", "O", "H", "L", "R", "S", "M", "N", "X"]

name.each_char do |character|
  article = "a"
  if vowels.include? character
    article = "an"
  end
  puts "Give me " + article + " ... " + character.capitalize
end

puts name + "'s " + "just Grand!"

