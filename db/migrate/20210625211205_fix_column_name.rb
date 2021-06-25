class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :waypoints, :sentAt, :sent_at
  end
end
