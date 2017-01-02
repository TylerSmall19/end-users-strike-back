class Question < ActiveRecord::Base
  has_many :answers
  has_many :votes, as: :votable

  belongs_to :author, class_name: "User"

  validates :title, :author, :question, presence: true

  def vote_count
    votes.where(up_vote: true).count - votes.where(up_vote: false).count
  end
end
