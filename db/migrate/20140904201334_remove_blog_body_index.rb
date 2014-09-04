class RemoveBlogBodyIndex < ActiveRecord::Migration
  def change
    remove_index :blogs, :body
  end
end
