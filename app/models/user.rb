class User < ActiveRecord::Base
  def ask(question)
    puts "Here's where we send an email asking:\n#{question.qtext}"
  end
end
