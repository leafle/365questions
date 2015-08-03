class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :user, index: true
      t.references :question, index: true
      t.text :atext

      t.timestamps null: false
    end
    add_foreign_key :answers, :users
    add_foreign_key :answers, :questions
  end
end
