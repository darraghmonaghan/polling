class User < ActiveRecord::Base

	has_secure_password

	has_many :question
	has_many :user_input

	def self.confirm(params)
        @user = User.find_by({email: params[:email]})
        @user.try(:authenticate, params[:password])
    end

end
