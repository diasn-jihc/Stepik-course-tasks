import 'package:course_17_6/entities/user.dart';

abstract class IUserRepository {
  Future<User?> getUser(int id);
}