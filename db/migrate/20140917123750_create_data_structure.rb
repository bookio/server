class CreateDataStructure < ActiveRecord::Migration
  def change

	
	  # These are extensions that must be enabled in order to support this database
	  enable_extension "plpgsql"
	
	  create_table "categories", force: true do |t|
	    t.string   "name"
	    t.text     "description",        default: "", null: false
	    t.datetime "created_at",                      null: false
	    t.datetime "updated_at",                      null: false
	    t.text     "image",              default: "", null: false
	    t.integer  "client_id"
	    t.integer  "available",          default: 1,  null: false
	    t.integer  "limit_availability", default: 0,  null: false
	    t.time     "limit_from"
	    t.time     "limit_to"
	  end
	
	  create_table "clients", force: true do |t|
	    t.string   "name"
	    t.datetime "created_at",              null: false
	    t.datetime "updated_at",              null: false
	    t.text     "logo",       default: "", null: false
	    t.string   "email",      default: "", null: false
	    t.string   "twitter",    default: "", null: false
	    t.string   "facebook",   default: "", null: false
	    t.string   "phone",      default: "", null: false
	    t.string   "address",    default: "", null: false
	    t.string   "www",        default: "", null: false
	  end
	
	  create_table "customers", force: true do |t|
	    t.text     "name"
	    t.datetime "created_at",              null: false
	    t.datetime "updated_at",              null: false
	    t.string   "phone",      default: "", null: false
	    t.string   "email",      default: "", null: false
	    t.string   "notes",      default: "", null: false
	    t.integer  "client_id"
	  end
	
	  create_table "groups", force: true do |t|
	    t.string   "name",       default: "", null: false
	    t.datetime "created_at",              null: false
	    t.datetime "updated_at",              null: false
	  end
	
	  create_table "icons", force: true do |t|
	    t.string   "tag"
	    t.string   "image"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
	  end
	
	  create_table "options", force: true do |t|
	    t.string   "name",        default: "", null: false
	    t.text     "description", default: "", null: false
	    t.datetime "created_at",               null: false
	    t.datetime "updated_at",               null: false
	    t.integer  "rental_id"
	    t.integer  "client_id"
	  end
	
	  create_table "rentals", force: true do |t|
	    t.text     "name"
	    t.text     "description"
	    t.datetime "created_at",                   null: false
	    t.datetime "updated_at",                   null: false
	    t.integer  "icon_id"
	    t.integer  "depth",       default: 1,      null: false
	    t.integer  "category_id"
	    t.integer  "available",   default: 1,      null: false
	    t.integer  "client_id"
	    t.binary   "data",        default: "null", null: false
	  end
	
	  create_table "reservations", force: true do |t|
	    t.integer  "rental_id"
	    t.integer  "customer_id"
	    t.datetime "begin_at"
	    t.datetime "end_at"
	    t.integer  "state"
	    t.datetime "created_at",              null: false
	    t.datetime "updated_at",              null: false
	    t.integer  "payed",       default: 0, null: false
	    t.integer  "delivered",   default: 0, null: false
	    t.integer  "transferred", default: 0, null: false
	    t.integer  "arrived",     default: 0, null: false
	    t.float    "price"
	    t.integer  "client_id"
	  end
	
	  create_table "scenes", force: true do |t|
	    t.string   "name"
	    t.binary   "content"
	    t.integer  "user_id"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
	  end
	
	  add_index "scenes", ["user_id"], name: "index_scenes_on_user_id", using: :btree
	
	  create_table "sessions", force: true do |t|
	    t.integer  "user_id"
	    t.string   "sid"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
	  end
	
	  add_index "sessions", ["sid"], name: "index_sessions_on_sid", using: :btree
	  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree
	
	  create_table "settings", force: true do |t|
	    t.string   "section"
	    t.string   "name"
	    t.binary   "value"
	    t.datetime "created_at", null: false
	    t.datetime "updated_at", null: false
	    t.integer  "client_id"
	  end
	
	  create_table "users", force: true do |t|
	    t.string   "email",         default: "", null: false
	    t.string   "password_hash"
	    t.string   "password_salt"
	    t.datetime "created_at",                 null: false
	    t.datetime "updated_at",                 null: false
	    t.string   "name",          default: "", null: false
	    t.integer  "client_id"
	    t.string   "username",      default: "", null: false
	    t.integer  "guest",         default: 0,  null: false
	  end



  end
end