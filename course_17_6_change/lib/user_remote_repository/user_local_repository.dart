import 'package:course_17_6/entities/user.dart';
import 'package:course_17_6/repository_interface/i_user_repository.dart';

class LocalUserRepository implements IUserRepository {
  @override
  Future<User?> getUser(int id) async {
    return User(id: id);
  }
}