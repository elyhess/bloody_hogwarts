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

    it 'I see all courses listed in alphabetical order' do
      visit courses_path

      expect(@course_1.name).to appear_before(@course_2.name)
      expect(@course_2.name).to appear_before(@course_3.name)
    end

    it 'I also see all students for each class in alphabetical order' do
      visit courses_path

      within("#course-#{@course_1.id}") do
        expect(page).to have_content("Students:") 
        expect(all('.student')[0].text).to eq(@student_3.name)
        expect(all('.student')[1].text).to eq(@student_1.name)
        expect(all('.student')[2].text).to eq(@student_2.name)
        expect(all('.student')[3].text).to eq(@student_5.name)
      end

      within("#course-#{@course_2.id}") do
        expect(page).to have_content("Students:") 
        expect(all('.student')[0].text).to eq(@student_2.name)
        expect(all('.student')[1].text).to eq(@student_4.name)
      end

      within("#course-#{@course_3.id}") do
        expect(page).to have_content("Students:") 
        expect(all('.student')[0].text).to eq(@student_2.name)
        expect(all('.student')[1].text).to eq(@student_5.name)
      end
    end
  end
end