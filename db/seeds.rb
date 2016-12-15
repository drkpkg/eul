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

# packages = [
#             {code: 'HmrNHzNdMl',
#             fragility: true,
#             size: '10x30x12',
#             weight: 3.5,
#             value: 15.59,
#             conveyance: 1,
#             shipping_date: '06/11/2016',
#             delivery_date: '07/11/2016',
#             user_id: client.id,
#             receiver_id: .id}
#            ]

# packages.each do |package|
#   pkg = Package.new(package)
#   pkg.save
#   puts pkg.errors.full_messages
# end

courses = [
  {lat: -17.786566518254055, lon: -63.18745851516724, description: "Oficina principal"},
  {lat: -17.371610024104744, lon: -63.28674316406249, description: "Oficina Montero"},
  {lat: 60.93991814536288, lon: 76.55695080757141,	description: "Oficina Tomsk"},
  {lat: -18.145851771694467, lon: -65.9619140625,	description: "Oficina Santa Cruz de la sierra"},
  {lat: 38.634639869944, lon: -90.31676888465881,	description: "Oficina Clayton"}
]

courses.each do |course|
  Office.create(course)
end
