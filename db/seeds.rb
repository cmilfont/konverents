# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create :email => "cmilfont@gmail.com", :password => "testes"

puts "Cadastrando evento"
event = Event.create(:title => "CEJS Conference 2012", :user => user)
puts "    Evento #{event.id} - #{event.title} cadastrado"


puts "Cadastrando tracks"


track1 = Track.create :title => "Dia 09", 
                      :date => "2012-11-09", 
                      :event => event, 
                      :local => "Faculdade 7 de Setembro"
puts "    Track #{track1.id} - #{track1.title} cadastrado"

track2 = Track.create :title => "Dia 10", 
                      :date => "2012-11-10", 
                      :event => event, 
                      :local => "Faculdade 7 de Setembro"
puts "    Track #{track2.id} - #{track2.title} cadastrado"