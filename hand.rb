class Hand
  attr_reader :name, :cards, :total
  def initialize(name)
    @name = name
    @cards = []
    @total = 0
  end

  def new_card(card)
    puts "#{name} was dealt #{card.value}#{card.suit}"
    @cards << card
  end

  def current_total
    total_value = 0
    @cards.each do |card|

      if card.face_card?
        value = 10
      elsif card.ace_card?
        value = 11
      else
        value = card.value.to_i
      end
      total_value += value
    end
    @total = total_value
  end

  def best_score
    num_aces = @cards.count{|card| card.value == 'A' }
    i = 0
    while i < num_aces do
      @total = @total - 10 if @total > 21
      i += 1
    end
    @total
    # puts "#{name} score: #{@total}\n\n"
  end
end
