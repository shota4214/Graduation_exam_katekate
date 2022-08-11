class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.datetime "created_at", precision: 6, null: false
    end
  end
end
