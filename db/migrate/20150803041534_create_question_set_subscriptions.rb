class CreateQuestionSetSubscriptions < ActiveRecord::Migration
  def change
    create_table :question_set_subscriptions do |t|
      t.references :question_set, index: true
      t.references :user, index: true
      t.integer :period
      t.timestamp :last_ask_at
      t.integer :last_question_id

      t.timestamps null: false
    end
    add_foreign_key :question_set_subscriptions, :question_sets
    add_foreign_key :question_set_subscriptions, :users
  end
end
