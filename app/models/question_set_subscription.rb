class QuestionSetSubscription < ActiveRecord::Base
  belongs_to :question_set
  belongs_to :user

  scope :due, -> { where("(last_ask_at + make_interval(secs := period)) <= NOW()") }
end
