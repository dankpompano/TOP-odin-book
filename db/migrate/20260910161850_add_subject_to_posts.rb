class AddSubjectToPosts < ActiveRecord::Migration[8.1]
  def change
    add_column :posts, :subject, :string
  end
end
