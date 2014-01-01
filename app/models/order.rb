class Order < ActiveRecord::Base
  attr_accessible :amount, :category_id, :description, :file, :finish_date, :keywords, :name, :pictures, :resolution, :status
end
