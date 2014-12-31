class AddHeroToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :hero, :string
  end
end
