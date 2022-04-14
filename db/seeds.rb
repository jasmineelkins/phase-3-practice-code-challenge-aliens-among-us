# manually seed replant:
Alien.destroy_all
Earthling.destroy_all

# create Aliens
a1 =
  Alien.create(
    name: 'Xyphod',
    earth_disguise_name: 'Bob Moses',
    home_planet: 'Galactica',
    light_years_to_home_planet: '177',
  )

a2 =
  Alien.create(
    name: 'Molo',
    earth_disguise_name: 'Melissa Levine',
    home_planet: 'XK579',
    light_years_to_home_planet: '943',
  )

10.times do
  Alien.create(
    name: Faker::Cosmere.aon,
    earth_disguise_name: Faker::Name.unique.name,
    home_planet: Faker::Movies::HitchhikersGuideToTheGalaxy.planet,
    light_years_to_home_planet: Faker::Number.between(from: 1, to: 100_000),
  )
end

# create Earthlings
e1 =
  Earthling.create(
    first_name: 'Jessica',
    last_name: 'Goldman',
    job: 'Scientist',
  )

10.times do
  Earthling.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    job: Faker::Job.title,
  )
end

# create Visitations
Visitation.create(date: Date.today, alien_id: a1.id, earthling_id: e1.id)

10.times do
  Visitation.create(
    date: Faker::Date.between(from: '1914-09-23', to: '2021-09-25'),
    earthling: Earthling.all.sample,
    alien: Alien.all.sample,
  )
end
