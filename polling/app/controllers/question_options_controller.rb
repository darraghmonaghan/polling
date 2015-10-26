class QuestionOptionsController < ApplicationController

	def new
		@answer_options = QuestionOption.new
	end

	def create
		@answer_options = QuestionOption.create(option_params)
		puts @answer_options
		redirect_to root_path
	end

  private

  def option_params
    params.require(:question_option).permit(:option, :_destroy)  
  end


end
