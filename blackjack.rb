require './cards'
require './player'
require './dealer'

class Blackjack
  
  def initialize
    @cards = Cards.new
    @player1 = Player.new(@cards)
    @dealer = Dealer.new(@cards)
  end
  
  def play_hand
    puts `clear`
    player = @player1
    
    render_showing
    @player1.take_turn
    @dealer.take_turn

    render_everything
    find_winners
    #determine winnings
  end
  
  private

  def render_showing
    puts "DEALER showing:\n#{@dealer.visible_cards}\n"
    puts "YOUR HAND:\n#{@player1.visible_cards}\n"
  end

  def render_everything
    puts "DEALER'S FULL HAND:\n#{@dealer.all_cards}\n"
    puts "YOUR HAND:\n#{@player1.visible_cards}\n"
    puts "Dealer total: #{@dealer.hard_value} vs your total: #{@player1.hard_value}"
  end
  
  def find_winners
    winner = nil
    winner = @dealer.hard_value > @player1.hard_value ? "Dealer" : "Player"
    winner = "Dealer" if @player1.bust?
    winner = "Player 1" if @dealer.bust?

  
    puts "#{winner} wins!!!"
  end
  
  def both_stay?
    @player1.stay? && @dealer.stay?
  end
  
  def blackjack?
    @player1.blackjack? || @dealer.blackjack?
  end
  
  def bust?
    @player1.bust? || @dealer.bust?
  end
  
end

b = Blackjack.new

b.play_hand
