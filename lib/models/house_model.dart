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
    required this.title,
    required this.description,
    required this.price,
    required this.bedRooms,
    required this.bathRooms,
    required this.area,
    required this.garages,
    required this.time,
    required this.moreImagesUrl,
    required this.isFav,
    required this.uid,
    required this.id,
    required this.hospital,
    required this.school,
    required this.airport,
    required this.market,
    required this.masjid,
    required this.park,
    required this.phoneNumber,

  });
  late final String imageUrl;
  late final String address;
  late final String title;
  late final String description;
  late final String price;
  late final String bedRooms;
  late final  String bathRooms;
  late final String area;
  late final  String garages;
  late final String time;
  late final List<String> moreImagesUrl;
  late final bool isFav;
  late final String id;
  late final String uid;
  late final String hospital;
  late final String school;
  late final String airport;
  late final String market;
  late final String masjid;
  late final String park;
  late final String phoneNumber;

  HouseModel.fromJson(Map<String, dynamic> doc, String docId){
    imageUrl = doc['imageUrl']??"";
    address = doc['address']??"";
    title = doc['title']??"";
    description = doc['description']??"";
    price = doc['price']??"";
    bedRooms = doc['bedRooms']??"";
    bathRooms = doc['bathRooms']??"";
    area = doc['area']??"";
    garages = doc['garages']??"";
    time = doc['time']??"";
    moreImagesUrl = doc['moreImagesUrl']??"";
    isFav = doc['isFav']??"";
    uid = doc['uid']??"";
    id=docId;
    hospital = doc['hospital']??"";
    school = doc['school']??"";
    airport = doc['airport']??"";
    market = doc['market']??"";
    masjid = doc['masjid']??"";
    park = doc['park']??"";
    phoneNumber = doc['phoneNumber']??"";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['imageUrl'] = imageUrl;
    _data['address'] = address;
    _data['title'] = title;
    _data['description'] = description;
    _data['price'] = price;
    _data['bedRooms'] = bedRooms;
    _data['bathRooms'] = bathRooms;
    _data['area'] = area;
    _data['garages'] = garages;
    _data['time'] = time;
    _data['moreImagesUrl'] = moreImagesUrl;
    _data['isFav'] = isFav;
    _data['uid'] = uid;
    _data['id']=id;
    _data['hospital']=hospital;
    _data['school'] = school;
    _data['airport'] = airport;
    _data['market'] = market;
    _data['masjid'] = masjid;
    _data['park'] = park;
    _data['phoneNumber'] = phoneNumber;
    return _data;
  }
}