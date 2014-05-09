class MoneyCalculator
	attr_accessor :ones, :fives, :tens, :twenties, :fifties, :hundreds, :five_hundreds, :thousands

  def initialize(ones, fives, tens, twenties, fifties, hundreds, five_hundreds, thousands)
  	@ones = ones
  	@fives = fives
  	@tens = tens
  	@twenties = twenties
  	@fifties = fifties
  	@hundreds = hundreds
  	@five_hundreds = five_hundreds
  	@thousands = thousands
    @total = @ones + (@fives*5) + (@tens*10) + (@twenties*20) + (@fifties*50) + (@hundreds*100) + (@five_hundreds*500) + (@thousands*1000)
    # each parameter represents the quantity per denomination of money
    # these parameters can be assigned to instance variables and used for computation

    # add a method called 'change' that takes in a parameter of how much an item @changes
    # and returns a hash of how much change is to be given
    # the hash will use the denominations as keys and the amount per denomination as values
    # i.e. {:fives => 1, fifties => 1, :hundreds => 3}
  end

  def total
    @total
  end

  def change(cost)
  
    @change = @total - cost

  until @change == 0

      if @change >= 1000
        @th = @change/1000
        @change = @change%1000
      elsif @change >= 500
        @fh = @change/500
        @change = @change%500
      elsif @change >= 100
        @hu = @change/100
        @change = @change%100
      elsif @change >= 50
        @ft = @change/50
        @change = @change%50
      elsif @change >= 20
        @tw = @change/20
        @change = @change%20
      elsif @change >= 10
        @tn = @change/10
        @change = @change%10
      elsif @change >= 5
        @fv = @change/5
        @change = @change%5
      else
        @on = @change 
        @change = 0  
    end
  end
    @return = {
      :ones => @on, :fives => @fv, :tens => @tn, :twenties => @tw, :fifties => @ft, 
      :hundreds => @hu, :five_hundreds => @fh,  :thousands => @th}
  end

    def cng

    @change  
    end
end