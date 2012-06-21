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

puts "Cadastrando Occurrences"

occurrence1 = Occurrence.create :hour => "10:00", :description => "Palestra do @fnando", :track => track1
occurrence2 = Occurrence.create :hour => "10:00", :description => "Palestra do @franzejr", :track => track1