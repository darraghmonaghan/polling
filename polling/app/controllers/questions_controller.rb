class QuestionsController < ApplicationController

	def index
		
		@all_questions = Question.all

		@answered_questions = []

		@user = current_user
		# @voted = @user.find_voted_items
		@user.find_voted_items.each do |a| 
			@answered_questions.push(a.question_id)
		end
		# @unanswered_questions = []

		# if current_user == true
		# 	@user = User.find(params[:id])
		#@ abc = User.where(:id => @user.id, :voted_for? => false)  ## Query the Question DB instead??
		# puts @user.find_voted_items
		# 	# @ABC = User.find(@user)
		# 	# @DEF = @ABC.find_voted_items
		# else
		# 	@questions = Question.all
		# end


		# @questions = User.where(:voted_for? => false) attempt???
	end

	def show
		@question_options = []
		@question = Question.find(params[:id])

		@question.question_options.each do |t|
			@question_options.push(t.option)
		end

		@array_of_arrays = []
		@question.question_options.each do |t|
			@array_of_arrays.push([t.option, t.get_upvotes.size])
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
		@question = Question.create(question_params)  # works fine
		if @question.save
			redirect_to root_path			
		else
			render :create
		end
	end

	private

	  def question_params
		params.require(:question).permit(:content, :user_id, question_options_attributes: [:option, :_destroy])
	  end

end