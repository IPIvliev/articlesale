# encoding: utf-8

module UsersHelper
	def show_avatar(user)
		if user.avatar.blank?
			image_tag("/unnamed.jpg", :alt => user.username)
        else
            image_tag(user.avatar.url, :alt => user.username)
        end
    end
end
