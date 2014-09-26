class Cards


  def initialize
    CARDS = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
    SUITS = ["Hearts", "Diamonds", "Clubs", "Spades"]
    @deck = []
    shuffle_deck
  end
  
  # returns nil so as to keep deck private
  def shuffle_deck
    @deck = []
    SUITS.each do |suit|
      CARDS.each do |card|
        @deck << {suit: suit, card: card]
      end
    end
    
    @deck.shuffle!
    nil
  end
  
  def deal(number = 1, hand)
    number.times { hand.push(@deck.pop) }
  end
  
  # takes an array of cards of the form [[card1, suit1], [card2, suit2] ...]
  # returns the value of the hand in Blackjack points
  # treats aces high

  def self.soft_value(hand)
    total = hard_value(hand)
    aces = ace_count(hand)

    aces.times { total += 10 if total <= 11 }

    end
  end

  def self.hard_value(hand)
    total = 0

    hand.each do |card|
      if card[:card] == "A"
        total += 1
      elsif card[:card].to_i > 0 #only 2-10 cards
        total += card[:card].to_i
      else
        total += 10
      end
    end

    total
  end

  private

  def ace_count(hand)
    num_aces = 0
    hand.each do { num_aces += 1 if card[:card] == "A" }
    num_aces
  end

end
