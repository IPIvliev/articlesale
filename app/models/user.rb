# encoding: utf-8

class User < ActiveRecord::Base

  include ActionView::Helpers::NumberHelper
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :nickname, :provider, :url, :username

  validates :role, :presence => true
  validates :username, :presence => true

  ROLES = %w[admin copy client]

  has_many :discussions, foreign_key: "user_id"
  has_many :users, through: :discussions
  has_many :reverse_discussions, foreign_key: "whom_id", class_name: "Discussion"
  has_many :whoms, through: :reverse_discussions

  has_many :messages, :through => :discussions
  has_many :newmessages, :through => :reverse_discussions

  has_many :projects
  has_many :orders, :through => :projects
  has_many :posts

  has_many :articles

  mount_uploader :avatar, AvatarUploader

  def speaking?(other_user)
    discussions.find_by_whom_id(other_user.id)
  end

  def speak!(other_user)
    discussions.create!(:whom_id => other_user.id)
  end

  def unfollow!(other_user)
    discussions.find_by_whom_id(other_user.id).destroy
  end

  def role?
    case role
      when "admin"
        "<strong class='red'>Администратор</strong>".html_safe
      when "copy"
        "<strong class='blue'>Копирайтер</strong>".html_safe
      when "client"
        "<strong class='yellow'>Заказчик</strong>".html_safe
    end
  end

  def money?
    if pocket.blank?
      return "0,00 руб."
    else
      number_to_currency( pocket, unit: "руб.", separator: ",", delimiter: "", format: "%n %u")
    end
  end

  #Все сообщения, где current_user отправитель или получатель
 # def mes
    #joined_tables = Message.joins(:discussions).joins(:whoms)
    #Message.where("user_id == ? OR whom == ?", id, id).uniq
  #end
end