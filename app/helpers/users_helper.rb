module UsersHelper

	def client?
		current_user.status == 0
	end

	def copy?
		current_user.status == 1
	end

	def admin?
		current_user.status == 2
	end	
end
