class QuestionsController < ApplicationController

	def index
		@questions = Question.all
		# @questions = []
		# questions.each do |q|
		# 	if q.content
		# 		@questions.push(q)
		# 	end
		# end
	end

	def show
		@question_options = []
		@question = Question.find(params[:id])

		@question.question_options.each do |t|
			@question_options.push(t.option)
		end

		@xyz = []
		@question.question_options.each do |t|
			@xyz.push([t.option, t.get_upvotes.size])
		end
	end

	def new
		@question = Question.new
		@question_option = QuestionOption.new
		4.times do 
           answer_option = @question.question_options.build
        end
	end

	def create
		# byebug
		@question = Question.create(question_params)
		# puts @question


		# question_option = @question.question_option.build
		# @question_options = QuestionOption.create(answer_option_params)
		# @question_options.question_id = @question.id
		redirect_to root_path
	end

	private

	  def question_params
		params.require(:question).permit(:content, question_options_attributes: [:option, :_destroy])
	    # params.require(:question).permit(question_attributes:[question_attributes: [:content], question_option_attributes: [:option, :_destroy]])
	  	# params.require(:question).permit!
	  	# params.require(:question_option).permit(:content, :question_option, :option, :_destroy)
	  end

	  # def question_option_params
	  #   params.require(:question).permit(:option)
	  # end

end


