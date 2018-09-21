User.create!([
  {
    name: 'Paquito',
    surname: 'Palotes',
    email: 'paquito@paquito.com',
    password: 'paquito',
    password_confirmation: 'paquito'
  },
  {
    name: 'Maria',
    surname: 'Sensepa',
    email: 'maria@maria.com',
    password: 'maria',
    password_confirmation: 'maria'
  },
  {
    name: 'Madlen',
    surname: 'Yel',
    email: 'madlen@madlen.com',
    password: 'madlen',
    password_confirmation: 'madlen',
    admin: true
  }
])

Pot.create!([
  {
    name: 'Rodonet',
    dimensions: '50x50x50 cm',
    material: 'Ceramic',
    price: 25,
    image: 'pot_black.png',
    capacity: 15
  },
  {
    name: 'Megatop',
    dimensions: '40x40x40 cm',
    material: 'Ceramic',
    price: 18,
    image: 'pot_wood.png',
    capacity: 10
  },
  {
    name: 'Lili',
    dimensions: '30x30x30 cm',
    material: 'Plastic',
    price: 10,
    image: 'pot_stripes.png',
    capacity: 5
  }
])

Flower.create!([
  {
    name: 'Rose',
    color: 'Red',
    origin: 'Italy',
    price: 3,
    image: 'flower_rose.png'
  },
  {
    name: 'Tulipan',
    color: 'White',
    origin: 'France',
    price: 2,
    image: 'flower_tulipan.png'
  },
  {
    name: 'Lilium',
    color: 'Lila',
    origin: 'France',
    price: 1.5,
    image: 'flower_lilium.png'
  },
  {
    name: 'Geranium',
    color: 'Rosa',
    origin: 'Spain',
    price: 5,
    image: 'flower_geranium.png'
  },
  {
    name: 'Violet',
    color: 'Violet',
    origin: 'Spain',
    price: 3,
    image: 'flower_violet.png'
  },
  {
    name: 'Daisy',
    color: 'White',
    origin: 'France',
    price: 1,
    image: 'flower_daisy.png'
  },
  {
    name: 'Jasmine',
    color: 'White',
    origin: 'Italy',
    price: 4,
    image: 'flower_jasmine.png'
  },
  {
    name: 'Petunia',
    color: 'Lila',
    origin: 'France',
    price: 4,
    image: 'flower_petunia.png'
  },
  {
    name: 'Orchid',
    color: 'Rosa',
    origin: 'Spain',
    price: 5,
    image: 'flower_orchid.png'
  },
  {
    name: 'Marigold',
    color: 'Orange',
    origin: 'Spain',
    price: 2,
    image: 'flower_marigold.png'
  }
])