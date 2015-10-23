class Question < ActiveRecord::Base

	belongs_to :user
	has_many :user_input
	has_many :question_option

	accepts_nested_attributes_for :question_option

end
