# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role 'admin'
user.add_role 'user'
user.add_role 'mentor'
user.add_role 'student'

pureadmin = User.find_or_create_by_email :name => 'pureadmin', :email => 'pureadmin@example.com', :password => 'pureadmin', :password_confirmation => 'pureadmin'
puts 'user: ' << pureadmin.name
pureadmin.add_role 'admin'
pureadmin.add_role 'user'

purementor = User.find_or_create_by_email :name => 'purementor', :email => 'purementor@example.com', :password => 'purementor', :password_confirmation => 'purementor'
puts 'user: ' << purementor.name
purementor.add_role 'mentor'
purementor.add_role 'user'


purestudent = User.find_or_create_by_email :name => 'purestudent', :email => 'purestudent@example.com', :password => 'purestudent', :password_confirmation => 'purestudent'
puts 'user: ' << purestudent.name
purestudent.add_role 'student'
purestudent.add_role 'user'

# still have some questions: how to let user... it seems that one model, single table inheritance is the best...
mentorstudent = User.find_or_create_by_email :name => 'mentorstudent', :email => 'mentorstudent@example.com', :password => 'mentorstudent', :password_confirmation => 'mentorstudent'
puts 'user: ' << mentorstudent.name
mentorstudent.add_role 'mentor'
mentorstudent.add_role 'student'
mentorstudent.add_role 'user'

pureuser = User.find_or_create_by_email :name => 'pureuser', :email => 'pureuser@example.com', :password => 'pureuser', :password_confirmation => 'pureuser'
puts 'user: ' << pureuser.name
pureuser.add_role 'user'

# For address and location initializations, either you provide a valid address like course4, or you explicitly provide address and (lat, lon) like course1 to course3.
course1 = Course.find_or_create_by_name(:user_id => purementor.id, :name => 'CS 290B', :price => 10, :capacity => 10, :address => 'ucsb east', :longitude => -119.843, :latitude => 34.415)
puts 'course: ' << course1.name
course2 = Course.find_or_create_by_name(:user_id => purementor.id, :name => 'CS 290CC', :price => 10, :capacity => 10, :address => 'ucsb north', :longitude => -119.856, :latitude => 34.422)
puts 'course: ' << course2.name
course3 = Course.find_or_create_by_name(:user_id => mentorstudent.id, :name => 'CS 40', :price => 20, :capacity => 10, :address => 'ucsb west', :longitude => -119.875, :latitude => 34.420)
puts 'course: ' << course3.name

course4 = Course.find_or_create_by_name(:user_id => mentorstudent.id, :name => 'CS No Location', :price => 20, :capacity => 10, :address => '6320 El Colegio Rd, Goleta, CA')
puts 'course: ' << course4.name


enrollment1 = Enrollment.create(:user_id => purestudent.id, :course_id => course1.id)
puts 'enrollment: '
enrollment2 = Enrollment.create(:user_id => purestudent.id, :course_id => course2.id)
puts 'enrollment: '


