class RenameReceiverIdToReceiverid < ActiveRecord::Migration[5.1]
  def change
  	rename_column :messages, :receiver_id, :receiverid
  end
end
