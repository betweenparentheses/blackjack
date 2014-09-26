class Player

  def initialize(deck)
    @deck = deck
    @hand = []
    @stay = false
    deal_cards(2)
  end

  def take_turn
    case get_move
      when 'h'
        deal_cards(1)
      when 's'
        @stay = true
    end
  end

  def get_move
    puts "Do you want to HIT or STAY? (h/s): "
    move = gets.chomp.downcase
    get_move unless ['h', 's'].include?(move)
  end

  def stay?
    @stay
  end


  private

  def deal_cards(number)
    @deck.deal(number, @hand)
  end

end

class Dealer < Player
  def get_move

  end

private

  def hard_value
    Cards.hard_value(@hand)
  end

  def soft_value
    Cards.soft_value(@hand)
  end

end

