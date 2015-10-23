class QuestionOptionsController < ApplicationController

	def new
		@options = QuestionOption.new
	end

	def create
		@option = QuestionOption.create(option_params)
		redirect_to root_path
	end



  private

  def option_params
    params.require(:question_option).permit(:option)  
  end


end
