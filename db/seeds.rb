# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

["actinosphaerium", "adjoinedly", "adjutage", "afferent", "allemand", "aporia", "arrogancy", "attacher", "augurous", "campagna", "clingfish", "consecrater", "cragwork", "dividing", "drammock", "drubber", "drunken", "filchery", "gesan", "guardo", "hamiltonism", "imbibitional", "iwis", "lax", "macromania", "masjid", "metaboly", "misknow", "newsreel", "nonimporting", "obol", "palatality", "pelviotomy", "perezone", "puchanahua", "rancidly", "recherche", "reinsphere", "resurrectible", "shoulderer", "spirometry", "squillery", "strack", "subserrate", "umbellulidae", "unbesot", "uncontradictedly", "unqueried", "unsheriff", "worriment"].each do |word|
  Answer.create!(word: word)
end