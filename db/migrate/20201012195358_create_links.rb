class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :original_url
      t.string :lookup_code

      t.timestamps
    end
  end
end
