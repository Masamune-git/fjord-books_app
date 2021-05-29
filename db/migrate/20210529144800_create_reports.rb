class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :reports, :user_id, unique: true
  end
end
