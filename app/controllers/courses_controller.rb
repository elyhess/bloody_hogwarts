class CoursesController < ApplicationController
  def index
    @courses = Course.order_alphabetically
  end
end