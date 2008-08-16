class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
      t.string :last_name, :default => "", :null => false
      t.string :fore_name, :default => "", :null => false
      t.string :initials, :default => "", :null => false
      t.string :suffix, :default => "", :null => false
      t.string :collective_name, :default => "", :null => false
      t.integer :one_first, :default => 0, :null => false
      t.integer :one_last, :default => 0, :null => false
      t.integer :one_middle, :default => 0, :null => false
      t.integer :one_total, :default => 0, :null => false
      t.integer :five_first, :default => 0, :null => false
      t.integer :five_last, :default => 0, :null => false
      t.integer :five_middle, :default => 0, :null => false
      t.integer :five_total, :default => 0, :null => false
      t.integer :ten_first, :default => 0, :null => false
      t.integer :ten_last, :default => 0, :null => false
      t.integer :ten_middle, :default => 0, :null => false
      t.integer :ten_total, :default => 0, :null => false
      t.integer :all_first, :default => 0, :null => false
      t.integer :all_last, :default => 0, :null => false
      t.integer :all_middle, :default => 0, :null => false
      t.integer :all_total, :default => 0, :null => false
      t.integer :one_rank, :default => 0, :null => false
      t.integer :five_rank, :default => 0, :null => false
      t.integer :ten_rank, :default => 0, :null => false
      t.integer :all_rank, :default => 0, :null => false
    end
    add_index :authors, [:last_name, :initials]
    add_index :authors, :collective_name
    add_index :authors, :one_total
    add_index :authors, :five_total
    add_index :authors, :ten_total
    add_index :authors, :all_total
    add_index :authors, :one_rank
    add_index :authors, :five_rank
    add_index :authors, :ten_rank
    add_index :authors, :all_rank
  end

  def self.down
    drop_table :authors
  end
end