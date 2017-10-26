class SchoolCoursesController < ApplicationController
  before_action :authenticate_user!
  def index
    @courses = Course.order(:name).where("LOWER(name) ILIKE ?", "%#{params[:term].downcase}%")
      render json: @courses.map{|c| {label: c.name, value: c.name } }
    end
    # map{|c| {label: c.course_description, value: c.name } }
end
