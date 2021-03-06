class AddAuthorPostAssociationAndRemoveAuthorNameFromPosts < ActiveRecord::Migration
  #def change
    #add_column :posts, :author_id, :integer
    #remove_column :posts, :author_name
  #end
  def up
    add_column :posts, :author_id, :integer
    remove_column :posts, :author_name
    add_index :posts, :author_id
  end
  def down
    remove_column :posts, :author_id
    add_column :posts, :author_name, :string
  end
end
