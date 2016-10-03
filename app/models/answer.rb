class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :commments, as: :commentable
  has_many :votes, as: :votable

  validates_presence_of :answer_text
end
