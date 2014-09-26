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
      @player1.take_turn
      break if bust?
      @dealer.take_turn
      break if bust?
    end
    
    render_cards
    find_winners
    #determine winnings
  end
  
  private

  def render_cards
    Cards.render(@player1, @dealer1)
  end
  
  def find_winners
  end
  
  def both_stay?
    @player1.stay? || @dealer.stay?
  end
  
  def blackjack?
    @player1.blackjack? || @dealer.blackjack?
  end
  
  def bust?
    @player1.bust? || @dealer.bust?
  end
  
end
