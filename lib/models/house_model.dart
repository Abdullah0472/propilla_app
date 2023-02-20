// class HouseModel {
//   String imageUrl;
//   String address;
//   String description;
//   double price;
//   int bedRooms;
//   int bathRooms;
//   double sqFeet;
//   int garages;
//   int time;
//   List<String> moreImagesUrl;
//   bool isFav;
//   String phoneNumber;
//
//   HouseModel({
//     required this.imageUrl,
//     required this.address,
//     required this.description,
//     required this.price,
//     required this.bathRooms,
//     required this.bedRooms,
//     required this.sqFeet,
//     required this.garages,
//     required this.time,
//     required this.moreImagesUrl,
//     required this.isFav,
//     required this.phoneNumber
//   });
// }

class HouseModel {
  HouseModel({
    required this.imageUrl,
    required this.address,
    required this.description,
    required this.price,
    required this.bedRooms,
    required this.bathRooms,
    required this.sqFeet,
    required this.garages,
    required this.time,
    required this.moreImagesUrl,
    required this.isFav,
    required this.phoneNumber,
  });
  late final String imageUrl;
  late final String address;
  late final String description;
  late final double price;
  late final int bedRooms;
  late final  int bathRooms;
  late final double sqFeet;
  late final  int garages;
  late final int time;
  late final List<String> moreImagesUrl;
  late final bool isFav;
  late final String phoneNumber;

  HouseModel.fromJson(Map<String, dynamic> json){
    imageUrl = json['imageUrl'];
    address = json['address'];
    description = json['description'];
    price = json['price'];
    bedRooms = json['bedRooms'];
    bathRooms = json['bathRooms'];
    sqFeet = json['sqFeet'];
    garages = json['garages'];
    time = json['time'];
    moreImagesUrl = json['moreImagesUrl'];
    isFav = json['isFav'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['imageUrl'] = imageUrl;
    _data['address'] = address;
    _data['description'] = description;
    _data['price'] = price;
    _data['bedRooms'] = bedRooms;
    _data['bathRooms'] = bathRooms;
    _data['sqFeet'] = sqFeet;
    _data['garages'] = garages;
    _data['time'] = time;
    _data['moreImagesUrl'] = moreImagesUrl;
    _data['isFav'] = isFav;
    _data['phoneNumber'] = phoneNumber;
    return _data;
  }
}