import 'package:peer_gig/domain/entities/authentication/auth_user_details.dart';

abstract class AuthRepositoryBase {
  Future<AuthUserDetails> authenticateWithGoogle();
  Future<void> signOut();
  String? getEmailOfUser();
}
