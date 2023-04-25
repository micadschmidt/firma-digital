class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.binary :pdf_file

      t.timestamps
    end
  end
end
