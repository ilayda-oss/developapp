import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServise {
  // google sign in
  signInWithGoogle() async {
    // begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    // finally lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // // apple sign in
  // Future<UserCredential?> signInWithApple() async {
  //   try {
  //     // İlk yetkilendirme isteğini gerçekleştirin
  //     final AuthorizationCredentialAppleID credential =
  //         await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );

  //     // Kullanıcı için yeni bir kimlik bilgisi oluşturun
  // //     final OAuthProvider oAuthProvider = OAuthProvider('apple.com');
  // //     final AuthCredential authCredential = oAuthProvider.credential(
  // //       idToken: credential.identityToken,
  // //       accessToken: credential.authorizationCode,
  // //     );

  //     // Kimlik bilgisiyle giriş yapın
  //     return await FirebaseAuth.instance.signInWithCredential(authCredential);
  //   } catch (error) {
  //     print('Apple ile giriş yaparken hata oluştu: $error');
  //     return null;
  //   }
}
