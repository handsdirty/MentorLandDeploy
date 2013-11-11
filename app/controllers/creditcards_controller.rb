class CreditcardsController < ApplicationController

  # GET /creditcards/1
  def show
		@credit_card = CreditCard.new	# you must new one first!!
    my_credit_cards = Hascreditcard.where(:user_id => current_user.id)
    @my_credit_cards = []
    my_credit_cards.each do |e|
			puts e.to_s
      @my_credit_cards << CreditCard.find(e.credit_card_id)
    end
  end
	
  # POST /creditcards
  def create
    @credit_card = CreditCard.new(params[:credit_card])
		if @credit_card.save
			flash[:notice] = "This credit_card was successfully created!" 
		else 
			flash[:notice] = "This credit_card creation failed!" 
		end
		@has_credit_card = Hascreditcard.create(:credit_card_id => @credit_card.id, :user_id => current_user.id)

    respond_to do |format|
			if @has_credit_card.save
				flash[:notice] = flash[:notice] + " And saved to profile!"
        format.html { redirect_to credit_cards_url }
      else
				flash[:notice] = "Save failed!" 
        format.html { redirect_to credit_cards_url }
      end
    end
  end

	def last_digits(number)     
		number.length <= 4 ? number : number.slice(-4..-1) 
	end
	def mask(number)
		"XXXX-XXXX-XXXX-#{last_digits(number)}"
	end
end
