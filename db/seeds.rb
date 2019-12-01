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
              address: 'Carrillos Bajo', password: 'gym506Partner', objectives: 'Masa Muscular', status: :without_defaulter,
              preferred_schedule_ids: [1,3], gender: :male, role: :partner, preferred_day_ids: [1,2,5] }
            ])

UserExercise.create(user: User.last, name: 'Remo con mancuerna', series: 3, repetitions: '8-12', user_rest: '60 s', preferred_day_id: 1)
UserExercise.create(user: User.last, name: 'Remo con mancuerna 2', series: 3, repetitions: '8-12', user_rest: '60 s', preferred_day_id: 1)
UserExercise.create(user: User.last, name: 'Remo con mancuerna 3', series: 3, repetitions: '8-12', user_rest: '60 s', preferred_day_id: 2)
UserExercise.create(user: User.last, name: 'Remo con mancuerna 4', series: 3, repetitions: '8-10', user_rest: '60 s', preferred_day_id: 2)

GymService.create(name: 'Spinning', description: 'Este es un ejercicio aeróbico de piernas que se realiza en una bicicleta estacionaria, tiene movimientos de alto impacto que ayudan a tonificar la parte baja del cuerpo y al mismo tiempo contribuye al aumento de la resistencia.')
