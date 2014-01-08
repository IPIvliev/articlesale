# encoding: utf-8

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  attr_accessible :nickname, :provider, :url, :username

  ROLES = %w[admin copy client]

  has_many :discussions, foreign_key: "user_id"
  has_many :messages, :through => :discussions
  has_many :users, through: :discussions
  has_many :reverse_discussions, foreign_key: "whom_id", class_name:  "Discussion"
                            
  has_many :whoms, through: :reverse_discussions


  has_many :projects
  has_many :orders, :through => :projects
  has_many :posts


  def speaking?(other_user)
    discussions.find_by_whom_id(other_user.id)
  end

  def speak!(other_user)
    discussions.create!(:whom_id => other_user.id)
  end

  def unfollow!(other_user)
    discussions.find_by_whom_id(other_user.id).destroy
  end
end