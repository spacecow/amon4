class CreatePages < ActiveRecord::Migration

  def up
    create_table :pages do |t|
      t.string :menu, null:false
    end
    execute "ALTER TABLE pages ADD CONSTRAINT menu_cannot_be_blank CHECK (char_length(menu) <> 0)"
  end

  def down
    drop_table :pages
  end

end
