# create Aliens
a1 =
  Alien.create(
    name: 'Xyphod',
    earth_disguise_name: 'Bob',
    home_planet: 'Galactica',
    light_years_to_home_planet: '177',
  )

a2 =
  Alien.create(
    name: 'Molo',
    earth_disguise_name: 'Melissa',
    home_planet: 'XK579',
    light_years_to_home_planet: '943',
  )

# create Earthlings
e1 =
  Earthling.create(
    first_name: 'Jessica',
    last_name: 'Goldman',
    job: 'Scientist',
  )

# create Visitations
Visitation.create(date: Date.new, alien_id: a1.id, earthling_id: e1.id)
