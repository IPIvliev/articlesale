# encoding: utf-8

module ProjectsHelper

	def price_is(amount)
		return 99 if amount <= 500
	  	return 199 if amount <= 1200
	  	return 299 if amount <= 2300
	  	return 399 if amount > 2300
	end

	def percentage(post)
		if !post.text.nil?
			@a = post.text.gsub(/\s+/, '').length.to_f
			@b = post.order.amount.to_f
			return number_to_percentage(@a/(@b/100.to_f), precision: 0)
		else
			0
		end
	end
end