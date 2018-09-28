class AddColumnToComments < ActiveRecord::Migration[5.2]
  def change
  	add_column :comments, :content, :string
  	add_column :comments, :replies_count, :integer
  	add_reference :comments, :user, index: true
  	add_reference :comments, :post, index: true
  	add_reference :comments, :parent, index: true
  end
end
