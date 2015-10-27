class QuestionOptionsController < ApplicationController

	def new
		@answer_options = QuestionOption.new
	end

	def create
		@answer_options = QuestionOption.create(option_params)
		puts @answer_options
		redirect_to root_path
	end

	def upvote 
		  @question_option = QuestionOption.find(params[:format])
		  @question_option.upvote_by current_user
		  redirect_to :back
	end 

  private

  def option_params
    params.require(:question_option).permit(:id, :option, :_destroy)  
  end


end
