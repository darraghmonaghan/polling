class CreateQuestionOptions < ActiveRecord::Migration
  def change
    create_table :question_options do |t|
      t.integer :question_id
      t.string :option
      t.integer :index

      t.timestamps null: false
    end
  end
end
