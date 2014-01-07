# encoding: utf-8

class Order < ActiveRecord::Base
  attr_accessible :amount, :category_id, :description, :file, :finish_date, :keywords, :name, :pictures, :resolution, :status

  belongs_to :project
  belongs_to :user
  has_one :post

  def complite?
  	return "Статья одобрена" if status == 4
  	return "Статья ждёт одобрения" if status == 3
  	return "Статья в работе" if status == 2
  	return "Статья в ожидании разработчика" if status == 0
  	return "Статья на корректировке" if status == 1
  end

  def resolut?
    return "1024*600" if resolution == 4
    return "800*600" if resolution == 3
    return "640*480" if resolution == 2
    return "320*240" if resolution == 1
  end  
end