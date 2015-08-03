class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :qtext, null: false
      t.references :user, index: true
      t.boolean :public, null: false

      t.timestamps null: false
    end
    add_index :questions, :qtext
    add_foreign_key :questions, :users
  end
end
