class AchievementsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_achievement, only: [:show, :edit, :update, :destroy]

  # GET /achievements
  # GET /achievements.json
  def index
    @achievements = @achievable.achievements.all
  end

  # GET /achievements/1
  # GET /achievements/1.json
  def show
  end

  # GET /achievements/new
  def new
    @achievement = @achievable.achievements.new
  end

  # GET /achievements/1/edit
  def edit
  end

  # POST /achievements
  # POST /achievements.json
  def create
    @achievement = @achievable.achievements.new(achievement_params)

    respond_to do |format|
      if @achievement.save
        format.html { redirect_to polymorphic_path([@achievable. Achievement]), notice: 'Achievement was successfully created.' }
        format.json { render :show, status: :created, location: @achievement }
        format.js { }
      else
        format.html { render :new }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # PATCH/PUT /achievements/1
  # PATCH/PUT /achievements/1.json
  def update
    @achievable = @achievement.achievable
    respond_to do |format|
      if @achievement.update(achievement_params)
        format.html {
          if @achievable.class == UserRegistration
            redirect_to polymorphic_path([@achievable.registration_klass, @achievable]), notice: 'Achievement was successfully updated.'
          elsif @achievable.class == RegistrationKlass
            redirect_to polymorphic_path([@achievable.school, @achievable]), notice: 'Achievement was successfully updated.'
          elsif @achievable.class == School || @achievable.class == User
            redirect_to polymorphic_path([@achievable]), notice: 'Achievement was successfully updated.'
          end
        }
        format.json { render :show, status: :ok, location: @achievement }
        format.js { }
      else
        format.html { render :edit }
        format.json { render json: @achievement.errors, status: :unprocessable_entity }
        format.js   { render layout: false, content_type: 'text/javascript' }
      end
    end
  end

  # DELETE /achievements/1
  # DELETE /achievements/1.json
  def destroy
    @achievable = @achievement.achievable
    @achievement.destroy
    respond_to do |format|
      format.html { redirect_to polymorphic_path([@achievable. Achievement]), notice: 'Achievement was successfully destroyed.' }
      format.json { head :no_content }
      format.js { }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievement
      @achievement = Achievement.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def achievement_params
      params.require(:achievement).permit(:title, :description, :date, :slug)
    end
end
