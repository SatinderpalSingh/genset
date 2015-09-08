# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150904071535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.text     "number"
    t.string   "ifsc"
    t.string   "micr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bill_tables", force: :cascade do |t|
    t.integer  "bill_id"
    t.float    "monthly_rent"
    t.string   "mail_sent"
    t.float    "third_party_payment"
    t.float    "owner_payment"
    t.integer  "quotation_id"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.string   "bank_name"
    t.string   "bank_branch"
    t.string   "gen_desc"
    t.string   "rate"
    t.string   "quantity"
    t.string   "service_tax"
    t.string   "surcharge"
    t.date     "date"
    t.string   "bill_no"
    t.decimal  "tds"
    t.decimal  "total"
    t.decimal  "pending_payment",                                  default: 0.0
    t.decimal  "total_exp"
    t.integer  "third_party_provider_id"
    t.decimal  "calc_stax",               precision: 10, scale: 2
    t.decimal  "calc_tds",                precision: 10, scale: 2
    t.decimal  "calc_surcharge",          precision: 10, scale: 2
    t.decimal  "calc_total",              precision: 10, scale: 2
  end

  add_index "bill_tables", ["quotation_id"], name: "index_bill_tables_on_quotation_id", using: :btree

  create_table "client_details", force: :cascade do |t|
    t.string   "designation"
    t.string   "bank_branch"
    t.text     "address"
    t.string   "district"
    t.integer  "contactNo",         limit: 8
    t.string   "emailID"
    t.boolean  "approved",                    default: false
    t.integer  "sender_details_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "mailStatus",                  default: false
    t.boolean  "contract",                    default: true
    t.integer  "bank_id"
    t.integer  "account_id"
    t.string   "name"
  end

  add_index "client_details", ["sender_details_id"], name: "index_client_details_on_sender_details_id", using: :btree

  create_table "client_gen_sets", force: :cascade do |t|
    t.decimal  "genRent",             precision: 10, scale: 2
    t.decimal  "monthlyTax",          precision: 10, scale: 2
    t.integer  "quotation_detail_id"
    t.integer  "client_detail_id"
    t.integer  "gen_avail_id"
    t.integer  "gaurd_detail_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.decimal  "serviceTax",          precision: 10, scale: 2
    t.decimal  "eduTax",              precision: 10, scale: 2
    t.integer  "third_party_gen_id"
    t.string   "approveDate"
    t.string   "approveMonth"
    t.string   "approveYear"
    t.decimal  "tds"
  end

  add_index "client_gen_sets", ["client_detail_id"], name: "index_client_gen_sets_on_client_detail_id", using: :btree
  add_index "client_gen_sets", ["gaurd_detail_id"], name: "index_client_gen_sets_on_gaurd_detail_id", using: :btree
  add_index "client_gen_sets", ["gen_avail_id"], name: "index_client_gen_sets_on_gen_avail_id", using: :btree
  add_index "client_gen_sets", ["quotation_detail_id"], name: "index_client_gen_sets_on_quotation_detail_id", using: :btree
  add_index "client_gen_sets", ["third_party_gen_id"], name: "index_client_gen_sets_on_third_party_gen_id", using: :btree

  create_table "custom_auto_increments", force: :cascade do |t|
    t.string   "counter_model_name"
    t.integer  "counter",            default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "custom_auto_increments", ["counter_model_name"], name: "index_custom_auto_increments_on_counter_model_name", using: :btree

  create_table "diesel_readings", force: :cascade do |t|
    t.integer  "remaining_fuel"
    t.integer  "added_fuel"
    t.integer  "client_gen_set_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "email_addresses", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fake_quotations", force: :cascade do |t|
    t.string   "companyName",        default: "Csiom Engineering"
    t.string   "serviceTax",         default: "Service Tax No. : APRPK1196BSD001"
    t.string   "companyTagLine",     default: "Providing Generator on Rent Basis & Allied Services "
    t.string   "headerMobileNumber", default: "87270 - 09500 <br /> 0161 - 2493500 <br /> 80540 - 70500"
    t.string   "companyAddressOne",  default: "# 1380, St. No. 31, Janta Nagar, Bhagwan Chowk"
    t.string   "companyAddressTwo",  default: "Near Public Health Center, Ludhiana-141003"
    t.string   "referenceNumber"
    t.text     "subject",            default: "Subject: Providing Automation Silent Generator on Monthly Rent Basis"
    t.string   "regard",             default: "With Regards,"
    t.text     "regardContent",      default: "On the captioned subject we are pleased to introduce ourselves as service provider in the field of Generator on monthly rent basis. It is for your kind consideration that we are providing the generator sets on monthly rent basis to the banks and other Govt. offices. We have proper infrastructure and staff to serve best to our customers. At present we proudly declare that we are serving many branches of :"
    t.string   "bankNameOne",        default: "Allahabad Bank:"
    t.string   "bankNameTwo",        default: "Gill, Pakhowal & Gujjarwal"
    t.string   "bankNameThree",      default: "Dugri, Tagore Nagar, Focal Point, Ferozepur Road, Bahadur Ke Road"
    t.string   "bankNameFour",       default: "Kalsi Nagar "
    t.string   "bankNameFive",       default: "Mandi Gobindgarh, Mullanpur Dakha, Khanna "
    t.text     "bankZoneOne",        default: "Mandi Ahmedgarh, Malerkotla, Patiala, Shiv Puri, Raj Guru Nagar, Pakhowal Road, Bagha Purana, Bathinda, Dugri Road, Focal Point, Haiobwal, IFB Cheema Chowk "
    t.text     "bankZoneTwo",        default: "Jalandher, Balachure, Rattewal, Batala, Nakodhar, Shanker, Patti, Dasuya, Shahkot, Raiya & Zonal Office Amritsar "
    t.text     "quotationLine",      default: "Through this letter, we are offering our services to bank. Our monthly rent is quoted as:"
    t.text     "quotationRateList",  default: "<li>Rs-7250.00 for 5.0 Kva</li><li>Rs-9500.00 for 7.5 Kva</li><li>Rs-11000.00 for 10.0 Kva</li><li>Rs-12500.00 for 12.5 Kva</li><li>Rs-13000.00 for 15 Kva</li><li>Rs-13500.00 for 20 Kva</li><li>Rs-17000.00 for 25.00 Kva</li><li>Rs-19500.00 for 31.05 Kva</li><li>Rs-21500.00 for 35.00 Kva</li><li>Rs-27000.00 for 40 Kva</li><li>Rs-29500.00 for 50 Kva</li><li>Rs-39500.00 for 62.5 Kva</li><li>Rs-43500.00 for 75.0 Ksva</li>"
    t.text     "contentPartOne",     default: "We shall increase 10% after two years. The rent will include repairs & maintenances and the cost of diesel. Space will be provided by you. Our generator sets will be soundproof & automatic. We shall install only the branded generator sets. If you want higher capacity generator then we may fulfill your demand. Above rates are for all seasons."
    t.text     "contentPartTwo",     default: "We hope you will consider our application and give an opportunity to serve your bank. We ensure you of our best service."
    t.string   "thankYou",           default: "Thanking You"
    t.string   "yoursTruly",         default: "Yours Truly"
    t.string   "nameOfCompany",      default: "For Amrit Engineers"
    t.string   "emailIdOne",         default: "ishnoorsingh@in.com"
    t.string   "emailIdTwo",         default: "jasvirsinghsond@gmail.com"
    t.string   "emailIdThree",       default: "amritengineers80@gmail.com"
    t.string   "emailIdFour",        default: "amritengineers@yahoo.in"
    t.string   "contactNumberOne",   default: "+91 98140-09500"
    t.string   "contactNumberTwo",   default: "+91 87270-09500"
    t.string   "contactNumberThree", default: "0161-2439500"
    t.string   "date",               default: "Dated : 01/09/2015",                                                                                                                                                                                                                                                                                                                                                                                                                    null: false
    t.integer  "client_details_id"
    t.integer  "sender_details_id"
    t.datetime "created_at",                                                                                                                                                                                                                                                                                                                                                                                                                                                           null: false
    t.datetime "updated_at",                                                                                                                                                                                                                                                                                                                                                                                                                                                           null: false
    t.boolean  "mailStatus"
    t.string   "dateOfMail"
  end

  add_index "fake_quotations", ["client_details_id"], name: "index_fake_quotations_on_client_details_id", using: :btree
  add_index "fake_quotations", ["sender_details_id"], name: "index_fake_quotations_on_sender_details_id", using: :btree

  create_table "gaurd_details", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.integer  "contactNo",     limit: 8
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.decimal  "monthlySalary",           precision: 10, scale: 2
  end

  create_table "gen_avails", force: :cascade do |t|
    t.string   "genID"
    t.boolean  "available",         default: false
    t.integer  "gen_detail_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "genConsumption"
    t.integer  "service_due_after"
  end

  add_index "gen_avails", ["gen_detail_id"], name: "index_gen_avails_on_gen_detail_id", using: :btree

  create_table "gen_details", force: :cascade do |t|
    t.string   "genType"
    t.decimal  "genRent",    precision: 10, scale: 2
    t.integer  "total_gen"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "gen_expenses", force: :cascade do |t|
    t.date     "date"
    t.string   "reading"
    t.string   "readingBy"
    t.string   "batteryStatus"
    t.string   "radiatorStatus"
    t.decimal  "dieselCharge"
    t.decimal  "otherExpenses"
    t.integer  "client_detail_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "serviced",         default: false
    t.boolean  "hour_meter_set",   default: false
  end

  add_index "gen_expenses", ["client_detail_id"], name: "index_gen_expenses_on_client_detail_id", using: :btree

  create_table "mercury_images", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quotation_details", force: :cascade do |t|
    t.string   "companyName",        default: "Amrit Engineering"
    t.string   "serviceTax",         default: "Service Tax No. : APRPK1196BSD001"
    t.string   "companyTagLine",     default: "Providing Generator on Rent Basis & Allied Services "
    t.string   "headerMobileNumber", default: "87270 - 09500 <br /> 0161 - 2493500 <br /> 80540 - 70500"
    t.string   "companyAddressOne",  default: "# 1380, St. No. 31, Janta Nagar, Bhagwan Chowk"
    t.string   "companyAddressTwo",  default: "Near Public Health Center, Ludhiana-141003"
    t.string   "referenceNumber"
    t.text     "subject",            default: "Subject: Providing Automation Silent Generator on Monthly Rent Basis"
    t.string   "regard",             default: "Madam / sir"
    t.text     "regardContent",      default: "We are involved in the business of providing automatic generator sets on monthly rental basis to Government as well as private sector banks. We have proper infrastructure and well trained staff to offer quality services to customers. At present, we are proudly serving several esteemed brands of banking sector such as:"
    t.string   "bankNameOne",        default: "Allahabad Bank:"
    t.string   "bankNameTwo",        default: "Gill, Pakhowal & Gujjarwal"
    t.string   "bankNameThree",      default: "Dugri, Tagore Nagar, Focal Point, Ferozepur Road, Bahadur Ke Road"
    t.string   "bankNameFour",       default: "Kalsi Nagar "
    t.string   "bankNameFive",       default: "Mandi Gobindgarh, Mullanpur Dakha, Khanna "
    t.text     "bankZoneOne",        default: "Mandi Ahmedgarh, Malerkotla, Patiala, Shiv Puri, Raj Guru Nagar, Pakhowal Road, Bagha Purana, Bathinda, Dugri Road, Focal Point, Haiobwal, IFB Cheema Chowk "
    t.text     "bankZoneTwo",        default: "Jalandher, Balachure, Rattewal, Batala, Nakodhar, Shanker, Patti, Dasuya, Shahkot, Raiya & Zonal Office Amritsar "
    t.text     "quotationLine",      default: "Through this business proposal, we are offering following generator sets at their corresponding monthly rent for your branch:"
    t.text     "quotationRateList",  default: "<li>Rs-7250.00 for 5.0 Kva</li><li>Rs-9500.00 for 7.5 Kva</li><li>Rs-11000.00 for 10.0 Kva</li><li>Rs-12500.00 for 12.5 Kva</li><li>Rs-13000.00 for 15 Kva</li><li>Rs-13500.00 for 20 Kva</li><li>Rs-17000.00 for 25.00 Kva</li><li>Rs-19500.00 for 31.05 Kva</li><li>Rs-21500.00 for 35.00 Kva</li><li>Rs-27000.00 for 40 Kva</li><li>Rs-29500.00 for 50 Kva</li><li>Rs-39500.00 for 62.5 Kva</li><li>Rs-43500.00 for 75.0 Kva</li>"
    t.text     "contentPartOne",     default: " Above mentioned rates are valid for all seasons.<br/><br/>\n                                            <div class='closing-part'>                                                                     \n                                              We install only branded generator sets that are soundproof and automatic. Kindly let us know in case you have demand for higher capacity generator    set. We will fulfil your all requirements.<br/><br/></div>                          \n                                              <div class='terms-conditions-heading'>Terms and Conditions</div>\n                                              <ul class='terms-conditions'>                                                                  \n                                                <li>Rent will be increased 10% after every two years.</li>            \n                                                <li>Rent will cover diesel, repair and maintenances costs.</li>       \n                                                <li>Space for installation of generator set will be provided by customer. </li>\n                                              </ul>"
    t.text     "contentPartTwo",     default: "We hope you will consider our application and give us an opportunity to serve your bank."
    t.string   "thankYou",           default: "Thanking You"
    t.string   "yoursTruly",         default: "Yours Truly"
    t.string   "nameOfCompany",      default: "For Amrit Engineers"
    t.string   "emailIdOne",         default: "ishnoorsingh@in.com"
    t.string   "emailIdTwo",         default: "jasvirsinghsond@gmail.com"
    t.string   "emailIdThree",       default: "amritengineers80@gmail.com"
    t.string   "emailIdFour",        default: "amritengineers@yahoo.in"
    t.string   "contactNumberOne",   default: "+91 98140-09500"
    t.string   "contactNumberTwo",   default: "+91 87270-09500"
    t.string   "contactNumberThree", default: "0161-2439500"
    t.string   "date",               default: "Dated : 01/09/2015",                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      null: false
    t.integer  "client_details_id"
    t.integer  "sender_details_id"
    t.datetime "created_at",                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             null: false
    t.datetime "updated_at",                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             null: false
    t.boolean  "mailStatus",         default: false
    t.string   "dateOfMail"
  end

  add_index "quotation_details", ["client_details_id"], name: "index_quotation_details_on_client_details_id", using: :btree
  add_index "quotation_details", ["sender_details_id"], name: "index_quotation_details_on_sender_details_id", using: :btree

  create_table "quotation_rents", force: :cascade do |t|
    t.integer  "client_detail_id"
    t.integer  "quotation_detail_id"
    t.string   "genType",             default: "5.00, 7.50, 10.00, 12.50, 15.00, 20.00, 25.00, 31.05, 35.00, 40.00, 50.00, 62.50, 75.00"
    t.string   "genRent",             default: "7250.00, 9500.00, 11000.00, 12500.00, 13000.00, 13500.00, 17000.00, 19500.00, 21500.00, 27000.00, 29500.00, 39500.00, 43500.00"
    t.datetime "created_at",                                                                                                                                                     null: false
    t.datetime "updated_at",                                                                                                                                                     null: false
  end

  add_index "quotation_rents", ["client_detail_id"], name: "index_quotation_rents_on_client_detail_id", using: :btree
  add_index "quotation_rents", ["quotation_detail_id"], name: "index_quotation_rents_on_quotation_detail_id", using: :btree

  create_table "sender_details", force: :cascade do |t|
    t.string   "name"
    t.string   "emailID"
    t.text     "address"
    t.integer  "contactNo",              limit: 8
    t.string   "signature_file_name"
    t.string   "signature_content_type"
    t.integer  "signature_file_size"
    t.datetime "signature_updated_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "quotationType"
  end

  create_table "service_hours", force: :cascade do |t|
    t.integer  "client_gen_set_id"
    t.string   "working_hours"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "taxes", force: :cascade do |t|
    t.string   "taxName",       limit: 15
    t.decimal  "taxPercentage",            precision: 10, scale: 2
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "third_party_gens", force: :cascade do |t|
    t.string   "genID"
    t.decimal  "genRent",                 precision: 10, scale: 2
    t.integer  "gen_detail_id"
    t.integer  "third_party_provider_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "GenDetail_id"
    t.decimal  "genConsumption",          precision: 10, scale: 2
    t.integer  "service_due_hours"
  end

  add_index "third_party_gens", ["GenDetail_id"], name: "index_third_party_gens_on_GenDetail_id", using: :btree
  add_index "third_party_gens", ["third_party_provider_id"], name: "index_third_party_gens_on_third_party_provider_id", using: :btree

  create_table "third_party_providers", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.integer  "contactNo",  limit: 8
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "bill_id"
    t.integer  "amount"
    t.date     "date"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "transaction_remarks"
    t.string   "payment_type"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "bill_tables", "third_party_providers"
  add_foreign_key "client_gen_sets", "client_details"
  add_foreign_key "client_gen_sets", "gaurd_details"
  add_foreign_key "client_gen_sets", "gen_avails"
  add_foreign_key "client_gen_sets", "quotation_details"
  add_foreign_key "client_gen_sets", "third_party_gens"
  add_foreign_key "diesel_readings", "client_gen_sets"
  add_foreign_key "gen_avails", "gen_details"
  add_foreign_key "gen_expenses", "client_details"
  add_foreign_key "quotation_rents", "client_details"
  add_foreign_key "quotation_rents", "quotation_details"
  add_foreign_key "third_party_gens", "third_party_providers"
end
