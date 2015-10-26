class QuestionsController < ApplicationController

	def index
		@questions = Question.all
		render :index
	end

	def new
		@question = Question.new
		4.times do 
           answer_option = @question.question_option.build
        end
	end

	def create
		@question = Question.create(question_params)
		puts @question


		# question_option = @question.question_option.build
		# @question_options = QuestionOption.create(answer_option_params)
		# @question_options.question_id = @question.id
		redirect_to root_path
	end

	private

	  def question_params
	    params.require(:question).permit(:content, question_option_attributes: [:option])
	  end

	  # def question_option_params
	  #   params.require(:question_option).permit(:option)
	  # end

end


