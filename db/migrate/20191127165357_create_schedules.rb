class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.datetime :starttime, null: false
      t.datetime :endtime, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.references :user, foreign_key: true, null: false
      t.references :conferenceroom, foreign_key: true, null: false

      t.timestamps
    end
  end
end
