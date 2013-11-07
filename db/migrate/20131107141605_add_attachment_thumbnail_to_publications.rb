class AddAttachmentThumbnailToPublications < ActiveRecord::Migration
  def self.up
    change_table :publications do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    drop_attached_file :publications, :thumbnail
  end
end
