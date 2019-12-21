class CreateFeelings < ActiveRecord::Migration[5.2]
  def change
    create_table :feelings do |t|
      t.string :feeling
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
