import 'dart:io';

class PlaceLocation {
  final double latitutde;
  final double longitude;
  String? address;
  PlaceLocation({required this.latitutde, required this.longitude, this.address});
}

class Place {
  final String id;
  final String title;
  final PlaceLocation? location;
  final File image;

  Place(
      {required this.id,
      required this.title,
      required this.image,
      this.location,
    });
}
