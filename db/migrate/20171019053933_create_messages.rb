class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :content
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
