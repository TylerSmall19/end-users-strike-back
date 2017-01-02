class Answer < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :author_id
  belongs_to :question
  has_many :votes, as: :votable

  validates :body, :question, :author, presence: true
end
