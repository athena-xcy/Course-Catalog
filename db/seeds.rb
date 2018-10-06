# require 'activerecord-import'

Course.destroy_all 
Instructor.destroy_all
Subject.destroy_all

instructor = []
columns = [:first, :middle, :last, :email, :bid]

instructor_file = File.read("db/instructor.json")
instructor_data = JSON.parse(instructor_file)

instructor_data.each do |data|
	if Instructor.find_by_email(data['email']) == nil
		bid = data['bid']
		tmp = data['first'].split(" ")
		first = tmp[0]
		middle = tmp[1..tmp.size].join(" ") 
		last = data['last']
		email = data['email']||=''
		instructor << {first: first, middle: middle, last: last, email: email, bid: bid}
	end 
end

Instructor.import columns, instructor, validate: true

subject = []
columns = [:bid, :abbreviation, :name]

subject_file = File.read("db/subject.json")
subject_data = JSON.parse(subject_file)

subject_data.each do |data|
	if Subject.find_by_bid(data['id']) == nil 
		bid = data['id']
		abbreviation = data['abbreviation']
		sname = data['name']
		subject << {bid: bid, abbreviation: abbreviation, name: sname}
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

# course = []
# columns = [:name] 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Course: number code? subject
 # "subjects": [
 #      {
 #        "id": "1161-4900",
 #        "segment": "2"
 #      },
 #      {
 #        "id": "1161-700",
 #        "segment": "3"
 #      },
 #      {
 #        "segment": "1",
 #        "id": "1161-2450"
 #      }
 #    ],
# Subject: name 
# Instructor: first middle(null) last 