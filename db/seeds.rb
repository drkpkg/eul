# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

adm = User.new(name: 'Admin',
            lastname: 'Fulanito',
            document: '4232883',
            phone: '12340987',
            email: 'admin@fulanito.com',
            password: '123456',
            user_type: 0,
            office_id: 1)
adm.save

employee = User.new(name: 'Javier',
            lastname: 'Fulanito',
            document: '1232322',
            phone: '12345648',
            email: 'javier@fulanito.com',
            password: '123456',
            user_type: 1,
            office_id: 1)
employee.save

client = User.new(name: 'Cosme',
            lastname: 'Fulanito',
            document: '1232323',
            phone: '12345678',
            email: 'cosme@fulanito.com',
            password: '123456',
            user_type: 2,
            office_id: 1)
client.save

receivers = [{"name":"Felix Daniel Coca","phone":"03999392","address":"Clayton","lat":"37.940419626371835","lon":"-121.93587183952332"},
            {"name":"Hello Inc.","phone":"8291289","address":"Tomsk","lat":"56.48923778180732","lon":"84.95302677154541"}]

receivers.each do |r|
  Receiver.create(r)
end

offices = [
  [lat: -17.786566518254055, lon: -63.18745851516724, description: "Oficina principal"],
  [lat: -17.371610024104744, lon: -63.28674316406249, description: "Oficina Montero"],
  [lat: 60.93991814536288, lon: 76.55695080757141,	description: "Oficina Tomsk"],
  [lat: -18.145851771694467, lon: -65.9619140625,	description: "Oficina Santa Cruz de la sierra"],
  [lat: 38.634639869944, lon: -90.31676888465881,	description: "Oficina Clayton"]
]

offices.each do |course|
  Office.create(course)
end

# courses = [[route:{'r' => ["","3","5"]},express:false,title:"Estados unidos - Rusia"],
#           [route: {'r' => ["","1","4"]},express:false,title:"Santa Cruz - Oruro"],
#           [route: {'r' => ["","1","5"]},express:true,title:"Santa cruz"]]
#
# courses.each do |course|
#   c = Course.new(course)
#   c.save
#   puts c.errors.full_messages
# end

# packages = [{"code":"EwTEuBtdNUriAuEtYk","state":1,"fragility":true,"size":"11x4x14","weight":1200.0,"value":67.79,"conveyance":2,"shipping_date":"2016-12-16","delivery_date":"2016-12-17","observations":"","user_id":3,"receiver_id":1,"checked_in":[], course_id: 1},
# {"code":"RBT4iNtBATgiatXtk","state":3,"fragility":false,"size":"10x10x14","weight":500.0,"value":12.43,"conveyance":2,"shipping_date":"2016-12-15","delivery_date":"2016-12-19","observations":"","user_id":3,"receiver_id":2,"checked_in":["3","5"]}, course_id: 2]
#
# packages.each do |pkg|
#   Package.create(pkg)
# end
