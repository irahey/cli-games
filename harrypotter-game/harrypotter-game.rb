# Learned this from http://rmion.com/ruby-newbie-programming-my-first-text-game/
def start_game

	puts"\nWelcome, one and all, to Hogwarts School of Witchcraft and Wizardry!"
	puts "Today is the Sorting Ceremony. The Sorting Hat will determine whish Hogwarts House you will belong."
	puts "\nAre you ready to be sorted? Y/N"
	print "> "
	
	confirm = $stdin.gets.chomp.upcase
	if confirm == 'Y'
		sorting
	else
		puts "Game over"
		exit(0)
	end
end 
 
def sorting
	puts "You pick up the coin and toss it in the air."

	coin = rand(4).floor

	if coin == 0
		puts "Gryffindor!"
		@house = "Gryffindor"
	elsif coin == 1
		puts "Hufflepuff!"
		@house = "Hufflepuff"
	elsif coin == 2
		puts "Ravenclaw!"
		@house = "Ravenclaw"
	elsif coin == 3
		puts "Slytherin!"
		@house = "Slytherin"
	end
	puts "\nCongratulations! You now belong to #{@house} House."
	friends
end
 
def friends
	puts "Friends are really important to survive wizarding school! Time to make friends."
	friends = ['Ron Weasley', 'Neville Longbottom','Luna Lovegood', 'Hagrid', 'Argus Filch', 'Cedric Diggory', 'Cho Chang']
	puts "Please choose which one you want to attempt to make friends with:"
	(0...friends.length).each do |i|
		puts "#{i+1} - #{friends[i]}"
	end
	print "> "
	choice = $stdin.gets.chomp.to_i - 1
	@selected_friend = friends[choice]
	puts "You selected: #{@selected_friend}"
	attempt_friend
end

def attempt_friend
	puts "Let's see if it's going to work out."
	attempt = rand(3).floor

	if attempt == 0
		puts "It did not work out with #{@selected_friend}."
		puts "Do you want to [A]try again or [B]choose another person or [C]you don't want to attempt making friends anymore?: [A or B or C] ?"
		print "> "
		if attempt == 'A'
			attempt_friend
		elsif attempt == 'B'
			friends
		else
			puts "That's fine but you're going to be alone at meal time."
			puts "Also... You won't have anyone to help you when you're in trouble."
			@player_health = 40
			@aragog_health = 40
		end
	elsif attempt == 1
		puts "Success! You are now friends with #{@selected_friend}."
		@player_health = 55
		@aragog_health = 40
		puts "\nSo you and your friend #{@selected_friend} went outside in the forests, trying to explore the grounds."
		puts "\nReady to go outside? Y/N"
		print "> "
		
		confirm = $stdin.gets.chomp.upcase
		if confirm == 'Y'
			forbidden_forest
		else
			puts "Please take you time resting."
			exit(0)
		end
	end 
    
end
def forbidden_forest
	puts "\nYou and your friend #{@selected_friend} went outside in the forests, trying to explore the grounds."
    puts "And little did you know, you have found yourselves at the Forbidden Forest, where Aragog is!"
    puts "Aragog emerged!"
	puts "\nAre you prepared to fight? Y/N"
	choice = $stdin.gets.chomp.upcase
	if choice == 'Y'
		attack_monster
	else
		death
	end
end

def attack_monster

	player_roll = rand(6).floor
 
	player_damage = player_roll * 5
	puts "\nYou attack monster for #{player_damage} damage."
 
	@aragog_health -= player_damage
 
	if @aragog_health <= 0
		puts "\nYou defeated the monster!"
		victory
	else
		puts "Monster's health: #{@aragog_health}hp"
		defend_monster
	end
end
 
def defend_monster

	monster_roll = rand(6).floor
 
	monster_damage = monster_roll * 5
	puts "\nMonster attacks you for #{monster_damage} damage."
 
	@player_health -= monster_damage
 
	if @player_health <= 0
		death
	else
		puts "Your health: #{@player_health}hp"
		puts "\nContinue attacking? Y/N"
		choice = $stdin.gets.chomp.upcase
		if choice == 'Y'
			attack_monster
		else
			death
		end
	end
end
 
 
def victory
	puts "Congratulations! You have defeated Aragog."
	puts "Now you time to go back to Hogwarts! It's almost dinnertime!"
	exit(0)
end
 
def death
	puts "The Aragog defeated you."
	puts "Game over."
	puts "\nPlay again? Y/N"
	choice = $stdin.gets.chomp.upcase
	if choice == 'Y'
		start_game
	else
		exit(0)
	end
end

start_game