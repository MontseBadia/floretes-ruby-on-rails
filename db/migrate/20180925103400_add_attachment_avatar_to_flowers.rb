class AddAttachmentAvatarToFlowers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :flowers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :flowers, :avatar
  end
end
