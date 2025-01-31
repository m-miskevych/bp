# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create exercises with translations
Exercise.create([
  { name_en: "Knee Flexion", name_sk: "Ohyb kolena", description_en: "Bending of the knee joint", description_sk: "Ohnutie kolenného kĺbu", repetition: 10, set: 3 },
  { name_en: "Shoulder Rotation", name_sk: "Rotácia ramena", description_en: "Rotation of the shoulder joint in a circle", description_sk: "Rotácia ramenného kĺbu do kruhu", repetition: 15, set: 2 },
  { name_en: "Core Stabilization", name_sk: "Stabilizácia stredu tela", description_en: "Stabilization of the core muscles", description_sk: "Stabilizácia svalov stredu tela", repetition: 20, set: 3 },
  { name_en: "Hip Extension", name_sk: "Natiahnutie bedrového kĺbu", description_en: "Extension of the hip joint", description_sk: "Natiahnutie bedrového kĺbu", repetition: 12, set: 2 },
  { name_en: "Flat Foot Mobilization", name_sk: "Mobilizácia plochej nohy", description_en: "Mobilization of the flat foot joint", description_sk: "Mobilizácia kĺbu plochej nohy", repetition: 15, set: 3 },
  { name_en: "Knee Extension", name_sk: "Natiahnutie kolena", description_en: "Extension of the knee joint", description_sk: "Natiahnutie kolenného kĺbu", repetition: 10, set: 2 },
  { name_en: "Shoulder Abduction", name_sk: "Abdukcia ramena", description_en: "Abduction of the shoulder joint", description_sk: "Abdukcia ramenného kĺbu", repetition: 12, set: 3 },
  { name_en: "Core Rotation", name_sk: "Rotácia stredu tela", description_en: "Rotation of the core muscles", description_sk: "Rotácia svalov stredu tela", repetition: 20, set: 2 },
  { name_en: "Hip Flexion", name_sk: "Ohyb bedrového kĺbu", description_en: "Flexion of the hip joint", description_sk: "Ohyb bedrového kĺbu", repetition: 15, set: 3 },
  { name_en: "Flat Foot Flexion", name_sk: "Ohyb plochej nohy", description_en: "Flexion of the flat foot joint", description_sk: "Ohyb kĺbu plochej nohy", repetition: 12, set: 2 }
])

# Create plans
Plan.create([
  { name: "Rehabilitation Program for Knee Joint", description: "Program for rehabilitation of the knee joint" },
  { name: "Rehabilitation Program for Shoulder Joint", description: "Program for rehabilitation of the shoulder joint" },
  { name: "Rehabilitation Program for Core Muscles", description: "Program for rehabilitation of the core muscles" },
  { name: "Rehabilitation Program for Hip Joint", description: "Program for rehabilitation of the hip joint" },
  { name: "Rehabilitation Program for Flat Foot Joint", description: "Program for rehabilitation of the flat foot joint" }
])

# Randomly assign exercises to plans
plans = Plan.all
exercises = Exercise.all

plans.each do |plan|
  exercises.sample(3).each do |exercise|
    ExercisesPlan.create(plan: plan, exercise: exercise)
  end
end
