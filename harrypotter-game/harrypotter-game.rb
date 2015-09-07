# Learned this from http://rmion.com/ruby-newbie-programming-my-first-text-game/
 
def select_weapon
	# Store weapons in new array
	weapons = ['sword', 'staff', 'bow', 'hammer', 'axe']
 
	# Ask user to choose a starting weapon
	puts "Choose your weapon by typing its associated number: "
 
	# Loop through weapons array and print options to console
	# As items are added to or removed from array
	# this loop always prints a string containing a number (starting from 1)
	# and the value in the weapons array at that number
	(0...weapons.length).each do |i|
		puts "#{i+1} - #{weapons[i]}"
	end
	print "> "
	# store choice in variable
	# [MUST RESOLVE] currently, if user enters letter, it is somehow mapping to a number
	choice = $stdin.gets.chomp.to_i - 1
	@selected_weapon = weapons[choice]
 
	puts "You selected: #{@selected_weapon}"
	start_game
end
 
def start_game
	# Assign initial integer values for each character's health
	@player_health = 50
	@monster_health = 50
	# Ask player if they are ready to play
	puts "\nReady to play? Y/N"
	print "> "
	
	confirm = $stdin.gets.chomp.upcase
	if confirm == 'Y'
		enter_room
	else
		puts "Game over"
	end
end
 
def enter_room
	# Inform user of current status
	puts "You awake in a small room."
	puts "There is a large door in the distance that is locked."
	puts "In front of you is a small table."
	puts "On that table is a coin.\n\n"
	coin_toss
end
 
def coin_toss
	puts "You pick up the coin and toss it in the air."
	# Generate random number between 0 and 2
	# and round down to either 0 or 1
	# store resulting integer in variable coin
	coin = rand(2).floor
	# Ask user to pick a side of the coin
	print "\nPick a side (heads or tails):\n> "
	choice = $stdin.gets.chomp.upcase
 
	# if-statement to determine whether user guessed coin side correctly
	# [MUST RESOLVE] feels very repetitive, try other programming mechanism
	if choice.include?('H') && coin == 0
		puts "It's heads! Nice job!"
		treasure_room
	elsif choice.include?('H') && coin == 1
		puts "Sorry, it's tails. Try again."
		coin_toss
	elsif choice.include?('T') && coin == 0
		puts "Sorry, it's heads. Try again."
		coin_toss
	elsif choice.include?('T') && coin == 1
		puts "It's tails! Nice job!"
		treasure_room
	end
end
 
def treasure_room
	puts "\nThe door in front of you opens."
	puts "You walk forward, #{@selected_weapon} at the ready."
	puts "Passing through the doorway, an object catches your gaze."
	puts "It's a large treasure chest, likely filled with riches."
	puts "But from the darkness appears a monstrous creature."
	puts "This creature is heavily armored and carries a large hammer."
	puts "The only way to reach the chest is to dispose of the creature."
	puts "\nAre you prepared to fight? Y/N"
	choice = $stdin.gets.chomp.upcase
	if choice == 'Y'
		attack_monster
	else
		death
	end
end
 
def attack_monster
	# Generate random number between 0 and 6
	# and round down to either 0 or 5
	# store resulting integer in variable roll
	player_roll = rand(6).floor
 
	player_damage = player_roll * 5
	puts "\nYou attack monster for #{player_damage} damage."
 
	@monster_health -= player_damage
 
	if @monster_health <= 0
		puts "\nYou defeated the monster!"
		treasure_chest
	else
		puts "Monster's health: #{@monster_health}hp"
		defend_monster
	end
end
 
def defend_monster
	# Generate random number between 0 and 6
	# and round down to either 0 or 5
	# store resulting integer in variable roll
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
 
def treasure_chest
	puts "\nYou slowly approach the treasure chest."
	puts "The lid is so heavy it requires the weight of your entire body to lift."
	puts "As you raise the lid a bright light shines from within the chest."
	puts "You look down to gaze upon the chest's contents."
	puts "\nDo you take a closer look? Y/N"
	choice = $stdin.gets.chomp.upcase
	if choice == 'Y'
		victory
	else
		puts "You've come this far, don't you want to see what's inside? Y/N"
		choice = $stdin.gets.chomp.upcase
		if choice == 'Y'
			victory
		else
			puts "Fine. You die."
			exit(0)
		end
	end
end
 
def victory
	puts "Congratulations. It was a flashlight."
	exit(0)
end
 
def death
	puts "The monster pwned you."
	puts "Game over."
	puts "\nPlay again? Y/N"
	choice = $stdin.gets.chomp.upcase
	if choice == 'Y'
		select_weapon
	else
		exit(0)
	end
end
 
select_weapon