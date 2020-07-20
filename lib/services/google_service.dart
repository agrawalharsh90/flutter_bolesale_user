import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleService {
  GoogleService._();

  factory GoogleService.getInstance() => _instance;

  static final GoogleService _instance = GoogleService._();

  final GoogleSignIn googleSignIn = GoogleSignIn();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult =
        await _firebaseAuth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _firebaseAuth.currentUser();
    assert(user.uid == currentUser.uid);

    print("user Sign In");
    return user;
  }

  Future<bool> signOutGoogle() async {
    try {
      await googleSignIn.signOut();
      await _firebaseAuth.signOut();
      print("User Sign Out");
      return true;
    } catch (e) {
      print("error in signout");
      print(e);
      return false;
    }
  }
}
