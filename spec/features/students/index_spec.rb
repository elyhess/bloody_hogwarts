require "rails_helper"

describe "As a visitor" do
  describe "When I visit '/students'" do
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

    it "I see a list of students with the following information:" do
      visit students_path
      
      expect(page).to have_content("Students:")

      within("#student-#{@student_1.id}") do 
        expect(page).to have_content(@student_1.name)
        expect(page).to have_content("Age: #{@student_1.age}")
        expect(page).to have_content("House: #{@student_1.house}")
      end

      within("#student-#{@student_2.id}") do
        expect(page).to have_content(@student_2.name)
        expect(page).to have_content("Age: #{@student_2.age}")
        expect(page).to have_content("House: #{@student_2.house}") 
      end

      within("#student-#{@student_3.id}") do
        expect(page).to have_content(@student_3.name)
        expect(page).to have_content("Age: #{@student_3.age}")
        expect(page).to have_content("House: #{@student_3.house}") 
      end

      within("#student-#{@student_4.id}") do
        expect(page).to have_content(@student_4.name)
        expect(page).to have_content("Age: #{@student_4.age}")
        expect(page).to have_content("House: #{@student_4.house}") 
      end
      
      within("#student-#{@student_5.id}") do
        expect(page).to have_content(@student_5.name)
        expect(page).to have_content("Age: #{@student_5.age}")
        expect(page).to have_content("House: #{@student_5.house}") 
      end

    end
  end
end
