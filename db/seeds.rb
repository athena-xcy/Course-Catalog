require 'json'

instructor = []
columns = [:first, :middle, :last]

instructor_file = File.read "db/instructor.json"
instructor_data = JSON.parse(instructor_file)

instructor_data.each do |data|
	first = data['first']
	middle = data['middle']||= ''
	last = data['last']
	instructor << {first: first, middle: middle, last: last}
end

Instructor.import instructor, columns, validate: true

 
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