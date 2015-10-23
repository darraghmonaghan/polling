class CreateUserInputs < ActiveRecord::Migration
  def change
    create_table :user_inputs do |t|
      t.integer :question_option_id
      t.integer :user_id
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
