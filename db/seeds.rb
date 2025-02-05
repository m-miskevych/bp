# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create exercises with translations
knee_flexion = Exercise.create(
  name_en: "Knee Flexion",
  name_sk: "Ohyb kolena",
  description_en: "Bending of the knee joint",
  description_sk: "Ohnutie kolenného kĺbu",
  repetition: 10,
  set: 3,
  images: [ Rails.root.join('app', 'assets', 'images', 'exercises', 'knee_flexion.jpg').open ]
)

knee_extention = Exercise.create(
  name_en: "Knee Extension",
  name_sk: "Natiahnutie kolena",
  description_en: "Extension of the knee joint",
  description_sk: "Natiahnutie kolenného kĺbu",
  repetition: 10,
  set: 2,
  images: [ Rails.root.join('app', 'assets', 'images', 'exercises', 'knee_flexion.jpg').open ]
)

hip_flexion = Exercise.create(
  name_en: "Hip Flexion",
  name_sk: "Ohyb bedrového kĺbu",
  description_en: "Flexion of the hip joint",
  description_sk: "Ohyb bedrového kĺbu",
  repetition: 15,
  set: 3,
  images: [
    Rails.root.join('app', 'assets', 'images', 'exercises', 'hip_flexion1.jpg').open,
    Rails.root.join('app', 'assets', 'images', 'exercises', 'hip_flexion2.jpg').open
  ]
)

hip_extention = Exercise.create(
  name_en: "Hip Extension",
  name_sk: "Natiahnutie bedrového kĺbu",
  description_en: "Extension of the hip joint",
  description_sk: "Natiahnutie bedrového kĺbu",
  repetition: 12,
  set: 2,
  images: [
    Rails.root.join('app', 'assets', 'images', 'exercises', 'hip_flexion1.jpg').open,
    Rails.root.join('app', 'assets', 'images', 'exercises', 'hip_flexion2.jpg').open
  ]
)

shoulder_rotation = Exercise.create(
  name_en: "Shoulder Rotation",
  name_sk: "Rotácia ramena",
  description_en: "Rotation of the shoulder joint in a circle",
  description_sk: "Rotácia ramenného kĺbu do kruhu",
  repetition: 15,
  set: 2,
  images: [
    Rails.root.join('app', 'assets', 'images', 'exercises', 'shoulder_rotation1.webp').open,
    Rails.root.join('app', 'assets', 'images', 'exercises', 'shoulder_rotation2.webp').open
  ]
)

shoulder_abduction = Exercise.create(
  name_en: "Shoulder Abduction",
  name_sk: "Abdukcia ramena",
  description_en: "Abduction of the shoulder joint",
  description_sk: "Abdukcia ramenného kĺbu",
  repetition: 12,
  set: 3,
  images: [
    Rails.root.join('app', 'assets', 'images', 'exercises', 'shoulder_abduction1.webp').open,
    Rails.root.join('app', 'assets', 'images', 'exercises', 'shoulder_abduction2.jpg').open
  ]
)

# Create plans with translations
knee_plan = Plan.create(
  name_sk: "Rehabilitačný program pre kolenný kĺb",
  name_en: "Rehabilitation Program for Knee Joint",
  description_sk: "Program pre rehabilitáciu kolenného kĺbu",
  description_en: "Program for rehabilitation of the knee joint"
)

shoulder_plan = Plan.create(
  name_sk: "Rehabilitačný program pre ramenný kĺb",
  name_en: "Rehabilitation Program for Shoulder Joint",
  description_sk: "Program pre rehabilitáciu ramenného kĺbu",
  description_en: "Program for rehabilitation of the shoulder joint"
)

# Create exercises in plans
[ knee_flexion, knee_extention, hip_flexion, hip_extention ].each do |exercise|
  ExercisesPlan.create(plan: knee_plan, exercise: exercise)
end

[ shoulder_abduction, shoulder_rotation, hip_flexion, hip_extention ].each do |exercise|
  ExercisesPlan.create(plan: shoulder_plan, exercise: exercise)
end
