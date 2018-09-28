class AddIntoroduceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :intoroduce, :string
  end
end
