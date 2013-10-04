puts 'Hi! Welcome to a game of Blackjack'
puts 'Please enter your name'
name = gets.chomp.caplitalize
puts "#{name} would you like to start your game now? "
start = gets.chomp.downcase

while start == 'yes'

arr_suit = ['Hearts', 'Spades', 'Clubs', 'Diamonds']
arr_name1= ['2', '3', '4', '5', '6', '7', '8', '9', '10']
arr_name2= ['Ace', 'King', 'Queen', 'Jack']

Card = Struct.new(:suit, :name, :value)

p = []
arr_suit.each do |s|
  arr_name1.each do |n|
    p << Card.new(s,  n, n.to_i)
    end
    arr_name2.each do |n|
      if n != 'Ace'
        p << Card.new(s, n, 10)
      else
        p << Card.new(s, n, 11)
      end
    end
end

puts p
puts

p.shuffle!

#puts p
#puts

player_card = []
player_value = []
house_card = []
house_value = []

last = p.size - 1
player_card << p[last].suit + " " + p[last].name
player_value << p[last].value
p.pop
puts 'Your card is: ' + player_card.to_s
#puts player_value
puts
last =  p.size - 1

house_card << p[last].suit + " " + p[last].name
house_value << p[last].value
p.pop
puts 'House card is: ' + house_card.to_s
#puts house_value
#puts

last = p.size - 1

player_card << p[last].suit + " " + p[last].name
player_value << p[last].value
puts 'Player card is: ' + player_card.to_s
#puts player_value
#puts
p.pop
last =  p.size - 1

house_card << p[last].suit + " " + p[last].name
house_value << p[last].value
p.pop
#puts house_card
#puts house_value
#puts

last = p.size - 1
#puts last
puts player_value
puts
player_sum = 0
player_value.each {|v| player_sum += v}

puts player_sum
puts 'Would you like to hit or stay?'
player_answer = gets.chomp.downcase
if player_answer != 'hit' || player_answer != 'stay'
  puts 'Please respond \'hit\' or \'stay\' '
  player_answer = gets.chomp.downcase
end

if player_answer == 'hit'
  player_card << p[last].suit + " " + p[last].name
  player_value << p[last].value
  puts 'Player card is: ' + player_card.to_s
  #puts player_value
  #puts
  p.pop
  last =  p.size - 1
  puts last
  puts
else
  break
end

puts "#{name} would you like to play again? "
start = gets.chomp.downcase
end
