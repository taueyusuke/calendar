class ChangeDataConferenceroomnameToConferencerooms < ActiveRecord::Migration[5.2]
  def change
    change_column :conferencerooms, :conferenceroomname, :string
  end
end
