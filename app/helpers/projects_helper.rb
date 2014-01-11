# encoding: utf-8

module ProjectsHelper

def price_is(amount)
	return 99 if amount <= 500
  	return 199 if amount <= 1200
  	return 299 if amount <= 2300
  	return 399 if amount > 2300
end

end