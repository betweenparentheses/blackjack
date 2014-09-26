class Dealer < Player
  def get_move
    puts "Press Enter to see next dealer move."
    gets
    case soft_value
    when 18..21
      return 's'
    when 1..16
      return 'h'

    when 17
      if hard_value < 17
        return 'h'
      else
        return 's'
      end
    end
  end

  def visible_cards
    Cards.render(@hand[1..-1])
  end

  def all_cards
    Cards.render(@hand)
  end

private

  def hit
    puts "Dealer hits."
    super
    puts "DEALER showing:\n#{@dealer.visible_cards}\n"
  end

  def stay
    puts "Dealer stays."
    super
  end

end
