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

ActiveRecord::Schema.define(version: 2021_03_11_173548) do

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.integer "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "aulas", force: :cascade do |t|
    t.integer "aula"
    t.string "conteudo"
    t.string "video"
    t.integer "disciplina_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "data"
    t.index ["disciplina_id"], name: "index_aulas_on_disciplina_id"
  end

  create_table "avaliacaos", force: :cascade do |t|
    t.string "name"
    t.integer "n"
    t.string "nota"
    t.integer "disciplina_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["disciplina_id"], name: "index_avaliacaos_on_disciplina_id"
  end

  create_table "calendars", force: :cascade do |t|
    t.integer "disciplina_id", null: false
    t.date "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["disciplina_id"], name: "index_calendars_on_disciplina_id"
  end

  create_table "diarios", force: :cascade do |t|
    t.integer "disciplina_id", null: false
    t.integer "n"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["disciplina_id"], name: "index_diarios_on_disciplina_id"
  end

  create_table "disciplinas", force: :cascade do |t|
    t.string "name"
    t.integer "professor"
    t.integer "serie"
    t.integer "turma"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "forums", force: :cascade do |t|
    t.string "aluno"
    t.string "topico"
    t.integer "disciplina_id", null: false
    t.integer "aula_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["aula_id"], name: "index_forums_on_aula_id"
    t.index ["disciplina_id"], name: "index_forums_on_disciplina_id"
  end

  create_table "options", force: :cascade do |t|
    t.integer "prova_id", null: false
    t.string "name"
    t.integer "tipo"
    t.boolean "correta"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prova_id"], name: "index_options_on_prova_id"
  end

  create_table "provas", force: :cascade do |t|
    t.integer "disciplina_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["disciplina_id"], name: "index_provas_on_disciplina_id"
  end

  create_table "responders", force: :cascade do |t|
    t.integer "forum_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["forum_id"], name: "index_responders_on_forum_id"
  end

  create_table "respostas", force: :cascade do |t|
    t.integer "avaliacao_id", null: false
    t.integer "disciplina_id", null: false
    t.integer "prova_id", null: false
    t.string "respondido"
    t.boolean "certa"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["avaliacao_id"], name: "index_respostas_on_avaliacao_id"
    t.index ["disciplina_id"], name: "index_respostas_on_disciplina_id"
    t.index ["prova_id"], name: "index_respostas_on_prova_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "aulas", "disciplinas"
  add_foreign_key "avaliacaos", "disciplinas"
  add_foreign_key "calendars", "disciplinas"
  add_foreign_key "diarios", "disciplinas"
  add_foreign_key "forums", "aulas"
  add_foreign_key "forums", "disciplinas"
  add_foreign_key "options", "provas"
  add_foreign_key "provas", "disciplinas"
  add_foreign_key "responders", "forums"
  add_foreign_key "respostas", "avaliacaos"
  add_foreign_key "respostas", "disciplinas"
  add_foreign_key "respostas", "provas"
end
