desc "This task is called by the Heroku scheduler add-on"
task :ask_questions => :environment do
  puts "Finding questions that are due to be asked..."
  to_be_asked = QuestionSetSubscription.due
  puts "There are #{to_be_asked.count} questions due."
  to_be_asked.each(&:ask_next_question)
  puts "Done."
end
