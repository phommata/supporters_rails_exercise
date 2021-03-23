class CreatePetitions < ActiveRecord::Migration[6.1]
  def change
    create_table :petitions do |t|
      t.string :starter_urn
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
