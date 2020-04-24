class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :number_of_likes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
