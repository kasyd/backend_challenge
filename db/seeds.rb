parana = State.create(name: 'Paraná')
santa_catarina = State.create(name: 'Santa Catarina')
rio_grande_do_sul = State.create(name: 'Rio Grande do Sul')

City.create(name: 'Curitiba', state: parana)
City.create(name: 'Londrina', state: parana)
City.create(name: 'Maringá', state: parana)

City.create(name: 'Florianópolis', state: santa_catarina)
City.create(name: 'Joinville', state: santa_catarina)
City.create(name: 'Blumenau', state: santa_catarina)

City.create(name: 'Porto Alegre', state: rio_grande_do_sul)
City.create(name: 'Caxias do Sul', state: rio_grande_do_sul)
City.create(name: 'Pelotas', state: rio_grande_do_sul)
