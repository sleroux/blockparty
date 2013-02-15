class CreateEmailNotifications < ActiveRecord::Migration
  def change
    create_table :email_notifications do |t|
      t.integer :type
      t.timestamps
    end
  end
end
