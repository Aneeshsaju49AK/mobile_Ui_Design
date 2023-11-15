import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserProfile {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String email;

  @HiveField(2)
  late String userName;

  @HiveField(3)
  late String? profilePicturepath;

  UserProfile({
    required this.name,
    required this.email,
    required this.userName,
    required this.profilePicturepath,
  });
}
