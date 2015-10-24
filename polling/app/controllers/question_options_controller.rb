class QuestionOptionsController < ApplicationController

	def new
		@answer_options = QuestionOption.new
	end

	def create
		@answer_options = QuestionOption.create(option_params)
		redirect_to root_path
	end



  private

  def option_params
    params.require(:question_option).permit(:option)  
  end


end
