class AddAttachmentPictureToEstimates < ActiveRecord::Migration
  def self.up
    change_table :estimates do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :estimates, :picture
  end
end
