# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    Patient.create( 
        name: "Andre",
        age: 22,
        phone: "0860573272",
        ailment:"test",
        status: "NA",
        user_id: 4,
        consultationType: "NA"
        )