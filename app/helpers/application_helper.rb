module ApplicationHelper
	def get_instructor
	byebug 
	i = Instructor.first 
	instructor = @instructors.first
	k = @instructors[1]
	# Instructor.find_each do |instructor|	
		id = instructor.id			
		first = instructor.first
		middle = instructor.middle
		last = instructor.last 
		email = instructor.email
		# 	return id, first, middle, last, email   
	end
end
