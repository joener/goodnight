class CreateTimecards < ActiveRecord::Migration[6.0]
  def change
    create_table :timecards do |t|
      t.integer :user_id
      t.datetime :time_in
      t.datetime :time_out

      t.timestamps
    end
  end
end
