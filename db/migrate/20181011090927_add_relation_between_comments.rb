class AddRelationBetweenComments < ActiveRecord::Migration[5.2]
  def change
  	add_reference :comments, :parent, foreign_key: {to_table: :users}
  end
end
