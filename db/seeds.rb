# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create exercises
Exercise.create([
  { name: "Knee Flexion", description: "Bending of the knee joint", repetition: 10, set: 3 },
  { name: "Shoulder Rotation", description: "Rotation of the shoulder joint in a circle", repetition: 15, set: 2 },
  { name: "Core Stabilization", description: "Stabilization of the core muscles", repetition: 20, set: 3 },
  { name: "Hip Extension", description: "Extension of the hip joint", repetition: 12, set: 2 },
  { name: "Flat Foot Mobilization", description: "Mobilization of the flat foot joint", repetition: 15, set: 3 },
  { name: "Knee Extension", description: "Extension of the knee joint", repetition: 10, set: 2 },
  { name: "Shoulder Abduction", description: "Abduction of the shoulder joint", repetition: 12, set: 3 },
  { name: "Core Rotation", description: "Rotation of the core muscles", repetition: 20, set: 2 },
  { name: "Hip Flexion", description: "Flexion of the hip joint", repetition: 15, set: 3 },
  { name: "Flat Foot Flexion", description: "Flexion of the flat foot joint", repetition: 12, set: 2 }
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
