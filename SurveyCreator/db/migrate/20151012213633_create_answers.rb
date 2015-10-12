class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer_content
      t.references :question, index: true

      t.timestamps null: false
    end
  end
end
