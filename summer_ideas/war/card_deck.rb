require_relative "all_files.rb"

class CardDeck
  attr_accessor :deck

  def initialize
    @deck = {
            "2H" => 2, "2D" => 2, "2S" => 2, "2C" => 2,
            "3H" => 3, "3D" => 3, "3S" => 3, "3C" => 3,
            "4H" => 4, "4D" => 4, "4S" => 4, "4C" => 4,
            "5H" => 5, "5D" => 5, "5S" => 5, "5C" => 5,
            "6H" => 6, "6D" => 6, "6S" => 6, "6C" => 6,
            "7H" => 7, "7D" => 7, "7S" => 7, "7C" => 7,
            "8H" => 8, "8D" => 8, "8S" => 8, "8C" => 8,
            "9H" => 9, "9D" => 9, "9S" => 9, "9C" => 9,
            "10H" => 10, "10D" =>10, "10S" =>10, "10C" => 10,
            "JH" => 11, "JD" =>11, "JS" => 11, "JC" => 11,
            "QH" => 12, "QD" => 12, "QS" => 12, "QC" => 12,
            "KH" => 13, "KD" => 13, "KS" => 13, "KC" => 13,
            "AH" => 14, "AD" => 14, "AS" => 14, "AC" => 14
          }
  end

  def shuffle_deck(number)
    deck.keys.sample(number)
  end

  def remove(card)
    deck.delete(card)
  end

  def deal(number)
    shuffle_deck(number).inject({}) do |hash,card|
      hash[card] = deck[card]
      remove(card)
      hash
    end
  end
end

