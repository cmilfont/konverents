class AddLocalToTrack < ActiveRecord::Migration
  def change
    add_column :tracks, :local, :string
  end
end
