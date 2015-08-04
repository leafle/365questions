class QuestionSet < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :questions

  def next_question(last_question_id)
    self.questions.where("id > ?", last_question_id || 0).order("id ASC").first
  end
end
