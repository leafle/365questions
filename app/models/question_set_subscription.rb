class QuestionSetSubscription < ActiveRecord::Base
  belongs_to :question_set
  belongs_to :user

  scope :due, -> { where("last_ask_at IS NULL OR (last_ask_at + make_interval(secs := period)) <= NOW()") }

  def ask_next_question
    next_question = self.question_set.next_question(self.last_question_id)
    self.user.ask next_question
    self.update_attributes!(last_ask_at: Time.now.utc, last_question_id: next_question.id)
  end
end
