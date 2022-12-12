# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_14_020537) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asks", force: :cascade do |t|
    t.string "name"
    t.string "mail"
    t.string "dates"
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "car_id"
    t.string "estado", default: "PENDIENTE"
    t.integer "id_dueño"
  end

  create_table "asks_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "ask_id", null: false
    t.index ["ask_id", "user_id"], name: "index_asks_users_on_ask_id_and_user_id"
    t.index ["user_id", "ask_id"], name: "index_asks_users_on_user_id_and_ask_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "marca"
    t.string "modelo"
    t.integer "año"
    t.integer "precio"
    t.string "dueño"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "cars_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "car_id", null: false
    t.index ["car_id", "user_id"], name: "index_cars_users_on_car_id_and_user_id"
    t.index ["user_id", "car_id"], name: "index_cars_users_on_user_id_and_car_id"
  end

  create_table "comentarios", force: :cascade do |t|
    t.integer "numero"
    t.string "direccion"
    t.datetime "dia"
    t.integer "hora"
    t.string "indicacion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailboxer_conversation_opt_outs", id: :serial, force: :cascade do |t|
    t.string "unsubscriber_type"
    t.integer "unsubscriber_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id"
    t.index ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type"
  end

  create_table "mailboxer_conversations", id: :serial, force: :cascade do |t|
    t.string "subject", default: ""
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "mailboxer_notifications", id: :serial, force: :cascade do |t|
    t.string "type"
    t.text "body"
    t.string "subject", default: ""
    t.string "sender_type"
    t.integer "sender_id"
    t.integer "conversation_id"
    t.boolean "draft", default: false
    t.string "notification_code"
    t.string "notified_object_type"
    t.integer "notified_object_id"
    t.string "attachment"
    t.datetime "updated_at", precision: nil, null: false
    t.datetime "created_at", precision: nil, null: false
    t.boolean "global", default: false
    t.datetime "expires", precision: nil
    t.index ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id"
    t.index ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type"
    t.index ["notified_object_type", "notified_object_id"], name: "mailboxer_notifications_notified_object"
    t.index ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type"
    t.index ["type"], name: "index_mailboxer_notifications_on_type"
  end

  create_table "mailboxer_receipts", id: :serial, force: :cascade do |t|
    t.string "receiver_type"
    t.integer "receiver_id"
    t.integer "notification_id", null: false
    t.boolean "is_read", default: false
    t.boolean "trashed", default: false
    t.boolean "deleted", default: false
    t.string "mailbox_type", limit: 25
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "is_delivered", default: false
    t.string "delivery_method"
    t.string "message_id"
    t.index ["notification_id"], name: "index_mailboxer_receipts_on_notification_id"
    t.index ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type"
  end

  create_table "mensajes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "car_id", null: false
    t.string "contenido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_mensajes_on_car_id"
    t.index ["user_id"], name: "index_mensajes_on_user_id"
  end

  create_table "messages", id: :serial, force: :cascade do |t|
    t.string "topic"
    t.text "body"
    t.string "received_messageable_type"
    t.bigint "received_messageable_id"
    t.string "sent_messageable_type"
    t.bigint "sent_messageable_id"
    t.boolean "opened", default: false
    t.boolean "recipient_delete", default: false
    t.boolean "sender_delete", default: false
    t.datetime "created_at", precision: nil
    t.datetime "updated_at", precision: nil
    t.string "ancestry"
    t.boolean "recipient_permanent_delete", default: false
    t.boolean "sender_permanent_delete", default: false
    t.datetime "opened_at", precision: nil
    t.index ["ancestry"], name: "index_messages_on_ancestry"
    t.index ["received_messageable_id", "received_messageable_type"], name: "acts_as_messageable_received"
    t.index ["sent_messageable_id", "received_messageable_id"], name: "acts_as_messageable_ids"
    t.index ["sent_messageable_id", "sent_messageable_type"], name: "acts_as_messageable_sent"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "contenido"
    t.integer "calificacion"
    t.bigint "user_id", null: false
    t.bigint "car_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_reviews_on_car_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "mailboxer_conversation_opt_outs", "mailboxer_conversations", column: "conversation_id", name: "mb_opt_outs_on_conversations_id"
  add_foreign_key "mailboxer_notifications", "mailboxer_conversations", column: "conversation_id", name: "notifications_on_conversation_id"
  add_foreign_key "mailboxer_receipts", "mailboxer_notifications", column: "notification_id", name: "receipts_on_notification_id"
  add_foreign_key "mensajes", "cars"
  add_foreign_key "mensajes", "users"
  add_foreign_key "reviews", "cars"
  add_foreign_key "reviews", "users"
end
