class Space {
  int? id;
  String? name;
  String? city;
  String? country;
  int? price;
  String? imageUrl;
  int? rating;
  String? address;
  String? phone;
  String? mapUrl;
  List? photos;
  int? numberOfKitchens;
  int? numberOfBedrooms;
  int? numberOfCupboards;

  Space(
      {this.id,
      this.name,
      this.city,
      this.country,
      this.price,
      this.imageUrl,
      this.rating,
      this.address,
      this.phone,
      this.mapUrl,
      this.photos,
      this.numberOfBedrooms,
      this.numberOfCupboards,
      this.numberOfKitchens});

  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    price = json['price'];
    imageUrl = json['image_url'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfCupboards = json['number_of_cupboards'];
    numberOfKitchens = json['number_of_kitchens'];
  }
}
