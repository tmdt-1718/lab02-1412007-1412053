class AddSeentimeToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :seentime, :datetime
  end
end
