import 'package:peer_gig/domain/entities/common/user.dart';
import 'package:peer_gig/domain/repositories/authentication/auth_repository_base.dart';

class AuthRepository extends AuthRepositoryBase {
  @override
  Future<void> signInWithEmailAndPassword(
      {String? email, String? password}) async {}

  @override
  Future<void> signUpWithEmailAndPassword(
      {String? email, String? password, User? user}) async {}
}
