class CreateAnotherWebsiteLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :another_website_links do |t|
      t.references :user, null: false, foreign_key: true
      t.string :website
      t.string :url

      t.timestamps
    end
  end
end
