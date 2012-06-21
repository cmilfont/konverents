class AddHourAndDescriptionToOccurrence < ActiveRecord::Migration
  def change
    add_column :occurrences, :hour, :time
    add_column :occurrences, :description, :string
  end
end
