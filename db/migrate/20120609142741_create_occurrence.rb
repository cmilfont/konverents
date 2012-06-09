class CreateOccurrence < ActiveRecord::Migration
  def up
    create_table :occurrences do |t|
      t.belongs_to :track
      t.timestamps
    end
    
  end

  def down
    drop_table :occurrences
  end
end
