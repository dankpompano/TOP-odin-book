class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.string :body
      t.references :user
      t.timestamps
    end
  end
end
