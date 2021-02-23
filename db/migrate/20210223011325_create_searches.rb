class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :website
      t.string :status
      t.datetime :date
      
      t.timestamps
    end
  end
end
