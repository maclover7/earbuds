class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|
      t.string :name
      t.text :about
      t.string :slug, unique: true

      t.timestamps
    end
  end
end
