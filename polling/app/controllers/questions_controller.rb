class QuestionsController < ApplicationController

	def index
		@all_questions = Question.all
		
		@unanswered_questions = []
		@unanswered_questions_id = []
		@answered_questions = []
		@voted_qs = []

		### FINDING VOTED QUESTIONS .... @voted_qs[] ###

		if current_user == true					### THINK SOMETHING WRONG WITH CURRENT USER LOGIC FLOW ###
			@user = current_user
			@user.id = current_user.id
			@ABC = @user.find_voted_items
			puts @ABC
			@user.find_voted_items.each do |a| 
				puts a
				@voted_qs.push(a.question_id)
			end
		end

		### FINDING ANSWERED QUESTIONS .... @answered_questions[] ###

		@all_questions.each do |b|
			if @voted_qs.include?(b.id) == true
				@answered_questions.push(b.id)
			end
		end

		### FINDING UNANSWERED QUESTIONS .... @unanswered_questions[] ###

		@all_questions.each do |c|
			if @answered_questions.include?(c.id) == false
				@unanswered_questions.push(c)
				@unanswered_questions_id.push(c.id)
			end
		end


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