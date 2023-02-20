

import '../models/house_model.dart';

final _house1 = HouseModel(
  imageUrl: 'Assets/images/image/house1.jpeg',
  address: 'Bahria Town, Sector A-1',
  description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
  price: 200.00,
  bedRooms: 4,
  bathRooms: 2,
  garages: 2,
  sqFeet: 1.416,
  time: 20,
  isFav: false,
  moreImagesUrl: [
    'Assets/images/image/house1.jpeg',
    'Assets/images/image/indoor1.jpg',
    'Assets/images/image/indoor2.jpg',
    'Assets/images/image/indoor3.jpg',
    'Assets/images/image/indoor4.jpg',
    'Assets/images/image/indoor5.jpg',
  ], phoneNumber: '03237118284'
);

final _house2 = HouseModel(
    imageUrl: 'Assets/images/image/house2.jpeg',
    address: 'Iqbal Town, Sector G-3',
    description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
    price: 140.00,
    bedRooms: 4,
    bathRooms: 2,
    garages: 1,
    sqFeet: 1.416,
    time: 30,
    isFav: false,
    moreImagesUrl: [
      'Assets/images/image/house2.jpeg',
      'Assets/images/image/indoor1.jpg',
      'Assets/images/image/indoor2.jpg',
      'Assets/images/image/indoor3.jpg',
      'Assets/images/image/indoor4.jpg',
      'Assets/images/image/indoor5.jpg',
    ],
    phoneNumber: '03106900646',
);

final _house3 = HouseModel(
    imageUrl: 'Assets/images/image/house3.jpeg',
    address: 'Johar Town, Sector i-8',
    description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
    price: 210.00,
    bedRooms: 5,
    bathRooms: 3,
    garages: 1,
    sqFeet: 1.700,
    time: 30,
    isFav: false,
    moreImagesUrl: [
      'Assets/images/image/house3.jpeg',
      'Assets/images/image/indoor1.jpg',
      'Assets/images/image/indoor2.jpg',
      'Assets/images/image/indoor3.jpg',
      'Assets/images/image/indoor4.jpg',
      'Assets/images/image/indoor5.jpg',
    ],
    phoneNumber: '034569845632',
);

final _house4 = HouseModel(
    imageUrl: 'Assets/images/image/house4.png',
    address: 'Business Man Colony, House 25',
    description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
    price: 170.00,
    bedRooms: 2,
    bathRooms: 1,
    garages: 1,
    sqFeet: 1.210,
    time: 30,
    isFav: false,
    moreImagesUrl: [
      'Assets/images/image/house4.png',
      'Assets/images/image/indoor1.jpg',
      'Assets/images/image/indoor2.jpg',
      'Assets/images/image/indoor3.jpg',
      'Assets/images/image/indoor4.jpg',
      'Assets/images/image/indoor5.jpg',
    ],
    phoneNumber: '03256987415',
);

final _house5 = HouseModel(
    imageUrl: 'Assets/images/image/house5.jpeg',
    address: 'Muslim Town, Block C House 576',
    description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
    price: 150.00,
    bedRooms: 3,
    bathRooms: 1,
    garages: 1,
    sqFeet: 1.42,
    time: 240,
    isFav: false,

    moreImagesUrl: [
      'Assets/images/image/house5.jpeg',
      'Assets/images/image/indoor1.jpg',
      'Assets/images/image/indoor2.jpg',
      'Assets/images/image/indoor3.jpg',
      'Assets/images/image/indoor4.jpg',
      'Assets/images/image/indoor5.jpg',
    ],
    phoneNumber: '032569874563',
);

final List<HouseModel> houseList = [
  _house2,
  _house1,
  _house3,
  _house4,
  _house5,
];


List<String> categoryList = [
  '<PKR. 15,000',
  'For Sale',
  '3-4 bed room',
  'Garages',
  'Modular kitchen'
];
