class QuestionSetSubscription < ActiveRecord::Base
  belongs_to :question_set
  belongs_to :user
end
