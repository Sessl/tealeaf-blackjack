arr_suit = ['Hearts', 'Spades', 'Clubs', 'Diamonds']
arr_name1= ['2', '3', '4', '5', '6', '7', '8', '9', '10']
arr_name2= ['Ace', 'King', 'Queen', 'Jack']

Card = Struct.new(:suit, :name, :value)

puts 'Hi! Welcome to a game of Blackjack'
puts 'Please enter your name'
name = gets.chomp.capitalize
puts "#{name} would you like to start your game now? "
start = gets.chomp.downcase

while start == 'yes'
  p = []
arr_suit.each do |s|
  arr_name1.each do |n|
    p << Card.new(s,  n, n.to_i)
    end
    arr_name2.each do |n|
      if n != 'Ace'
        p << Card.new(s, n, 10)
      else
        p << Card.new(s, n, 1)
      end
    end
end

p.shuffle!

player_card = []
player_value = []
house_card = []
house_value = []

last = p.size - 1
player_card << p[last].suit + " " + p[last].name
player_value << p[last].value
p.pop
puts 'Your card is: ' + player_card.to_s

puts
last =  p.size - 1

house_card << p[last].suit + " " + p[last].name
house_value << p[last].value
p.pop
puts 'House card is: ' + house_card.to_s

last = p.size - 1

player_card << p[last].suit + " " + p[last].name
player_value << p[last].value
puts 'Your card is: ' + player_card.to_s
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

last = p.size - 1
#puts last
puts player_value
puts

def total arr
sum = 0
arr.each {|v| sum += v}
return sum
end

player_sum1 = total player_value
puts 'This is your sum:' + player_sum1.to_s

player_sum2 = 0

if player_value.include? 1
  player_sum2 = player_sum1 + 10
  puts 'This is your alternative sum: ' + player_sum2.to_s
end


def deal arr, parr, varr, last
  parr << arr[last].suit + " " + arr[last].name
  varr << arr[last].value
  puts 'Player card is: ' + parr.to_s 
  arr.pop
end

def say
  puts 'Would you like to hit or stay?'
  answer = gets.chomp.downcase
  return answer
end

if player_sum1 > 21 && player_sum2 > 21
  puts 'You are busted'
  player_sum = player_sum1
end

if player_sum1 == 21 || player_sum2 == 21
  player_sum = 21
end

player_answer = say

if player_answer == 'hit'

while player_answer == 'hit'
     deal p, player_card, player_value, p.size - 1
     player_sum1 = total player_value
     puts 'This is player_sum1: ' + player_sum1.to_s
     if player_value.include? 1
       player_sum2 = player_sum1 + 10
       puts 'This is player sum2: ' + player_sum2.to_s
       if player_sum1 == 21 || player_sum2 == 21
        player_sum = 21
         break
       elsif player_sum1 > 21 && player_sum2 > 21
         puts 'You are busted'
         player_sum = player_sum1
         break
       else
        player_answer = say
        if player_answer != 'hit'
          if player_sum1 > player_sum2
            player_sum = player_sum1
          else
            player_sum = player_sum2
          end
        end
       end
         
     else
      if player_sum1 == 21
        player_sum = 21
        puts 'testing player sum 1 ' + player_sum.to_s
         break
       elsif player_sum1 > 21
         player_sum = player_sum1
         puts 'You are busted'
         puts 'testing player sum 2 ' + player_sum.to_s
         break
       else
         player_answer = say
         if player_answer != 'hit'
          player_sum = player_sum1
          puts 'testing player sum 3 ' + player_sum.to_s
        end
      end
     end
end

else
  player_sum = player_sum1
end

puts player_sum

house_sum2 = 0

if player_sum <= 21
  house_sum1 = total house_value
  puts 'House sum1: ' + house_sum1.to_s
  if house_value.include? 1
    house_sum2 = player_sum1 + 10
       puts 'House sum2: ' + house_sum2.to_s
        if house_sum2 <= 21
          house_sum = house_sum2
        else
          house_sum = house_sum1
        end
  else
    house_sum = house_sum1
  end

  while house_sum < 17
           deal p, house_card, house_value, p.size - 1
           house_sum1 = total house_value
           puts 'House sum1: ' + house_sum1.to_s
           if house_value.include? 1
              house_sum2 = house_sum1 + 10
              puts 'House sum2: ' + house_sum2.to_s
              if house_sum2 <= 21
                house_sum = house_sum2
              else
                house_sum = house_sum1
              end
           else
              
              house_sum = house_sum1
              
           end

    end
    if house_sum == player_sum
   puts 'It\'s a push'
 elsif house_sum > 21
  puts 'You win'
  elsif house_sum < player_sum
   puts 'You win'
  elsif  (house_sum <= 21) && (house_sum > player_sum)
   puts 'House wins'
  end  

end

puts "#{name} would you like to play again? "
start = gets.chomp.downcase
end