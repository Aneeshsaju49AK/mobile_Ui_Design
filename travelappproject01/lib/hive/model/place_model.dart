import 'package:hive/hive.dart';

part 'place_model.g.dart';

@HiveType(typeId: 1)
class PlaceModel {
  @HiveField(0)
  late String district;
  @HiveField(1)
  late String category;
  @HiveField(2)
  late String placeName;
  @HiveField(3)
  late String subLocation;
  @HiveField(4)
  late String googleMapsPath;
  @HiveField(5)
  late String description;
  @HiveField(6)
  late List<String> images;

  PlaceModel({
    required this.district,
    required this.category,
    required this.placeName,
    required this.subLocation,
    required this.googleMapsPath,
    required this.description,
    required this.images,
  });
}
