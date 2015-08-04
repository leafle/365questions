class User < ActiveRecord::Base
  def ask(question)
    QuestionMailer.asker(self, question).deliver_now
  end
end
