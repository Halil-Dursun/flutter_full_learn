import 'package:flutter_full_learn/303/generic_learn.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});

  test('User calculate', () {
    final users = [
      GenericUser('hd', '1', 100),
      GenericUser('vb', '2', 100),
      GenericUser('l10', '3', 200),
    ];
    final userManagement = UserManagament(AdminUser('hd', '2', 400, 1));
    final result = userManagement.calculateMoney(users);
    final result2 = userManagement.showNames<String>(users);

    expect(result, 800);
  });
}
