class User < ApplicationRecord
  
  validates :name, presence: true
  validates :name, length:{maximum:15}
  
  validates :email, presence: true
  validates :email, format:{ with: /\A[\w+-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :email, uniqueness: true
  
  validates :password, length:{minimum:8}
  validates :password, length:{maximum:32}
  validates :password, format:{ with: /\A[\w]+\z/}
  
  has_secure_password
  
  
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: "topic"
end
