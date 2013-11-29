class CreateTextSearchExtension < ActiveRecord::Migration
  def up
    ActiveRecord::Base.connection.execute "CREATE EXTENSION IF NOT EXISTS pg_trgm"
  end

  def down
    ActiveRecord::Base.connection.execute "DROP EXTENSION IF EXISTS pg_trgm"
  end
end
