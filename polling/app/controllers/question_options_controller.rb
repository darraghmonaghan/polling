class QuestionOptionsController < ApplicationController

	def new
		@options = QuestionOption.new
	end



end
