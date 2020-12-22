require 'rails_helper'

RSpec.describe Student, type: :model do
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

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'Class Methods' do
    it '::student_count' do
      expect(Student.student_count).to eq(5)
    end
  end

end
