class CreateQuestionSets < ActiveRecord::Migration
  def change
    create_table :question_sets do |t|
      t.references :user, index: true
      t.boolean :public

      t.timestamps null: false
    end
    add_foreign_key :question_sets, :users

    create_join_table :question_sets, :questions do |t|
      t.index :question_set_id
      t.index :question_id
    end
  end
end