puts 'adding mentors...'
mentor_0 = User.find_or_create_by_email :name => 'mentor_0', :email => 'mentor_0@example.com', :password => 'mentor_0', :password_confirmation => 'mentor_0'
mentor_0.add_role 'mentor'
mentor_0.add_role 'user'
mentor_1 = User.find_or_create_by_email :name => 'mentor_1', :email => 'mentor_1@example.com', :password => 'mentor_1', :password_confirmation => 'mentor_1'
mentor_1.add_role 'mentor'
mentor_1.add_role 'user'
mentor_2 = User.find_or_create_by_email :name => 'mentor_2', :email => 'mentor_2@example.com', :password => 'mentor_2', :password_confirmation => 'mentor_2'
mentor_2.add_role 'mentor'
mentor_2.add_role 'user'
mentor_3 = User.find_or_create_by_email :name => 'mentor_3', :email => 'mentor_3@example.com', :password => 'mentor_3', :password_confirmation => 'mentor_3'
mentor_3.add_role 'mentor'
mentor_3.add_role 'user'
mentor_4 = User.find_or_create_by_email :name => 'mentor_4', :email => 'mentor_4@example.com', :password => 'mentor_4', :password_confirmation => 'mentor_4'
mentor_4.add_role 'mentor'
mentor_4.add_role 'user'
mentor_5 = User.find_or_create_by_email :name => 'mentor_5', :email => 'mentor_5@example.com', :password => 'mentor_5', :password_confirmation => 'mentor_5'
mentor_5.add_role 'mentor'
mentor_5.add_role 'user'
mentor_6 = User.find_or_create_by_email :name => 'mentor_6', :email => 'mentor_6@example.com', :password => 'mentor_6', :password_confirmation => 'mentor_6'
mentor_6.add_role 'mentor'
mentor_6.add_role 'user'
mentor_7 = User.find_or_create_by_email :name => 'mentor_7', :email => 'mentor_7@example.com', :password => 'mentor_7', :password_confirmation => 'mentor_7'
mentor_7.add_role 'mentor'
mentor_7.add_role 'user'
mentor_8 = User.find_or_create_by_email :name => 'mentor_8', :email => 'mentor_8@example.com', :password => 'mentor_8', :password_confirmation => 'mentor_8'
mentor_8.add_role 'mentor'
mentor_8.add_role 'user'
mentor_9 = User.find_or_create_by_email :name => 'mentor_9', :email => 'mentor_9@example.com', :password => 'mentor_9', :password_confirmation => 'mentor_9'
mentor_9.add_role 'mentor'
mentor_9.add_role 'user'
puts 'added 1000 mentors'
puts 'creating courses'
course_0_A = Course.find_or_create_by_name(:user_id => mentor_0.id, :name => 'course 0 A', :price => 10, :capacity => 100, :address => '0 Hollister Ave, Goleta, CA')
course_0_B = Course.find_or_create_by_name(:user_id => mentor_0.id, :name => 'course 0 B', :price => 10, :capacity => 100, :address => '0 El Colegio Rd, Goleta, CA')
course_0_C = Course.find_or_create_by_name(:user_id => mentor_0.id, :name => 'course 0 C', :price => 10, :capacity => 100, :address => '0 Mission Street, Santa Barbara, CA')
course_0_D = Course.find_or_create_by_name(:user_id => mentor_0.id, :name => 'course 0 D', :price => 10, :capacity => 100, :address => '0 State Street, Santa Barbara, CA')
course_0_E = Course.find_or_create_by_name(:user_id => mentor_0.id, :name => 'course 0 E', :price => 10, :capacity => 100, :address => '0 De La Vina Street, Santa Barbara, CA')
course_1_A = Course.find_or_create_by_name(:user_id => mentor_1.id, :name => 'course 1 A', :price => 10, :capacity => 100, :address => '1 Hollister Ave, Goleta, CA')
course_1_B = Course.find_or_create_by_name(:user_id => mentor_1.id, :name => 'course 1 B', :price => 10, :capacity => 100, :address => '1 El Colegio Rd, Goleta, CA')
course_1_C = Course.find_or_create_by_name(:user_id => mentor_1.id, :name => 'course 1 C', :price => 10, :capacity => 100, :address => '1 Mission Street, Santa Barbara, CA')
course_1_D = Course.find_or_create_by_name(:user_id => mentor_1.id, :name => 'course 1 D', :price => 10, :capacity => 100, :address => '1 State Street, Santa Barbara, CA')
course_1_E = Course.find_or_create_by_name(:user_id => mentor_1.id, :name => 'course 1 E', :price => 10, :capacity => 100, :address => '1 De La Vina Street, Santa Barbara, CA')
course_2_A = Course.find_or_create_by_name(:user_id => mentor_2.id, :name => 'course 2 A', :price => 10, :capacity => 100, :address => '2 Hollister Ave, Goleta, CA')
course_2_B = Course.find_or_create_by_name(:user_id => mentor_2.id, :name => 'course 2 B', :price => 10, :capacity => 100, :address => '2 El Colegio Rd, Goleta, CA')
course_2_C = Course.find_or_create_by_name(:user_id => mentor_2.id, :name => 'course 2 C', :price => 10, :capacity => 100, :address => '2 Mission Street, Santa Barbara, CA')
course_2_D = Course.find_or_create_by_name(:user_id => mentor_2.id, :name => 'course 2 D', :price => 10, :capacity => 100, :address => '2 State Street, Santa Barbara, CA')
course_2_E = Course.find_or_create_by_name(:user_id => mentor_2.id, :name => 'course 2 E', :price => 10, :capacity => 100, :address => '2 De La Vina Street, Santa Barbara, CA')
course_3_A = Course.find_or_create_by_name(:user_id => mentor_3.id, :name => 'course 3 A', :price => 10, :capacity => 100, :address => '3 Hollister Ave, Goleta, CA')
course_3_B = Course.find_or_create_by_name(:user_id => mentor_3.id, :name => 'course 3 B', :price => 10, :capacity => 100, :address => '3 El Colegio Rd, Goleta, CA')
course_3_C = Course.find_or_create_by_name(:user_id => mentor_3.id, :name => 'course 3 C', :price => 10, :capacity => 100, :address => '3 Mission Street, Santa Barbara, CA')
course_3_D = Course.find_or_create_by_name(:user_id => mentor_3.id, :name => 'course 3 D', :price => 10, :capacity => 100, :address => '3 State Street, Santa Barbara, CA')
course_3_E = Course.find_or_create_by_name(:user_id => mentor_3.id, :name => 'course 3 E', :price => 10, :capacity => 100, :address => '3 De La Vina Street, Santa Barbara, CA')
course_4_A = Course.find_or_create_by_name(:user_id => mentor_4.id, :name => 'course 4 A', :price => 10, :capacity => 100, :address => '4 Hollister Ave, Goleta, CA')
course_4_B = Course.find_or_create_by_name(:user_id => mentor_4.id, :name => 'course 4 B', :price => 10, :capacity => 100, :address => '4 El Colegio Rd, Goleta, CA')
course_4_C = Course.find_or_create_by_name(:user_id => mentor_4.id, :name => 'course 4 C', :price => 10, :capacity => 100, :address => '4 Mission Street, Santa Barbara, CA')
course_4_D = Course.find_or_create_by_name(:user_id => mentor_4.id, :name => 'course 4 D', :price => 10, :capacity => 100, :address => '4 State Street, Santa Barbara, CA')
course_4_E = Course.find_or_create_by_name(:user_id => mentor_4.id, :name => 'course 4 E', :price => 10, :capacity => 100, :address => '4 De La Vina Street, Santa Barbara, CA')
course_5_A = Course.find_or_create_by_name(:user_id => mentor_5.id, :name => 'course 5 A', :price => 10, :capacity => 100, :address => '5 Hollister Ave, Goleta, CA')
course_5_B = Course.find_or_create_by_name(:user_id => mentor_5.id, :name => 'course 5 B', :price => 10, :capacity => 100, :address => '5 El Colegio Rd, Goleta, CA')
course_5_C = Course.find_or_create_by_name(:user_id => mentor_5.id, :name => 'course 5 C', :price => 10, :capacity => 100, :address => '5 Mission Street, Santa Barbara, CA')
course_5_D = Course.find_or_create_by_name(:user_id => mentor_5.id, :name => 'course 5 D', :price => 10, :capacity => 100, :address => '5 State Street, Santa Barbara, CA')
course_5_E = Course.find_or_create_by_name(:user_id => mentor_5.id, :name => 'course 5 E', :price => 10, :capacity => 100, :address => '5 De La Vina Street, Santa Barbara, CA')
course_6_A = Course.find_or_create_by_name(:user_id => mentor_6.id, :name => 'course 6 A', :price => 10, :capacity => 100, :address => '6 Hollister Ave, Goleta, CA')
course_6_B = Course.find_or_create_by_name(:user_id => mentor_6.id, :name => 'course 6 B', :price => 10, :capacity => 100, :address => '6 El Colegio Rd, Goleta, CA')
course_6_C = Course.find_or_create_by_name(:user_id => mentor_6.id, :name => 'course 6 C', :price => 10, :capacity => 100, :address => '6 Mission Street, Santa Barbara, CA')
course_6_D = Course.find_or_create_by_name(:user_id => mentor_6.id, :name => 'course 6 D', :price => 10, :capacity => 100, :address => '6 State Street, Santa Barbara, CA')
course_6_E = Course.find_or_create_by_name(:user_id => mentor_6.id, :name => 'course 6 E', :price => 10, :capacity => 100, :address => '6 De La Vina Street, Santa Barbara, CA')
course_7_A = Course.find_or_create_by_name(:user_id => mentor_7.id, :name => 'course 7 A', :price => 10, :capacity => 100, :address => '7 Hollister Ave, Goleta, CA')
course_7_B = Course.find_or_create_by_name(:user_id => mentor_7.id, :name => 'course 7 B', :price => 10, :capacity => 100, :address => '7 El Colegio Rd, Goleta, CA')
course_7_C = Course.find_or_create_by_name(:user_id => mentor_7.id, :name => 'course 7 C', :price => 10, :capacity => 100, :address => '7 Mission Street, Santa Barbara, CA')
course_7_D = Course.find_or_create_by_name(:user_id => mentor_7.id, :name => 'course 7 D', :price => 10, :capacity => 100, :address => '7 State Street, Santa Barbara, CA')
course_7_E = Course.find_or_create_by_name(:user_id => mentor_7.id, :name => 'course 7 E', :price => 10, :capacity => 100, :address => '7 De La Vina Street, Santa Barbara, CA')
course_8_A = Course.find_or_create_by_name(:user_id => mentor_8.id, :name => 'course 8 A', :price => 10, :capacity => 100, :address => '8 Hollister Ave, Goleta, CA')
course_8_B = Course.find_or_create_by_name(:user_id => mentor_8.id, :name => 'course 8 B', :price => 10, :capacity => 100, :address => '8 El Colegio Rd, Goleta, CA')
course_8_C = Course.find_or_create_by_name(:user_id => mentor_8.id, :name => 'course 8 C', :price => 10, :capacity => 100, :address => '8 Mission Street, Santa Barbara, CA')
course_8_D = Course.find_or_create_by_name(:user_id => mentor_8.id, :name => 'course 8 D', :price => 10, :capacity => 100, :address => '8 State Street, Santa Barbara, CA')
course_8_E = Course.find_or_create_by_name(:user_id => mentor_8.id, :name => 'course 8 E', :price => 10, :capacity => 100, :address => '8 De La Vina Street, Santa Barbara, CA')
course_9_A = Course.find_or_create_by_name(:user_id => mentor_9.id, :name => 'course 9 A', :price => 10, :capacity => 100, :address => '9 Hollister Ave, Goleta, CA')
course_9_B = Course.find_or_create_by_name(:user_id => mentor_9.id, :name => 'course 9 B', :price => 10, :capacity => 100, :address => '9 El Colegio Rd, Goleta, CA')
course_9_C = Course.find_or_create_by_name(:user_id => mentor_9.id, :name => 'course 9 C', :price => 10, :capacity => 100, :address => '9 Mission Street, Santa Barbara, CA')
course_9_D = Course.find_or_create_by_name(:user_id => mentor_9.id, :name => 'course 9 D', :price => 10, :capacity => 100, :address => '9 State Street, Santa Barbara, CA')
course_9_E = Course.find_or_create_by_name(:user_id => mentor_9.id, :name => 'course 9 E', :price => 10, :capacity => 100, :address => '9 De La Vina Street, Santa Barbara, CA')
puts 'created 5 courses for each mentor'
puts 'adding students...'
student_0 = User.find_or_create_by_email :name => 'student_0', :email => 'student_0@example.com', :password => 'student_0', :password_confirmation => 'student_0'
student_0.add_role 'student'
student_0.add_role 'user'
student_1 = User.find_or_create_by_email :name => 'student_1', :email => 'student_1@example.com', :password => 'student_1', :password_confirmation => 'student_1'
student_1.add_role 'student'
student_1.add_role 'user'
student_2 = User.find_or_create_by_email :name => 'student_2', :email => 'student_2@example.com', :password => 'student_2', :password_confirmation => 'student_2'
student_2.add_role 'student'
student_2.add_role 'user'
student_3 = User.find_or_create_by_email :name => 'student_3', :email => 'student_3@example.com', :password => 'student_3', :password_confirmation => 'student_3'
student_3.add_role 'student'
student_3.add_role 'user'
student_4 = User.find_or_create_by_email :name => 'student_4', :email => 'student_4@example.com', :password => 'student_4', :password_confirmation => 'student_4'
student_4.add_role 'student'
student_4.add_role 'user'
student_5 = User.find_or_create_by_email :name => 'student_5', :email => 'student_5@example.com', :password => 'student_5', :password_confirmation => 'student_5'
student_5.add_role 'student'
student_5.add_role 'user'
student_6 = User.find_or_create_by_email :name => 'student_6', :email => 'student_6@example.com', :password => 'student_6', :password_confirmation => 'student_6'
student_6.add_role 'student'
student_6.add_role 'user'
student_7 = User.find_or_create_by_email :name => 'student_7', :email => 'student_7@example.com', :password => 'student_7', :password_confirmation => 'student_7'
student_7.add_role 'student'
student_7.add_role 'user'
student_8 = User.find_or_create_by_email :name => 'student_8', :email => 'student_8@example.com', :password => 'student_8', :password_confirmation => 'student_8'
student_8.add_role 'student'
student_8.add_role 'user'
student_9 = User.find_or_create_by_email :name => 'student_9', :email => 'student_9@example.com', :password => 'student_9', :password_confirmation => 'student_9'
student_9.add_role 'student'
student_9.add_role 'user'
student_10 = User.find_or_create_by_email :name => 'student_10', :email => 'student_10@example.com', :password => 'student_10', :password_confirmation => 'student_10'
student_10.add_role 'student'
student_10.add_role 'user'
student_11 = User.find_or_create_by_email :name => 'student_11', :email => 'student_11@example.com', :password => 'student_11', :password_confirmation => 'student_11'
student_11.add_role 'student'
student_11.add_role 'user'
student_12 = User.find_or_create_by_email :name => 'student_12', :email => 'student_12@example.com', :password => 'student_12', :password_confirmation => 'student_12'
student_12.add_role 'student'
student_12.add_role 'user'
student_13 = User.find_or_create_by_email :name => 'student_13', :email => 'student_13@example.com', :password => 'student_13', :password_confirmation => 'student_13'
student_13.add_role 'student'
student_13.add_role 'user'
student_14 = User.find_or_create_by_email :name => 'student_14', :email => 'student_14@example.com', :password => 'student_14', :password_confirmation => 'student_14'
student_14.add_role 'student'
student_14.add_role 'user'
student_15 = User.find_or_create_by_email :name => 'student_15', :email => 'student_15@example.com', :password => 'student_15', :password_confirmation => 'student_15'
student_15.add_role 'student'
student_15.add_role 'user'
student_16 = User.find_or_create_by_email :name => 'student_16', :email => 'student_16@example.com', :password => 'student_16', :password_confirmation => 'student_16'
student_16.add_role 'student'
student_16.add_role 'user'
student_17 = User.find_or_create_by_email :name => 'student_17', :email => 'student_17@example.com', :password => 'student_17', :password_confirmation => 'student_17'
student_17.add_role 'student'
student_17.add_role 'user'
student_18 = User.find_or_create_by_email :name => 'student_18', :email => 'student_18@example.com', :password => 'student_18', :password_confirmation => 'student_18'
student_18.add_role 'student'
student_18.add_role 'user'
student_19 = User.find_or_create_by_email :name => 'student_19', :email => 'student_19@example.com', :password => 'student_19', :password_confirmation => 'student_19'
student_19.add_role 'student'
student_19.add_role 'user'
student_20 = User.find_or_create_by_email :name => 'student_20', :email => 'student_20@example.com', :password => 'student_20', :password_confirmation => 'student_20'
student_20.add_role 'student'
student_20.add_role 'user'
student_21 = User.find_or_create_by_email :name => 'student_21', :email => 'student_21@example.com', :password => 'student_21', :password_confirmation => 'student_21'
student_21.add_role 'student'
student_21.add_role 'user'
student_22 = User.find_or_create_by_email :name => 'student_22', :email => 'student_22@example.com', :password => 'student_22', :password_confirmation => 'student_22'
student_22.add_role 'student'
student_22.add_role 'user'
student_23 = User.find_or_create_by_email :name => 'student_23', :email => 'student_23@example.com', :password => 'student_23', :password_confirmation => 'student_23'
student_23.add_role 'student'
student_23.add_role 'user'
student_24 = User.find_or_create_by_email :name => 'student_24', :email => 'student_24@example.com', :password => 'student_24', :password_confirmation => 'student_24'
student_24.add_role 'student'
student_24.add_role 'user'
student_25 = User.find_or_create_by_email :name => 'student_25', :email => 'student_25@example.com', :password => 'student_25', :password_confirmation => 'student_25'
student_25.add_role 'student'
student_25.add_role 'user'
student_26 = User.find_or_create_by_email :name => 'student_26', :email => 'student_26@example.com', :password => 'student_26', :password_confirmation => 'student_26'
student_26.add_role 'student'
student_26.add_role 'user'
student_27 = User.find_or_create_by_email :name => 'student_27', :email => 'student_27@example.com', :password => 'student_27', :password_confirmation => 'student_27'
student_27.add_role 'student'
student_27.add_role 'user'
student_28 = User.find_or_create_by_email :name => 'student_28', :email => 'student_28@example.com', :password => 'student_28', :password_confirmation => 'student_28'
student_28.add_role 'student'
student_28.add_role 'user'
student_29 = User.find_or_create_by_email :name => 'student_29', :email => 'student_29@example.com', :password => 'student_29', :password_confirmation => 'student_29'
student_29.add_role 'student'
student_29.add_role 'user'
student_30 = User.find_or_create_by_email :name => 'student_30', :email => 'student_30@example.com', :password => 'student_30', :password_confirmation => 'student_30'
student_30.add_role 'student'
student_30.add_role 'user'
student_31 = User.find_or_create_by_email :name => 'student_31', :email => 'student_31@example.com', :password => 'student_31', :password_confirmation => 'student_31'
student_31.add_role 'student'
student_31.add_role 'user'
student_32 = User.find_or_create_by_email :name => 'student_32', :email => 'student_32@example.com', :password => 'student_32', :password_confirmation => 'student_32'
student_32.add_role 'student'
student_32.add_role 'user'
student_33 = User.find_or_create_by_email :name => 'student_33', :email => 'student_33@example.com', :password => 'student_33', :password_confirmation => 'student_33'
student_33.add_role 'student'
student_33.add_role 'user'
student_34 = User.find_or_create_by_email :name => 'student_34', :email => 'student_34@example.com', :password => 'student_34', :password_confirmation => 'student_34'
student_34.add_role 'student'
student_34.add_role 'user'
student_35 = User.find_or_create_by_email :name => 'student_35', :email => 'student_35@example.com', :password => 'student_35', :password_confirmation => 'student_35'
student_35.add_role 'student'
student_35.add_role 'user'
student_36 = User.find_or_create_by_email :name => 'student_36', :email => 'student_36@example.com', :password => 'student_36', :password_confirmation => 'student_36'
student_36.add_role 'student'
student_36.add_role 'user'
student_37 = User.find_or_create_by_email :name => 'student_37', :email => 'student_37@example.com', :password => 'student_37', :password_confirmation => 'student_37'
student_37.add_role 'student'
student_37.add_role 'user'
student_38 = User.find_or_create_by_email :name => 'student_38', :email => 'student_38@example.com', :password => 'student_38', :password_confirmation => 'student_38'
student_38.add_role 'student'
student_38.add_role 'user'
student_39 = User.find_or_create_by_email :name => 'student_39', :email => 'student_39@example.com', :password => 'student_39', :password_confirmation => 'student_39'
student_39.add_role 'student'
student_39.add_role 'user'
student_40 = User.find_or_create_by_email :name => 'student_40', :email => 'student_40@example.com', :password => 'student_40', :password_confirmation => 'student_40'
student_40.add_role 'student'
student_40.add_role 'user'
student_41 = User.find_or_create_by_email :name => 'student_41', :email => 'student_41@example.com', :password => 'student_41', :password_confirmation => 'student_41'
student_41.add_role 'student'
student_41.add_role 'user'
student_42 = User.find_or_create_by_email :name => 'student_42', :email => 'student_42@example.com', :password => 'student_42', :password_confirmation => 'student_42'
student_42.add_role 'student'
student_42.add_role 'user'
student_43 = User.find_or_create_by_email :name => 'student_43', :email => 'student_43@example.com', :password => 'student_43', :password_confirmation => 'student_43'
student_43.add_role 'student'
student_43.add_role 'user'
student_44 = User.find_or_create_by_email :name => 'student_44', :email => 'student_44@example.com', :password => 'student_44', :password_confirmation => 'student_44'
student_44.add_role 'student'
student_44.add_role 'user'
student_45 = User.find_or_create_by_email :name => 'student_45', :email => 'student_45@example.com', :password => 'student_45', :password_confirmation => 'student_45'
student_45.add_role 'student'
student_45.add_role 'user'
student_46 = User.find_or_create_by_email :name => 'student_46', :email => 'student_46@example.com', :password => 'student_46', :password_confirmation => 'student_46'
student_46.add_role 'student'
student_46.add_role 'user'
student_47 = User.find_or_create_by_email :name => 'student_47', :email => 'student_47@example.com', :password => 'student_47', :password_confirmation => 'student_47'
student_47.add_role 'student'
student_47.add_role 'user'
student_48 = User.find_or_create_by_email :name => 'student_48', :email => 'student_48@example.com', :password => 'student_48', :password_confirmation => 'student_48'
student_48.add_role 'student'
student_48.add_role 'user'
student_49 = User.find_or_create_by_email :name => 'student_49', :email => 'student_49@example.com', :password => 'student_49', :password_confirmation => 'student_49'
student_49.add_role 'student'
student_49.add_role 'user'
student_50 = User.find_or_create_by_email :name => 'student_50', :email => 'student_50@example.com', :password => 'student_50', :password_confirmation => 'student_50'
student_50.add_role 'student'
student_50.add_role 'user'
student_51 = User.find_or_create_by_email :name => 'student_51', :email => 'student_51@example.com', :password => 'student_51', :password_confirmation => 'student_51'
student_51.add_role 'student'
student_51.add_role 'user'
student_52 = User.find_or_create_by_email :name => 'student_52', :email => 'student_52@example.com', :password => 'student_52', :password_confirmation => 'student_52'
student_52.add_role 'student'
student_52.add_role 'user'
student_53 = User.find_or_create_by_email :name => 'student_53', :email => 'student_53@example.com', :password => 'student_53', :password_confirmation => 'student_53'
student_53.add_role 'student'
student_53.add_role 'user'
student_54 = User.find_or_create_by_email :name => 'student_54', :email => 'student_54@example.com', :password => 'student_54', :password_confirmation => 'student_54'
student_54.add_role 'student'
student_54.add_role 'user'
student_55 = User.find_or_create_by_email :name => 'student_55', :email => 'student_55@example.com', :password => 'student_55', :password_confirmation => 'student_55'
student_55.add_role 'student'
student_55.add_role 'user'
student_56 = User.find_or_create_by_email :name => 'student_56', :email => 'student_56@example.com', :password => 'student_56', :password_confirmation => 'student_56'
student_56.add_role 'student'
student_56.add_role 'user'
student_57 = User.find_or_create_by_email :name => 'student_57', :email => 'student_57@example.com', :password => 'student_57', :password_confirmation => 'student_57'
student_57.add_role 'student'
student_57.add_role 'user'
student_58 = User.find_or_create_by_email :name => 'student_58', :email => 'student_58@example.com', :password => 'student_58', :password_confirmation => 'student_58'
student_58.add_role 'student'
student_58.add_role 'user'
student_59 = User.find_or_create_by_email :name => 'student_59', :email => 'student_59@example.com', :password => 'student_59', :password_confirmation => 'student_59'
student_59.add_role 'student'
student_59.add_role 'user'
student_60 = User.find_or_create_by_email :name => 'student_60', :email => 'student_60@example.com', :password => 'student_60', :password_confirmation => 'student_60'
student_60.add_role 'student'
student_60.add_role 'user'
student_61 = User.find_or_create_by_email :name => 'student_61', :email => 'student_61@example.com', :password => 'student_61', :password_confirmation => 'student_61'
student_61.add_role 'student'
student_61.add_role 'user'
student_62 = User.find_or_create_by_email :name => 'student_62', :email => 'student_62@example.com', :password => 'student_62', :password_confirmation => 'student_62'
student_62.add_role 'student'
student_62.add_role 'user'
student_63 = User.find_or_create_by_email :name => 'student_63', :email => 'student_63@example.com', :password => 'student_63', :password_confirmation => 'student_63'
student_63.add_role 'student'
student_63.add_role 'user'
student_64 = User.find_or_create_by_email :name => 'student_64', :email => 'student_64@example.com', :password => 'student_64', :password_confirmation => 'student_64'
student_64.add_role 'student'
student_64.add_role 'user'
student_65 = User.find_or_create_by_email :name => 'student_65', :email => 'student_65@example.com', :password => 'student_65', :password_confirmation => 'student_65'
student_65.add_role 'student'
student_65.add_role 'user'
student_66 = User.find_or_create_by_email :name => 'student_66', :email => 'student_66@example.com', :password => 'student_66', :password_confirmation => 'student_66'
student_66.add_role 'student'
student_66.add_role 'user'
student_67 = User.find_or_create_by_email :name => 'student_67', :email => 'student_67@example.com', :password => 'student_67', :password_confirmation => 'student_67'
student_67.add_role 'student'
student_67.add_role 'user'
student_68 = User.find_or_create_by_email :name => 'student_68', :email => 'student_68@example.com', :password => 'student_68', :password_confirmation => 'student_68'
student_68.add_role 'student'
student_68.add_role 'user'
student_69 = User.find_or_create_by_email :name => 'student_69', :email => 'student_69@example.com', :password => 'student_69', :password_confirmation => 'student_69'
student_69.add_role 'student'
student_69.add_role 'user'
student_70 = User.find_or_create_by_email :name => 'student_70', :email => 'student_70@example.com', :password => 'student_70', :password_confirmation => 'student_70'
student_70.add_role 'student'
student_70.add_role 'user'
student_71 = User.find_or_create_by_email :name => 'student_71', :email => 'student_71@example.com', :password => 'student_71', :password_confirmation => 'student_71'
student_71.add_role 'student'
student_71.add_role 'user'
student_72 = User.find_or_create_by_email :name => 'student_72', :email => 'student_72@example.com', :password => 'student_72', :password_confirmation => 'student_72'
student_72.add_role 'student'
student_72.add_role 'user'
student_73 = User.find_or_create_by_email :name => 'student_73', :email => 'student_73@example.com', :password => 'student_73', :password_confirmation => 'student_73'
student_73.add_role 'student'
student_73.add_role 'user'
student_74 = User.find_or_create_by_email :name => 'student_74', :email => 'student_74@example.com', :password => 'student_74', :password_confirmation => 'student_74'
student_74.add_role 'student'
student_74.add_role 'user'
student_75 = User.find_or_create_by_email :name => 'student_75', :email => 'student_75@example.com', :password => 'student_75', :password_confirmation => 'student_75'
student_75.add_role 'student'
student_75.add_role 'user'
student_76 = User.find_or_create_by_email :name => 'student_76', :email => 'student_76@example.com', :password => 'student_76', :password_confirmation => 'student_76'
student_76.add_role 'student'
student_76.add_role 'user'
student_77 = User.find_or_create_by_email :name => 'student_77', :email => 'student_77@example.com', :password => 'student_77', :password_confirmation => 'student_77'
student_77.add_role 'student'
student_77.add_role 'user'
student_78 = User.find_or_create_by_email :name => 'student_78', :email => 'student_78@example.com', :password => 'student_78', :password_confirmation => 'student_78'
student_78.add_role 'student'
student_78.add_role 'user'
student_79 = User.find_or_create_by_email :name => 'student_79', :email => 'student_79@example.com', :password => 'student_79', :password_confirmation => 'student_79'
student_79.add_role 'student'
student_79.add_role 'user'
student_80 = User.find_or_create_by_email :name => 'student_80', :email => 'student_80@example.com', :password => 'student_80', :password_confirmation => 'student_80'
student_80.add_role 'student'
student_80.add_role 'user'
student_81 = User.find_or_create_by_email :name => 'student_81', :email => 'student_81@example.com', :password => 'student_81', :password_confirmation => 'student_81'
student_81.add_role 'student'
student_81.add_role 'user'
student_82 = User.find_or_create_by_email :name => 'student_82', :email => 'student_82@example.com', :password => 'student_82', :password_confirmation => 'student_82'
student_82.add_role 'student'
student_82.add_role 'user'
student_83 = User.find_or_create_by_email :name => 'student_83', :email => 'student_83@example.com', :password => 'student_83', :password_confirmation => 'student_83'
student_83.add_role 'student'
student_83.add_role 'user'
student_84 = User.find_or_create_by_email :name => 'student_84', :email => 'student_84@example.com', :password => 'student_84', :password_confirmation => 'student_84'
student_84.add_role 'student'
student_84.add_role 'user'
student_85 = User.find_or_create_by_email :name => 'student_85', :email => 'student_85@example.com', :password => 'student_85', :password_confirmation => 'student_85'
student_85.add_role 'student'
student_85.add_role 'user'
student_86 = User.find_or_create_by_email :name => 'student_86', :email => 'student_86@example.com', :password => 'student_86', :password_confirmation => 'student_86'
student_86.add_role 'student'
student_86.add_role 'user'
student_87 = User.find_or_create_by_email :name => 'student_87', :email => 'student_87@example.com', :password => 'student_87', :password_confirmation => 'student_87'
student_87.add_role 'student'
student_87.add_role 'user'
student_88 = User.find_or_create_by_email :name => 'student_88', :email => 'student_88@example.com', :password => 'student_88', :password_confirmation => 'student_88'
student_88.add_role 'student'
student_88.add_role 'user'
student_89 = User.find_or_create_by_email :name => 'student_89', :email => 'student_89@example.com', :password => 'student_89', :password_confirmation => 'student_89'
student_89.add_role 'student'
student_89.add_role 'user'
student_90 = User.find_or_create_by_email :name => 'student_90', :email => 'student_90@example.com', :password => 'student_90', :password_confirmation => 'student_90'
student_90.add_role 'student'
student_90.add_role 'user'
student_91 = User.find_or_create_by_email :name => 'student_91', :email => 'student_91@example.com', :password => 'student_91', :password_confirmation => 'student_91'
student_91.add_role 'student'
student_91.add_role 'user'
student_92 = User.find_or_create_by_email :name => 'student_92', :email => 'student_92@example.com', :password => 'student_92', :password_confirmation => 'student_92'
student_92.add_role 'student'
student_92.add_role 'user'
student_93 = User.find_or_create_by_email :name => 'student_93', :email => 'student_93@example.com', :password => 'student_93', :password_confirmation => 'student_93'
student_93.add_role 'student'
student_93.add_role 'user'
student_94 = User.find_or_create_by_email :name => 'student_94', :email => 'student_94@example.com', :password => 'student_94', :password_confirmation => 'student_94'
student_94.add_role 'student'
student_94.add_role 'user'
student_95 = User.find_or_create_by_email :name => 'student_95', :email => 'student_95@example.com', :password => 'student_95', :password_confirmation => 'student_95'
student_95.add_role 'student'
student_95.add_role 'user'
student_96 = User.find_or_create_by_email :name => 'student_96', :email => 'student_96@example.com', :password => 'student_96', :password_confirmation => 'student_96'
student_96.add_role 'student'
student_96.add_role 'user'
student_97 = User.find_or_create_by_email :name => 'student_97', :email => 'student_97@example.com', :password => 'student_97', :password_confirmation => 'student_97'
student_97.add_role 'student'
student_97.add_role 'user'
student_98 = User.find_or_create_by_email :name => 'student_98', :email => 'student_98@example.com', :password => 'student_98', :password_confirmation => 'student_98'
student_98.add_role 'student'
student_98.add_role 'user'
student_99 = User.find_or_create_by_email :name => 'student_99', :email => 'student_99@example.com', :password => 'student_99', :password_confirmation => 'student_99'
student_99.add_role 'student'
student_99.add_role 'user'
puts 'added 10000 students'
puts 'adding enrollment relationships...'
if course_0_A.id != nil then Enrollment.create(:user_id => student_0.id, :course_id => course_0_A.id) end
if course_0_B.id != nil then Enrollment.create(:user_id => student_0.id, :course_id => course_0_B.id) end
if course_0_B.id != nil then Enrollment.create(:user_id => student_1.id, :course_id => course_0_B.id) end
if course_0_C.id != nil then Enrollment.create(:user_id => student_1.id, :course_id => course_0_C.id) end
if course_0_C.id != nil then Enrollment.create(:user_id => student_2.id, :course_id => course_0_C.id) end
if course_0_D.id != nil then Enrollment.create(:user_id => student_2.id, :course_id => course_0_D.id) end
if course_0_D.id != nil then Enrollment.create(:user_id => student_3.id, :course_id => course_0_D.id) end
if course_0_E.id != nil then Enrollment.create(:user_id => student_3.id, :course_id => course_0_E.id) end
if course_0_E.id != nil then Enrollment.create(:user_id => student_4.id, :course_id => course_0_E.id) end
if course_0_A.id != nil then Enrollment.create(:user_id => student_4.id, :course_id => course_0_A.id) end
if course_0_A.id != nil then Enrollment.create(:user_id => student_5.id, :course_id => course_0_A.id) end
if course_0_B.id != nil then Enrollment.create(:user_id => student_5.id, :course_id => course_0_B.id) end
if course_0_B.id != nil then Enrollment.create(:user_id => student_6.id, :course_id => course_0_B.id) end
if course_0_C.id != nil then Enrollment.create(:user_id => student_6.id, :course_id => course_0_C.id) end
if course_0_C.id != nil then Enrollment.create(:user_id => student_7.id, :course_id => course_0_C.id) end
if course_0_D.id != nil then Enrollment.create(:user_id => student_7.id, :course_id => course_0_D.id) end
if course_0_D.id != nil then Enrollment.create(:user_id => student_8.id, :course_id => course_0_D.id) end
if course_0_E.id != nil then Enrollment.create(:user_id => student_8.id, :course_id => course_0_E.id) end
if course_0_E.id != nil then Enrollment.create(:user_id => student_9.id, :course_id => course_0_E.id) end
if course_0_A.id != nil then Enrollment.create(:user_id => student_9.id, :course_id => course_0_A.id) end
if course_1_A.id != nil then Enrollment.create(:user_id => student_10.id, :course_id => course_1_A.id) end
if course_1_B.id != nil then Enrollment.create(:user_id => student_10.id, :course_id => course_1_B.id) end
if course_1_B.id != nil then Enrollment.create(:user_id => student_11.id, :course_id => course_1_B.id) end
if course_1_C.id != nil then Enrollment.create(:user_id => student_11.id, :course_id => course_1_C.id) end
if course_1_C.id != nil then Enrollment.create(:user_id => student_12.id, :course_id => course_1_C.id) end
if course_1_D.id != nil then Enrollment.create(:user_id => student_12.id, :course_id => course_1_D.id) end
if course_1_D.id != nil then Enrollment.create(:user_id => student_13.id, :course_id => course_1_D.id) end
if course_1_E.id != nil then Enrollment.create(:user_id => student_13.id, :course_id => course_1_E.id) end
if course_1_E.id != nil then Enrollment.create(:user_id => student_14.id, :course_id => course_1_E.id) end
if course_1_A.id != nil then Enrollment.create(:user_id => student_14.id, :course_id => course_1_A.id) end
if course_1_A.id != nil then Enrollment.create(:user_id => student_15.id, :course_id => course_1_A.id) end
if course_1_B.id != nil then Enrollment.create(:user_id => student_15.id, :course_id => course_1_B.id) end
if course_1_B.id != nil then Enrollment.create(:user_id => student_16.id, :course_id => course_1_B.id) end
if course_1_C.id != nil then Enrollment.create(:user_id => student_16.id, :course_id => course_1_C.id) end
if course_1_C.id != nil then Enrollment.create(:user_id => student_17.id, :course_id => course_1_C.id) end
if course_1_D.id != nil then Enrollment.create(:user_id => student_17.id, :course_id => course_1_D.id) end
if course_1_D.id != nil then Enrollment.create(:user_id => student_18.id, :course_id => course_1_D.id) end
if course_1_E.id != nil then Enrollment.create(:user_id => student_18.id, :course_id => course_1_E.id) end
if course_1_E.id != nil then Enrollment.create(:user_id => student_19.id, :course_id => course_1_E.id) end
if course_1_A.id != nil then Enrollment.create(:user_id => student_19.id, :course_id => course_1_A.id) end
if course_2_A.id != nil then Enrollment.create(:user_id => student_20.id, :course_id => course_2_A.id) end
if course_2_B.id != nil then Enrollment.create(:user_id => student_20.id, :course_id => course_2_B.id) end
if course_2_B.id != nil then Enrollment.create(:user_id => student_21.id, :course_id => course_2_B.id) end
if course_2_C.id != nil then Enrollment.create(:user_id => student_21.id, :course_id => course_2_C.id) end
if course_2_C.id != nil then Enrollment.create(:user_id => student_22.id, :course_id => course_2_C.id) end
if course_2_D.id != nil then Enrollment.create(:user_id => student_22.id, :course_id => course_2_D.id) end
if course_2_D.id != nil then Enrollment.create(:user_id => student_23.id, :course_id => course_2_D.id) end
if course_2_E.id != nil then Enrollment.create(:user_id => student_23.id, :course_id => course_2_E.id) end
if course_2_E.id != nil then Enrollment.create(:user_id => student_24.id, :course_id => course_2_E.id) end
if course_2_A.id != nil then Enrollment.create(:user_id => student_24.id, :course_id => course_2_A.id) end
if course_2_A.id != nil then Enrollment.create(:user_id => student_25.id, :course_id => course_2_A.id) end
if course_2_B.id != nil then Enrollment.create(:user_id => student_25.id, :course_id => course_2_B.id) end
if course_2_B.id != nil then Enrollment.create(:user_id => student_26.id, :course_id => course_2_B.id) end
if course_2_C.id != nil then Enrollment.create(:user_id => student_26.id, :course_id => course_2_C.id) end
if course_2_C.id != nil then Enrollment.create(:user_id => student_27.id, :course_id => course_2_C.id) end
if course_2_D.id != nil then Enrollment.create(:user_id => student_27.id, :course_id => course_2_D.id) end
if course_2_D.id != nil then Enrollment.create(:user_id => student_28.id, :course_id => course_2_D.id) end
if course_2_E.id != nil then Enrollment.create(:user_id => student_28.id, :course_id => course_2_E.id) end
if course_2_E.id != nil then Enrollment.create(:user_id => student_29.id, :course_id => course_2_E.id) end
if course_2_A.id != nil then Enrollment.create(:user_id => student_29.id, :course_id => course_2_A.id) end
if course_3_A.id != nil then Enrollment.create(:user_id => student_30.id, :course_id => course_3_A.id) end
if course_3_B.id != nil then Enrollment.create(:user_id => student_30.id, :course_id => course_3_B.id) end
if course_3_B.id != nil then Enrollment.create(:user_id => student_31.id, :course_id => course_3_B.id) end
if course_3_C.id != nil then Enrollment.create(:user_id => student_31.id, :course_id => course_3_C.id) end
if course_3_C.id != nil then Enrollment.create(:user_id => student_32.id, :course_id => course_3_C.id) end
if course_3_D.id != nil then Enrollment.create(:user_id => student_32.id, :course_id => course_3_D.id) end
if course_3_D.id != nil then Enrollment.create(:user_id => student_33.id, :course_id => course_3_D.id) end
if course_3_E.id != nil then Enrollment.create(:user_id => student_33.id, :course_id => course_3_E.id) end
if course_3_E.id != nil then Enrollment.create(:user_id => student_34.id, :course_id => course_3_E.id) end
if course_3_A.id != nil then Enrollment.create(:user_id => student_34.id, :course_id => course_3_A.id) end
if course_3_A.id != nil then Enrollment.create(:user_id => student_35.id, :course_id => course_3_A.id) end
if course_3_B.id != nil then Enrollment.create(:user_id => student_35.id, :course_id => course_3_B.id) end
if course_3_B.id != nil then Enrollment.create(:user_id => student_36.id, :course_id => course_3_B.id) end
if course_3_C.id != nil then Enrollment.create(:user_id => student_36.id, :course_id => course_3_C.id) end
if course_3_C.id != nil then Enrollment.create(:user_id => student_37.id, :course_id => course_3_C.id) end
if course_3_D.id != nil then Enrollment.create(:user_id => student_37.id, :course_id => course_3_D.id) end
if course_3_D.id != nil then Enrollment.create(:user_id => student_38.id, :course_id => course_3_D.id) end
if course_3_E.id != nil then Enrollment.create(:user_id => student_38.id, :course_id => course_3_E.id) end
if course_3_E.id != nil then Enrollment.create(:user_id => student_39.id, :course_id => course_3_E.id) end
if course_3_A.id != nil then Enrollment.create(:user_id => student_39.id, :course_id => course_3_A.id) end
if course_4_A.id != nil then Enrollment.create(:user_id => student_40.id, :course_id => course_4_A.id) end
if course_4_B.id != nil then Enrollment.create(:user_id => student_40.id, :course_id => course_4_B.id) end
if course_4_B.id != nil then Enrollment.create(:user_id => student_41.id, :course_id => course_4_B.id) end
if course_4_C.id != nil then Enrollment.create(:user_id => student_41.id, :course_id => course_4_C.id) end
if course_4_C.id != nil then Enrollment.create(:user_id => student_42.id, :course_id => course_4_C.id) end
if course_4_D.id != nil then Enrollment.create(:user_id => student_42.id, :course_id => course_4_D.id) end
if course_4_D.id != nil then Enrollment.create(:user_id => student_43.id, :course_id => course_4_D.id) end
if course_4_E.id != nil then Enrollment.create(:user_id => student_43.id, :course_id => course_4_E.id) end
if course_4_E.id != nil then Enrollment.create(:user_id => student_44.id, :course_id => course_4_E.id) end
if course_4_A.id != nil then Enrollment.create(:user_id => student_44.id, :course_id => course_4_A.id) end
if course_4_A.id != nil then Enrollment.create(:user_id => student_45.id, :course_id => course_4_A.id) end
if course_4_B.id != nil then Enrollment.create(:user_id => student_45.id, :course_id => course_4_B.id) end
if course_4_B.id != nil then Enrollment.create(:user_id => student_46.id, :course_id => course_4_B.id) end
if course_4_C.id != nil then Enrollment.create(:user_id => student_46.id, :course_id => course_4_C.id) end
if course_4_C.id != nil then Enrollment.create(:user_id => student_47.id, :course_id => course_4_C.id) end
if course_4_D.id != nil then Enrollment.create(:user_id => student_47.id, :course_id => course_4_D.id) end
if course_4_D.id != nil then Enrollment.create(:user_id => student_48.id, :course_id => course_4_D.id) end
if course_4_E.id != nil then Enrollment.create(:user_id => student_48.id, :course_id => course_4_E.id) end
if course_4_E.id != nil then Enrollment.create(:user_id => student_49.id, :course_id => course_4_E.id) end
if course_4_A.id != nil then Enrollment.create(:user_id => student_49.id, :course_id => course_4_A.id) end
if course_5_A.id != nil then Enrollment.create(:user_id => student_50.id, :course_id => course_5_A.id) end
if course_5_B.id != nil then Enrollment.create(:user_id => student_50.id, :course_id => course_5_B.id) end
if course_5_B.id != nil then Enrollment.create(:user_id => student_51.id, :course_id => course_5_B.id) end
if course_5_C.id != nil then Enrollment.create(:user_id => student_51.id, :course_id => course_5_C.id) end
if course_5_C.id != nil then Enrollment.create(:user_id => student_52.id, :course_id => course_5_C.id) end
if course_5_D.id != nil then Enrollment.create(:user_id => student_52.id, :course_id => course_5_D.id) end
if course_5_D.id != nil then Enrollment.create(:user_id => student_53.id, :course_id => course_5_D.id) end
if course_5_E.id != nil then Enrollment.create(:user_id => student_53.id, :course_id => course_5_E.id) end
if course_5_E.id != nil then Enrollment.create(:user_id => student_54.id, :course_id => course_5_E.id) end
if course_5_A.id != nil then Enrollment.create(:user_id => student_54.id, :course_id => course_5_A.id) end
if course_5_A.id != nil then Enrollment.create(:user_id => student_55.id, :course_id => course_5_A.id) end
if course_5_B.id != nil then Enrollment.create(:user_id => student_55.id, :course_id => course_5_B.id) end
if course_5_B.id != nil then Enrollment.create(:user_id => student_56.id, :course_id => course_5_B.id) end
if course_5_C.id != nil then Enrollment.create(:user_id => student_56.id, :course_id => course_5_C.id) end
if course_5_C.id != nil then Enrollment.create(:user_id => student_57.id, :course_id => course_5_C.id) end
if course_5_D.id != nil then Enrollment.create(:user_id => student_57.id, :course_id => course_5_D.id) end
if course_5_D.id != nil then Enrollment.create(:user_id => student_58.id, :course_id => course_5_D.id) end
if course_5_E.id != nil then Enrollment.create(:user_id => student_58.id, :course_id => course_5_E.id) end
if course_5_E.id != nil then Enrollment.create(:user_id => student_59.id, :course_id => course_5_E.id) end
if course_5_A.id != nil then Enrollment.create(:user_id => student_59.id, :course_id => course_5_A.id) end
if course_6_A.id != nil then Enrollment.create(:user_id => student_60.id, :course_id => course_6_A.id) end
if course_6_B.id != nil then Enrollment.create(:user_id => student_60.id, :course_id => course_6_B.id) end
if course_6_B.id != nil then Enrollment.create(:user_id => student_61.id, :course_id => course_6_B.id) end
if course_6_C.id != nil then Enrollment.create(:user_id => student_61.id, :course_id => course_6_C.id) end
if course_6_C.id != nil then Enrollment.create(:user_id => student_62.id, :course_id => course_6_C.id) end
if course_6_D.id != nil then Enrollment.create(:user_id => student_62.id, :course_id => course_6_D.id) end
if course_6_D.id != nil then Enrollment.create(:user_id => student_63.id, :course_id => course_6_D.id) end
if course_6_E.id != nil then Enrollment.create(:user_id => student_63.id, :course_id => course_6_E.id) end
if course_6_E.id != nil then Enrollment.create(:user_id => student_64.id, :course_id => course_6_E.id) end
if course_6_A.id != nil then Enrollment.create(:user_id => student_64.id, :course_id => course_6_A.id) end
if course_6_A.id != nil then Enrollment.create(:user_id => student_65.id, :course_id => course_6_A.id) end
if course_6_B.id != nil then Enrollment.create(:user_id => student_65.id, :course_id => course_6_B.id) end
if course_6_B.id != nil then Enrollment.create(:user_id => student_66.id, :course_id => course_6_B.id) end
if course_6_C.id != nil then Enrollment.create(:user_id => student_66.id, :course_id => course_6_C.id) end
if course_6_C.id != nil then Enrollment.create(:user_id => student_67.id, :course_id => course_6_C.id) end
if course_6_D.id != nil then Enrollment.create(:user_id => student_67.id, :course_id => course_6_D.id) end
if course_6_D.id != nil then Enrollment.create(:user_id => student_68.id, :course_id => course_6_D.id) end
if course_6_E.id != nil then Enrollment.create(:user_id => student_68.id, :course_id => course_6_E.id) end
if course_6_E.id != nil then Enrollment.create(:user_id => student_69.id, :course_id => course_6_E.id) end
if course_6_A.id != nil then Enrollment.create(:user_id => student_69.id, :course_id => course_6_A.id) end
if course_7_A.id != nil then Enrollment.create(:user_id => student_70.id, :course_id => course_7_A.id) end
if course_7_B.id != nil then Enrollment.create(:user_id => student_70.id, :course_id => course_7_B.id) end
if course_7_B.id != nil then Enrollment.create(:user_id => student_71.id, :course_id => course_7_B.id) end
if course_7_C.id != nil then Enrollment.create(:user_id => student_71.id, :course_id => course_7_C.id) end
if course_7_C.id != nil then Enrollment.create(:user_id => student_72.id, :course_id => course_7_C.id) end
if course_7_D.id != nil then Enrollment.create(:user_id => student_72.id, :course_id => course_7_D.id) end
if course_7_D.id != nil then Enrollment.create(:user_id => student_73.id, :course_id => course_7_D.id) end
if course_7_E.id != nil then Enrollment.create(:user_id => student_73.id, :course_id => course_7_E.id) end
if course_7_E.id != nil then Enrollment.create(:user_id => student_74.id, :course_id => course_7_E.id) end
if course_7_A.id != nil then Enrollment.create(:user_id => student_74.id, :course_id => course_7_A.id) end
if course_7_A.id != nil then Enrollment.create(:user_id => student_75.id, :course_id => course_7_A.id) end
if course_7_B.id != nil then Enrollment.create(:user_id => student_75.id, :course_id => course_7_B.id) end
if course_7_B.id != nil then Enrollment.create(:user_id => student_76.id, :course_id => course_7_B.id) end
if course_7_C.id != nil then Enrollment.create(:user_id => student_76.id, :course_id => course_7_C.id) end
if course_7_C.id != nil then Enrollment.create(:user_id => student_77.id, :course_id => course_7_C.id) end
if course_7_D.id != nil then Enrollment.create(:user_id => student_77.id, :course_id => course_7_D.id) end
if course_7_D.id != nil then Enrollment.create(:user_id => student_78.id, :course_id => course_7_D.id) end
if course_7_E.id != nil then Enrollment.create(:user_id => student_78.id, :course_id => course_7_E.id) end
if course_7_E.id != nil then Enrollment.create(:user_id => student_79.id, :course_id => course_7_E.id) end
if course_7_A.id != nil then Enrollment.create(:user_id => student_79.id, :course_id => course_7_A.id) end
if course_8_A.id != nil then Enrollment.create(:user_id => student_80.id, :course_id => course_8_A.id) end
if course_8_B.id != nil then Enrollment.create(:user_id => student_80.id, :course_id => course_8_B.id) end
if course_8_B.id != nil then Enrollment.create(:user_id => student_81.id, :course_id => course_8_B.id) end
if course_8_C.id != nil then Enrollment.create(:user_id => student_81.id, :course_id => course_8_C.id) end
if course_8_C.id != nil then Enrollment.create(:user_id => student_82.id, :course_id => course_8_C.id) end
if course_8_D.id != nil then Enrollment.create(:user_id => student_82.id, :course_id => course_8_D.id) end
if course_8_D.id != nil then Enrollment.create(:user_id => student_83.id, :course_id => course_8_D.id) end
if course_8_E.id != nil then Enrollment.create(:user_id => student_83.id, :course_id => course_8_E.id) end
if course_8_E.id != nil then Enrollment.create(:user_id => student_84.id, :course_id => course_8_E.id) end
if course_8_A.id != nil then Enrollment.create(:user_id => student_84.id, :course_id => course_8_A.id) end
if course_8_A.id != nil then Enrollment.create(:user_id => student_85.id, :course_id => course_8_A.id) end
if course_8_B.id != nil then Enrollment.create(:user_id => student_85.id, :course_id => course_8_B.id) end
if course_8_B.id != nil then Enrollment.create(:user_id => student_86.id, :course_id => course_8_B.id) end
if course_8_C.id != nil then Enrollment.create(:user_id => student_86.id, :course_id => course_8_C.id) end
if course_8_C.id != nil then Enrollment.create(:user_id => student_87.id, :course_id => course_8_C.id) end
if course_8_D.id != nil then Enrollment.create(:user_id => student_87.id, :course_id => course_8_D.id) end
if course_8_D.id != nil then Enrollment.create(:user_id => student_88.id, :course_id => course_8_D.id) end
if course_8_E.id != nil then Enrollment.create(:user_id => student_88.id, :course_id => course_8_E.id) end
if course_8_E.id != nil then Enrollment.create(:user_id => student_89.id, :course_id => course_8_E.id) end
if course_8_A.id != nil then Enrollment.create(:user_id => student_89.id, :course_id => course_8_A.id) end
if course_9_A.id != nil then Enrollment.create(:user_id => student_90.id, :course_id => course_9_A.id) end
if course_9_B.id != nil then Enrollment.create(:user_id => student_90.id, :course_id => course_9_B.id) end
if course_9_B.id != nil then Enrollment.create(:user_id => student_91.id, :course_id => course_9_B.id) end
if course_9_C.id != nil then Enrollment.create(:user_id => student_91.id, :course_id => course_9_C.id) end
if course_9_C.id != nil then Enrollment.create(:user_id => student_92.id, :course_id => course_9_C.id) end
if course_9_D.id != nil then Enrollment.create(:user_id => student_92.id, :course_id => course_9_D.id) end
if course_9_D.id != nil then Enrollment.create(:user_id => student_93.id, :course_id => course_9_D.id) end
if course_9_E.id != nil then Enrollment.create(:user_id => student_93.id, :course_id => course_9_E.id) end
if course_9_E.id != nil then Enrollment.create(:user_id => student_94.id, :course_id => course_9_E.id) end
if course_9_A.id != nil then Enrollment.create(:user_id => student_94.id, :course_id => course_9_A.id) end
if course_9_A.id != nil then Enrollment.create(:user_id => student_95.id, :course_id => course_9_A.id) end
if course_9_B.id != nil then Enrollment.create(:user_id => student_95.id, :course_id => course_9_B.id) end
if course_9_B.id != nil then Enrollment.create(:user_id => student_96.id, :course_id => course_9_B.id) end
if course_9_C.id != nil then Enrollment.create(:user_id => student_96.id, :course_id => course_9_C.id) end
if course_9_C.id != nil then Enrollment.create(:user_id => student_97.id, :course_id => course_9_C.id) end
if course_9_D.id != nil then Enrollment.create(:user_id => student_97.id, :course_id => course_9_D.id) end
if course_9_D.id != nil then Enrollment.create(:user_id => student_98.id, :course_id => course_9_D.id) end
if course_9_E.id != nil then Enrollment.create(:user_id => student_98.id, :course_id => course_9_E.id) end
if course_9_E.id != nil then Enrollment.create(:user_id => student_99.id, :course_id => course_9_E.id) end
if course_9_A.id != nil then Enrollment.create(:user_id => student_99.id, :course_id => course_9_A.id) end
puts 'added 2 course enrollments for each student'
