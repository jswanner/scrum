class CreateSprints < ActiveRecord::Migration
  def self.up
    create_table :sprints do |t|
      t.column :number, :integer
      t.column :start_on, :date
      t.column :end_on, :date
    end
  end

  def self.down
    drop_table :sprints
  end
end
