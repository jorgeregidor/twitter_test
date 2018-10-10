class ChangeNickToUnique < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :nick, :string, unique: true
  end
end
