# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Book.create( inout: 1, category: "給料", year: 2020, month: 7, amount: 30) 
Book.create( inout: 2, category: "家賃", year: 2020, month: 7, amount: 8) 
Book.create( inout: 2, category: "食費", year: 2020, month: 7, amount: 6) 
Book.create( inout: 2, category: "光熱費・水道", year: 2020, month: 7, amount: 3) 
Book.create( inout: 2, category: "保険", year: 2020, month: 7, amount: 2)
