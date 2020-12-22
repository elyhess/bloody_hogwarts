require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/courses'" do
    before :each do
      @student_1 = Student.create!(name: "Joe", age: 12, house: "house_1")
      @student_2 = Student.create!(name: "John", age: 11, house: "house_2")
      @student_3 = Student.create!(name: "Jake", age: 10, house: "house_3")
      @student_4 = Student.create!(name: "Josh", age: 10, house: "house_2")
      @student_5 = Student.create!(name: "Jordan", age: 11, house: "house_3")

      @course_1 = Course.create!(name: "course_1")
      @course_2 = Course.create!(name: "course_2")
      @course_3 = Course.create!(name: "course_3")

      StudentCourse.create!(student: @student_1, course: @course_1)
      StudentCourse.create!(student: @student_2, course: @course_1)
      StudentCourse.create!(student: @student_2, course: @course_2)
      StudentCourse.create!(student: @student_2, course: @course_3)
      StudentCourse.create!(student: @student_3, course: @course_1)
      StudentCourse.create!(student: @student_4, course: @course_2)
      StudentCourse.create!(student: @student_5, course: @course_1)
      StudentCourse.create!(student: @student_5, course: @course_3)
    end

    it 'I see a list of courses and the number of students enrolled in each course.' do
      visit courses_path

      expect(page).to have_content("All Courses:")
      expect(page).to have_content("#{@course_1.name} has #{@course_1.students.count} students")
      expect(page).to have_content("#{@course_2.name} has #{@course_2.students.count} students")
      expect(page).to have_content("#{@course_3.name} has #{@course_3.students.count} students")
    end
  end
end