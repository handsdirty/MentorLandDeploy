mentor_size = 1000
student_size = mentor_size * 10
import random
# prepare outfile
outfilename = "seeds.rb"
outfile = open(outfilename, "w")

# create 
content_part1 = open("seeds_part1.rb", "r").read()
outfile.write(content_part1)

# create mentors
outfile.write("puts 'adding mentors...'\n")
pct = 0
for i in range(mentor_size):
	outfile.write("mentor_{} = User.find_or_create_by_email :name => 'mentor_{}', :email => 'mentor_{}@example.com', :password => 'mentor_{}', :password_confirmation => 'mentor_{}'\n".format(i, i, i, i, i))
	outfile.write("mentor_{}.add_role 'mentor'\n".format(i))
	outfile.write("mentor_{}.add_role 'user'\n".format(i))
	if (i*100 / mentor_size > pct):
		pct += 1
		outfile.write("print '.'\n")
outfile.write("puts 'added 1000 mentors'\n")

# create courses
# example: course1 = Course.find_or_create_by_name(:user_id => purementor.id, :name => 'CS 290B', :price => 10, :capacity => 10, :address => 'ucsb east', :longitude => -119.843, :latitude => 34.415)

streets = [" Hollister Ave, Goleta, CA", " El Colegio Rd, Goleta, CA", " Mission Street, Santa Barbara, CA", " State Street, Santa Barbara, CA", " De La Vina Street, Santa Barbara, CA"]
valid_addresses = ["6510 El Colegio Rd, Goleta, CA", "776 Madrona Walk, Goleta, CA"]
outfile.write("puts 'creating courses'\n")
pct = 0
for i in range(mentor_size):
	for j in range(5):
		format_str = "course_{}_{} = Course.find_or_create_by_name(:user_id => mentor_{}.id, :name => 'course {} {}', :price => 10, :capacity => 100, :address => '{}{}')\n"
		outfile.write(format_str.format(i, chr(ord('A')+j), i, i, chr(ord('A')+j), i, streets[j]))
		# format_str = "course_{}_{} = Course.find_or_create_by_name(:user_id => mentor_{}.id, :name => 'course {} {}', :price => 10, :capacity => 100, :address => '{}')\n"
		# outfile.write(format_str.format(i, chr(ord('A')+j), i, i, chr(ord('A')+j), valid_addresses[i%2]))
	if (i*100 / mentor_size > pct):
		pct += 1
		outfile.write("print '.'\n")
outfile.write("puts 'created 5 courses for each mentor'\n")



# create students
outfile.write("puts 'adding students...'\n")
pct = 0
for i in range(student_size):
	outfile.write("student_{} = User.find_or_create_by_email :name => 'student_{}', :email => 'student_{}@example.com', :password => 'student_{}', :password_confirmation => 'student_{}'\n".format(i, i, i, i, i))
	outfile.write("student_{}.add_role 'student'\n".format(i))
	outfile.write("student_{}.add_role 'user'\n".format(i))
	if (i*100 / student_size > pct):
		pct += 1
		outfile.write("print '.'\n")
outfile.write("puts 'added 10000 students'\n")

# create enrollment relationships
outfile.write("puts 'adding enrollment relationships...'\n")
#enrollment1 = Enrollment.create(:user_id => purestudent.id, :course_id => course1.id)
pct = 0
for i in range(student_size):
	mentor_base_id = i / 10
	for j in range(5):
		mentor_id = (mentor_base_id/10)*10 + (mentor_base_id%10 + j)%10
		for k in range(5):
			candidate_course = "course_{}_{}".format(mentor_id, chr(ord('A') + k))
			outfile.write("if {}.id != nil then Enrollment.create(:user_id => student_{}.id, :course_id => {}.id) end\n".format(candidate_course, i, candidate_course))
	if (i*100 / student_size > pct):
		pct += 1
		outfile.write("print '.'\n")
outfile.write("puts 'added 25 course enrollments for each student'\n")

# close outfile
outfile.close()
