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
		# @question = QuestionOption.create(answer_option_params)
		redirect_to new_question_options_path
	end


  private

  def question_params
    params.require(:question).permit(:content)
  end

  # def answer_option_params
  #   params.require(:question_option).permit(:option)
  # end


end
