class QuestionsController < ApplicationController

	def index
		@questions = Question.all
		render :index
	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.create(question_params)
	end


  private

  def question_params
    params.require(:performer).permit(:user_id, :performer_name, :performer_email, :city, :category_id, :subcategory, :hourly_rate, :description, :perfavatar, :image1, :image2, :image3, :video1, :video2, :video3)
  end



end
