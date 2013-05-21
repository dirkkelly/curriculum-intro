require_relative "all_files.rb"

class Player
  attr_accessor :hand, :current_card, :name

  def initialize(name="computer",hand)
    @name         = name
    @hand         = hand
    @current_card = nil
  end

  def total_cards
    hand.count
  end

  def go(number_of_cards=1)
    cards = @hand.shift(number_of_cards)
    @current_card = cards
  end

  def add_cards(cards)
    @hand += cards
  end

  def all_remaining_cards
    current_card + go(total_cards)
  end

  def out_of_cards?
    total_cards == 0
  end

  def not_enough_cards?
    total_cards < 4
  end

end