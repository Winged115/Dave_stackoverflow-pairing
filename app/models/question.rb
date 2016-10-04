class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :tagged_question

  def question_tags
    tags.split(' ', 5)
  end

end
