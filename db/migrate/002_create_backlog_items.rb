class CreateBacklogItems < ActiveRecord::Migration
  def self.up
    create_table :backlog_items do |t|
      t.column :title, :string
      t.column :estimate, :integer
      t.column :position, :integer
      t.column :type, :string
      t.column :project_id, :integer
      t.column :product_backlog_item_id, :integer
    end
  end

  def self.down
    drop_table :backlog_items
  end
end
