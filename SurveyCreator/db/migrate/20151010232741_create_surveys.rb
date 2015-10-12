class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.integer :status, default: 1
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
