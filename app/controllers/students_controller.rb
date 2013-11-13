require 'rubygems'
require 'active_merchant'
class StudentsController < ApplicationController
  # GET /students/1
  def show
    @student = current_user
    my_enrollments = Enrollment.where(:user_id => @student.id)
    my_courses = []
    my_enrollments.each do |e|
      my_courses << Course.find(e.course_id)
    end

    # call search methods
    if params[:search].blank?
      #flash[:notice] = "Please Type in Keywords"
    else
      if params[:search_type] == 'Search by Course'
        #flash[:notice] = "Search by Course"
        search_by_course
      else
        #flash[:notice] = "Search by Mentor"
        search_by_mentor
      end
    end

    @my_courses = my_courses
    my_line_items = LineItem.where(:user_id => @student.id)
    my_cart = []
    @total_price = 0
    my_line_items.each do |e|
      course = Course.find(e.course_id)
      my_cart << course
      @total_price += course.price
    end
    @my_cart = my_cart
    @courses = Course.all
    @json = Course.all.to_gmaps4rails

  end

  # POST /students/1	add a course to a student
  def addCourse(course_id)
    enrollment = Enrollment.create(:course_id => course_id, :user_id => current_user.id)
		enrollment.save
  end

  def search_by_course
    if params[:search].blank?
      @typein = nil
    else
      @typein = params[:search]
      @search = Sunspot.search(Course) do
        keywords params[:search] do
          highlight :name
        end
        order_by :price
      end
      @course_list = @search.results
    end
  end

  def search_by_mentor
    @mentors = Sunspot.search(Mentor) do
      fulltext params[:search]
    end
    @typein = params[:search]
    if @mentors.results.blank?
      @course_list = nil
    else
      #@typein = params[:search]
      @mentors.results.each do |user|
        userid = user.id
        @search = Sunspot.search(Course) do
          with(:user_id, userid)
          order_by :price
        end
        @course_list = @search.results
      end
    end
  end
	
  # POST /students/1	add a course to a student
  def addtoCart
    @line_item = LineItem.create(:course_id => params[:course_id], :user_id => current_user.id)

    respond_to do |format|
      if @line_item.save
        flash[:notice] = "This course was successfully added to cart!" 
        format.html { redirect_to student_url }
      else 
				flash[:error] = "Cannot add this course to cart!"
				#@line_item.errors.each{|attr,msg| puts "#{attr} - #{msg}" }
        format.html { redirect_to student_url }
      end
    end
  end
	
	def EmptyCart
		@my_cart = []
		LineItem.delete_all(:user_id => current_user.id)
		flash[:notice] = "Your cart is empty!" 
		respond_to do |format|
			format.html { redirect_to student_url }
		end
	end
	
	def checkout		
		my_line_items = LineItem.where(:user_id => current_user.id)
		my_cart = []
		@total_price = 0
    my_line_items.each do |e|
			course = Course.find(e.course_id)
      my_cart << course
			@total_price += course.price			
    end		
		@my_cart = my_cart
		@card = CreditCard.find(params[:credit_card_id])
		# Use the TrustCommerce test servers
		ActiveMerchant::Billing::Base.mode = :test

		gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
								:login => 'TestMerchant',
								:password => 'password')

		# ActiveMerchant accepts all amounts as Integer values in cents
		amount = @total_price * 100

		# The card verification value is also known as CVV2, CVC2, or CID
		credit_card = ActiveMerchant::Billing::CreditCard.new(
										:first_name         => @card.first_name,
										:last_name          => @card.last_name,
										:number             => @card.number,
										:month              => @card.month.to_i,
										:year               => @card.year.to_i,
										:verification_value => @card.verification_value)

		# Validating the card automatically detects the card type
		if credit_card.valid?
			# Capture $10 from the credit card
			response = gateway.purchase(amount.to_i, credit_card)	

			if response.success?	
				my_line_items.each do |e|
					addCourse(e.course_id)
				end					
				my_line_items = []
				LineItem.delete_all(:user_id => current_user.id)
				flash[:error] = "Successfully charged $#{sprintf("%.2f", amount / 100)} to the credit card #{credit_card.display_number}"
				respond_to do |format|
					format.html { redirect_to student_url }
				end
			else
				flash[:error] = "Checkout failed"
				respond_to do |format|
					format.html { redirect_to student_url }
				end
			end
		else
				flash[:error] = "Credit Card invalid"
				respond_to do |format|
					format.html { redirect_to student_url }
				end
		end
	end
end
