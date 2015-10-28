class User < ActiveRecord::Base

	has_secure_password

	has_many :questions
	has_many :user_inputs
	has_many :links

	def self.confirm(params)
        @user = User.find_by({email: params[:email]})
        @user.try(:authenticate, params[:password])
    end

end
