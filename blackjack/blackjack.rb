class CardDeck
  attr_accessor :deck

  def initialize
    @deck = {
              "2C" => 2, "2D" => 2, "2H" => 2, "2S" => 2,
              "3C" => 3, "3D" => 3, "3H" => 3, "3S" => 3,
              "4C" => 4, "4D" => 4, "4H" => 4, "4S" => 4,
              "5C" => 5, "5D" => 5, "5H" => 5, "5S" => 5,
              "6C" => 6, "6D" => 6, "6H" => 6, "6S" => 6,
              "7C" => 7, "7D" => 7, "7H" => 7, "7S" => 7,
              "8C" => 8, "8D" => 8, "8H" => 8, "8S" => 8,
              "9C" => 9, "9D" => 9, "9H" => 9, "9S" => 9,
              "10C" => 10, "10D" => 10, "10H" => 10, "10S" => 10,
              "JC" => 10, "JD" => 10, "JH" => 10, "JS" => 10,
              "QC" => 10, "QD" => 10, "QH" => 10, "QS" => 10,
              "KC" => 10, "KD" => 10, "KH" => 10, "KS" => 10,
              "AC" => 11, "AD" => 11, "AH" => 11, "AS" => 11
            }
  end

  def deal(number)
    cards = deck.keys.sample(number)
    hash = Hash.new
    cards.each do |card|
      hash[card] = deck[card]
    end
    remove_from_deck(cards)
    hash
  end

  def remove_from_deck(cards)
    cards.each do |card|
      deck.delete(card)
    end
  end
end

class BlackJack

  attr_accessor :winning_score, :player_score, :dealer_score, :dealers_cards, :players_cards,
                :stay, :round, :players_card_score, :dealers_card_score, :cards, :quit

  def initialize(winning_score)
    @winning_score = winning_score
    @player_score = 0
    @dealer_score = 0
    @round = 0
    @players_cards = {}
    @dealers_cards = {}
    @stay = false
    @quit = false
    rules
  end

  def rules
    format_with_space
    puts <<-eom
    Welcome to Blackjack. You win by being the first one to win #{winning_score} points.
    You are dealt 2 cards initially.  You can either hit or stay.  A round is over when
    either player reaches 21, exceeds 21, or is the closest to 21. Aces start as 11 and will
    change to 1 if you exceed 21.  You can end a game earlier by typing 'quit'.
    eom
  end

  def play
    until player_wins || dealer_wins
      state_of_game
      initial_deal
      players_turn

      if quit
        return
      elsif blackjack
        puts "Lady luck strikes again bitchesss! You win!"
        increment_score("player")
      elsif bust("player")
        puts "Bust! Sucks to suck - Dealer wins"
        increment_score("dealer")
      elsif stay
        dealers_turn
      end

      if bust("dealer")
        puts "Woot Woot, you win"
        increment_score("player")
      elsif reaches_17
        compare_hands_to_determine_winner
      end
      clear_hands
      increment_round
    end
    end_of_game_message
  end

  def deal_cards(number, player)
    if player == "player"
      set_1 = cards.deal(number)
      self.players_cards = players_cards.merge(set_1)
      calculate_value("player")
    elsif player == "dealer"
      set_2 = cards.deal(number)
      self.dealers_cards = dealers_cards.merge(set_2)
      calculate_value("dealer")
    elsif player == "all"
      set_3 = cards.deal(number)
      set_4 = cards.deal(number)
      self.players_cards = players_cards.merge(set_3)
      self.dealers_cards = dealers_cards.merge(set_4)
      calculate_value("player")
      calculate_value("dealer")
    end
  end

  def players_turn
    until stay || bust("player") || blackjack
      puts "Would you like to hit or stay?"
      command = sanitize(gets.chomp)
      if command == "stay"
        self.stay = true
      elsif command == "hit"
        format_with_space
        puts "***Dealing You 1 Card***"
        deal_cards(1, "player")
        if over_21_with_ace("player")
          self.players_card_score = players_card_score - 10
        end
        puts "Your Hand: #{show_hand(players_cards)} --- total: #{players_card_score}"
      elsif command == "quit"
        self.quit = true
        break
      else
        puts "Sorry, that command is not valid - try either 'hit' or 'stay' or 'quit'"
      end
    end
  end

  def dealers_turn
    puts "The dealer now reveals his full hand ---> #{show_hand(dealers_cards)} --- total: #{dealers_card_score}"
    until bust("dealer") || reaches_17
      format_with_space
      puts "The dealer chooses to hit"
      puts "***Dealing Dealer 1 Card***"
      deal_cards(1, "dealer")
      if over_21_with_ace("dealer")
        self.dealers_card_score = dealers_card_score - 10
      end
      puts "Dealer's Hand: #{show_hand(dealers_cards)} --- total #{dealers_card_score}"
    end
  end

  def initial_deal
    puts "***Initial Deal***"
    deal_cards(2, "all")
    puts "Dealer's Hand: #{hide_hand(dealers_cards)} --- total: ?"
    puts "Your Hand: #{show_hand(players_cards)}     --- total: #{players_card_score}"
  end

  def blackjack
    players_card_score == 21
  end

  def new_deck_of_cards
    self.cards = CardDeck.new
  end

  def format_with_space
    puts ""
    puts ""
  end

  def end_of_game_message
    if player_wins
      puts "Rock on, you beat the evil, robot dealer!"
    elsif dealer_wins
      puts "Damn, that stupid robot of a dealer beat you!"
    end
  end

  def over_21_with_ace(player)
    if player == "player"
      players_cards.keys.join("").include?("A") && players_card_score > 21
    elsif player == "dealer"
      dealers_cards.keys.join("").include?("A") && dealers_card_score > 21
    end
  end

  def clear_hands
    self.players_cards = {}
    self.dealers_cards = {}
  end

  def show_hand(cards)
    cards.keys
  end

  def calculate_value(player)
    if player == "player"
      self.players_card_score = players_cards.values.inject(0) {|total, value| total + value }
    elsif player == "dealer"
      self.dealers_card_score = dealers_cards.values.inject(0) {|total, value| total + value }
    end
  end

  def hide_hand(cards)
    array = cards.keys
    array.shift
    array.unshift("?")
  end

  def state_of_game
    format_with_space
    puts "Dealer's Score: #{dealer_score} || Your Score: #{player_score}"
    self.stay = false
    puts "Round: #{round}"
    new_deck_of_cards
  end

  def increment_score(player)
    if player == "dealer"
      self.dealer_score += 1
    else
      self.player_score += 1
    end
  end

  def increment_round
    self.round += 1
  end

  def bust(player)
    if player == "dealer"
      dealers_card_score > 21
    elsif player == "player"
      players_card_score > 21
    end
  end

  def reaches_17
    dealers_card_score >= 17
  end

  def compare_hands_to_determine_winner
    if players_card_score > dealers_card_score && players_card_score <= 21
      puts "Woot woot! You won the hand"
      increment_score("player")
    elsif dealers_card_score > players_card_score && dealers_card_score <= 21
      puts "Damn, the dealer out foxed you!"
      increment_score("dealer")
    elsif dealers_card_score == players_card_score
      puts "Tie Game! Nobody wins or loses"
    end
  end

  def player_wins
    player_score == winning_score
  end

  def dealer_wins
    dealer_score == winning_score
  end

  def sanitize(user_input)
    user_input.downcase.gsub(" ", "")
  end
end

printf "Welcome to BlackJack.  Every time you win a round, you earn a point.
How many points would you like to play until their is an ultimate winner?  (enter a number) ->  "

response = gets.chomp.to_i
new_game = BlackJack.new(response)
new_game.play