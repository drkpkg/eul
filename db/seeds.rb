# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# t.string :name
# t.string :phone
# t.string :address

user_type = UserType.create(title: 'Administrador')
user_type = UserType.create(title: 'Cliente')

user = User.new(name: 'Cosme',
            lastname: 'Fulanito',
            document: '1232323',
            phone: '12345678',
            email: 'cosme@fulanito.com',
            password: '123456',
            user_type_id: user_type.id)
user.save

receiver = Receiver.new(name: 'Warrio colitas',
                        phone: '12345678',
                        address: 'Reino muy muy lejano')
receiver.save
puts receiver.errors.full_messages

packages = [
            [code: 'HmrNHzNdMl',
            fragility: 0,
            size: '10x30x12',
            weight: 3.5,
            value: 15.59,
            conveyance: 1,
            shipping_date: '06/11/2016',
            delivery_date: '07/11/2016',
            user_id: user.id,
            receiver_id: receiver.id]
           ]

packages.each do |package|
  Package.create(package)
end
