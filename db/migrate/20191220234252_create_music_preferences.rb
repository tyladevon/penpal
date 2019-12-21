class CreateMusicPreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :music_preferences do |t|
      t.boolean :rock, default: false
      t.boolean :rnb_soul, default: false
      t.boolean :folk_indie, default: false
      t.string :custom
      t.string :custom2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
