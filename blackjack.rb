require 'player'
require 'cards'
require 'dealer'

class Blackjack
  
  def initialize
    @cards = Cards.new
    @player1 = Player.new(@cards)
    @dealer = Dealer.new(@cards)
  end
  
  def play_hand
    player = @player1
    
    until both_stay? || blackjack? do
      
      render_cards
      player.take_turn
      break if bust?
      dealer.take_turn
      break if bust?
    end
    
    render_cards
    find_winners
    #determine winnings
  end
  
  
  def find_winners
  end
  
  def both_stay?
  end
  
  def blackjack?

  end
  
  def bust?
  end
  
end
