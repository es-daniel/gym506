# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PreferredSchedule.create([ { schedule: 'Mañana' }, { schedule: 'Tarde' }, { schedule: 'Noche' }   ])
PreferredDay.create([ { day: 'Lunes' }, { day: 'Martes' },
                              { day: 'Miércoles' },{ day: 'Jueves' },
                              { day: 'Viernes' }, { day: 'Sábado' },
                              { day: 'Domingo' }  ])

User.create([
            { name: 'Daniel', last_name: 'Elizondo', email: 'danielelizondo12@gmail.com' , phone_number: 89026363,
                address: 'Carrillos Bajo', position: 'Administrador', role: :admin, password: 'gym506Admin' },
            { name: 'Nillo', last_name: 'Elizondo', email: 'danielelizondo@gmail.com' , phone_number: 88888888,
              weight: 60, height: 1.70,imc: 166, birthday: (DateTime.now - 20.years), identification: 11678975,
              address: 'Carrillos Bajo', password: 'gym506Partner', objectives: 'Masa Muscular',
              preferred_schedule_ids: [1,3], gender: :male, role: :partner, preferred_day_ids: [1,2,5] }
            ])
