# require 'activerecord-import'

instructor = []
columns = [:first, :middle, :last, :email, :bid]

instructor_file = File.read("db/instructor.json")
instructor_data = JSON.parse(instructor_file)

instructor_data.each do |data|
	bid = data['bid']
	first = data['first']
	middle = data['middle']||= ''
	last = data['last']
	email = data['email']||=''
	instructor << {first: first, middle: middle, last: last, email: email, bid: bid}
end

Instructor.import columns, instructor, validate: true

subject = []
columns = [:bid, :abbreviation, :name]

# missing sections 

subject_file = File.read("db/subject.json")
subject_data = JSON.parse(subject_file)

subject_data.each do |data|
	bid = data['bid']
	abbreviation = data['abbreviation']
	sname = data['name']
	subject << {bid: bid, abbreviation: abbreviation, name: sname}
end

Subject.import columns, subject, validate: true

course = []
columns = [:name, :code, :credits, :description, :independent_study]

course_file = File.read("db/course.json")
course_data = JSON.parse(course_file)

course_data.each do |data|
	cname = data[:name]  
	code = data[:code]
	credits = data[:credits]
	description = data[:description]
	independent_study = data[:independent_study]
	course << {name:cname, code:code, credits:credits, description:description, independent_study:independent_study}
end

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