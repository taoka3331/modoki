class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|

    t.references :user_id, null: false
    t.references :post_id, null: false
    t.timestamps
    end
  end
end
