class Player

  def initialize(deck)
    @deck = deck
    @hand = []
    @stay = false
    deal_cards(2)
  end

  def take_turn
    move = get_move
    case move
      when 'h'
        hit
      when 's'
        stay
      else
        p "wtf broken"
      end
  end

  def get_move
    puts "Do you want to HIT or STAY? (h/s): "
    move = gets.chomp.downcase
    get_move unless ['h', 's'].include?(move)
    move
  end

  def stay?
    @stay
  end

  def visible_cards
    Cards.render(@hand)
  end

  def blackjack?
    @hand.size == 2 && soft_value == 21
  end

  def bust?
    hard_value > 21
  end

  def hard_value
    Cards.hard_value(@hand)
  end

  def soft_value
    Cards.soft_value(@hand)
  end

  private

  def hit
    deal_cards(1)
  end

  def stay
    @stay = true
  end

  def deal_cards(number)
    @deck.deal(number, @hand)
  end


end


