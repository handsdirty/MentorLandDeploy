class MentorsController < ApplicationController
  # GET /mentors/1
  def show
	@allcourses = Course.paginate(:page => params[:page], :per_page => 20)
    @mentor = current_user
    @courses = Course.where(:user_id => @mentor.id)
		# @total_earn = 0
		# @courses.each do |course|
		# 	enrollments = Enrollment.count(:course_id => course.id)
		# 	@total_earn += enrollments*course.price
		# 	#enrollments.
		# end
    @course = Course.new	# you must new one first!!
    @json = @courses.to_gmaps4rails
  end

  # POST /mentors/1
  # POST a course
  def createCourse
    @course = Course.new(params[:course])

    respond_to do |format|
      if @course.save
        flash[:notice] = "Course was successfully created!" 
        format.html { redirect_to mentor_url }
      else 
	flash[:error] = "Cannot add this course!"
        format.html { redirect_to mentor_url }
      end
    end
  end

end
