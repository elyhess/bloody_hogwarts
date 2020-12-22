class StudentsController < ApplicationController
  def index
    @students = Student.order_alphabetically
  end

  def show
    @student = Student.find(params[:id])
  end
end