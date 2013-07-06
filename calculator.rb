puts "What's the first number?"
num1 = gets.chomp


puts "What's the second number?"
num2 = gets.chomp

puts "The first number was: " + num1
puts "And the second number was: " + num2

puts "Choose the operation you want: 1) addition 2) subtraction 3) division 4) multiplication"
op = gets.chomp

res = 0

if op == "1"
  puts "add"
  res = num1.to_i + num2.to_i
elsif op == "2"
  puts "subtract"
  res = num1.to_i - num2.to_i
elsif op == "3"
  puts "divide"
  res = num1.to_f / num2.to_f
else
  puts "multiply"
  res = num1.to_i * num2.to_i
end

puts "The answer is #{res}"