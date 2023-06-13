import 'package:flutter_test/flutter_test.dart';
import 'package:education_flutter_web/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('DrawerViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
