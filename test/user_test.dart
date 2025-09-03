// test/models/user_model_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_tracker/services/models/user.dart';

void main() {
  test('User toMap/fromMap round-trip', () {
    final u = User(username: 'bob', email: 'bob@x.io', password: 'secret');
    final map = u.toMap();
    expect(map['username'], 'bob');

    final u2 = User.fromMap(map);
    expect(u2.username, 'bob');
    expect(u2.email, 'bob@x.io');
    expect(u2.password, 'secret');
  });
}
