class Post < ActiveRecord::Base
  attr_accessible :category_id, :finish, :name, :order_id, :price, :text, :user_id

  belongs_to :order
  belongs_to :user
  belongs_to :category

  def sale
    if !text.nil?
    	return 99 if text.gsub(/\s+/, '').length <= 500
    	return 199 if text.gsub(/\s+/, '').length <= 1200
    	return 299 if text.gsub(/\s+/, '').length <= 2300
    	return 399 if text.gsub(/\s+/, '').length <= 4400
    else
      return 0 if text.nil?
    end
  end

end
