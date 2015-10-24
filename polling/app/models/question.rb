class Question < ActiveRecord::Base

	belongs_to :user
	has_many :user_input # plural!!!
	has_many :question_option #plural!!!!

	accepts_nested_attributes_for :question_option

	# def self.fancy_create params
	# 	option_params = params[:question_option]
	# 	params.delete(:question_option)
	# 	q = create(params)
	# 	q.question_option.create(option_params)
	# 	q
	# end

end
