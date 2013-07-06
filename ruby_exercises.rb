# 1
array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
array.each do |x| 
	puts n
end

# 2
array.each do |x| 
	if x > 5
		puts x 
end

# 3
array.select do |n| 
	n.odd?
end

# 4
array.push(11) 
# or
array << 11
array.unshift(0)

# 5
array.pop
array.push(3)

# 6
arr.uniq1

# 7
puts "An array is an ordered list of things"
puts "A hash is a collection of key/value pairs"

# 8
hash18 = {:1 => "a", :2 => "b"}
hash19 = {1: "a", 2: "b"}

# 9
h = {a:1, b:2, c:3, d:4}
h[:b]

# 10
h[:e] = 5

# 11
h.delete_if do |k, v| 
	v < 3.5 
end

# 12
"Yes!"
hash = { a:["1", "2", "3"], b:["4", "5"] } 
array = [{a: 1}, {b: 2}, {c: 3}]
