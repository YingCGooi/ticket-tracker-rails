class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.references :ticket, foreign_key: true
    end
  end
end
