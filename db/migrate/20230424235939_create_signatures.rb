class CreateSignatures < ActiveRecord::Migration[7.0]
  def change
    create_table :signatures do |t|
      t.string :name
      t.string :location
      t.string :reason
      t.string :file_path
      t.timestamps
    end
  end
end
