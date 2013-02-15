class CreateBlockListServersMailServersJoinTable < ActiveRecord::Migration
  def up
    create_table :block_list_servers_mail_servers, :id => false do |t|
      t.integer :mail_server_id
      t.integer :block_list_server_id
    end
  end

  def down
    drop_table :block_list_servers_mail_servers
  end
end
