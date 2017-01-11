class CreateTables < ActiveRecord::Migration
  def change
    create_table "customers" do |t|
      t.integer  "CustomerId",       limit: 8
      t.string   "Employees",        limit: 255
      t.string   "TwoYearSpend",     limit: 255
      t.string   "CarePlan",         limit: 255
    end

    add_index "customers", ["CustomerId"], name: "index_customers_on_CustomerId", using: :btree

    create_table "usages" do |t|
      t.integer  "CustomerId",       limit: 8
      t.string   "DateYM",           limit: 255
      t.string   "UsageType",        limit: 255
      t.integer   "HitCount",        limit: 4
      t.integer   "Duration",        limit: 4
    end

    add_index "usages", ["CustomerId"], name: "index_usages_on_CustomerId", using: :btree
  end
end
