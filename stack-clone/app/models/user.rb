class User < ActiveRecord::Base
  has_many :votes, foreign_key: :voter_id
  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id

  validates :name, :username, presence: true
  validates :username, uniqueness: true

  has_secure_password
end
