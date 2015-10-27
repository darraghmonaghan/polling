class Question < ActiveRecord::Base

	belongs_to :user
	has_many :user_inputs
	has_many :question_options, dependent: :destroy

	accepts_nested_attributes_for :question_options, :reject_if => lambda { |a| a[:option].blank? }, :allow_destroy => true

	def options
		question_options
	end

end
