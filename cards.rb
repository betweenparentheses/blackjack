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
        @deck << [suit, card]
      end
    end
    
    @deck.shuffle!
    nil
  end
  
  def deal(number = 1)
    cards_dealt = []
    number.times { cards_dealt.push(@deck.pop) }
    cards_dealt
  end
  
  # takes an array of cards of the form [[card1, suit1], [card2, suit2] ...]
  # returns the value of the hand in Blackjack points
  # treats aces high
  def self.minimum_value(hand)
    total = 0
    hand.each do |card|
      card[0] = suit
      card[1] = card
      
      if card.to_i > 0
        total += card.to_i
      elsif card == "A"
        total += 1
      else #KQJ
        total += 10
      end
    end
  end
  
  

end
