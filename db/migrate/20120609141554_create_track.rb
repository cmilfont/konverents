class CreateTrack < ActiveRecord::Migration
  def up
    create_table :tracks do |t|
      t.string :title
      t.date :date
      t.belongs_to :event
      t.timestamps
    end
  end

  def down
    drop_table :tracks
  end
end
