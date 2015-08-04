class QuestionMailer < ApplicationMailer
  def asker(user, question)
    @user, @question = user, question
    mail(to: user.email, subject: "Your daily question")
  end
end
