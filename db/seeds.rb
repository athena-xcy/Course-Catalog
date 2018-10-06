# require 'activerecord-import'
Instructor.destroy_all

instructor = []
columns = [:first, :middle, :last, :email, :bid]

instructor_file = File.read("db/instructor.json")
instructor_data = JSON.parse(instructor_file)

instructor_data.each do |data|
	
	if Instructor.find_by_email(data['email']) == nil
		puts "yes"
		bid = data['id']
		tmp = data['first'].split(" ")
		first = tmp[0]
		middle = tmp[1..tmp.size].join(" ") 
		last = data['last']
		email = data['email']
		instructor << {first: first, middle: middle, last: last, email: email, bid: bid}
	end 
end

Instructor.import columns, instructor, validate: true

subject = []
columns = [:bid, :name]

subject_file = File.read("db/subject.json")
subject_data = JSON.parse(subject_file)

subject_data.each do |data|
	
	if Subject.find_by_bid(data['id']) == nil 
		bid = data['id']
		sname = data['name']
		subject << {bid: bid, name: sname}
	end 
end

Subject.import columns, subject, validate: true

course = []
columns = [:name, :code, :description, :independent_study]


course_file = File.read("db/course.json")
course_data = JSON.parse(course_file)


course_data.each do |data|
 	if Course.find_by_code(data['code']) == nil 
		cname = data['name']  
		code = data['code']
		# credits = data['credits'] credits are all nil 
		description = data['description']
		independent_study = data['independent_study']
		course << {name:cname, code:code, description:description, independent_study:independent_study}
	end 
end
byebug
Course.import columns, course, validate: true 
byebug


