import 'package:flutter/foundation.dart';

import '../../entities/common/user.dart';

abstract class AuthRepositoryBase {
  Future<void> signUpWithEmailAndPassword(
      {@required String? email,
      @required String? password,
      @required User? user});

  Future<void> signInWithEmailAndPassword(
      {@required String? email, @required String? password});
}
