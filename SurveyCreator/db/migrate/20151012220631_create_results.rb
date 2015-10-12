class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :survey, index: true, foreign_key: true
      t.string :index
      t.string :new
      t.string :create

      t.timestamps null: false
    end
  end
end
