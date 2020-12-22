# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


student_1 = Student.create!(name: "Joe", age: 12, house: "house_1")
student_2 = Student.create!(name: "John", age: 11, house: "house_2")
student_3 = Student.create!(name: "Jake", age: 10, house: "house_3")
student_4 = Student.create!(name: "Josh", age: 10, house: "house_2")
student_5 = Student.create!(name: "Jordan", age: 11, house: "house_3")

course_1 = Course.create!(name: "course_1")
course_2 = Course.create!(name: "course_2")
course_3 = Course.create!(name: "course_3")

StudentCourse.create!(student: student_1, course: course_1)
StudentCourse.create!(student: student_2, course: course_1)
StudentCourse.create!(student: student_2, course: course_2)
StudentCourse.create!(student: student_2, course: course_3)
StudentCourse.create!(student: student_3, course: course_1)
StudentCourse.create!(student: student_4, course: course_2)
StudentCourse.create!(student: student_5, course: course_1)
StudentCourse.create!(student: student_5, course: course_3)