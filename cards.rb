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
  
  
  
end
