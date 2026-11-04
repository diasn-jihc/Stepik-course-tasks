import 'package:flutter_test/flutter_test.dart';
import 'package:course_17_6/entities/user.dart';
import 'package:course_17_6/repository_interface/i_user_repository.dart';
import 'package:course_17_6/user_remote_repository/user_local_repository.dart';

void main() {
  test('Get Local User Repository (success)', () async {
    LocalUserRepository localUserRepository = LocalUserRepository();

    User? user = await localUserRepository.getUser(12);

    expect(localUserRepository, isA<IUserRepository>());
    expect(user?.id, equals(12));
  });
}
