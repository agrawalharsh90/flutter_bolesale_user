import 'package:google_sign_in/google_sign_in.dart';
import 'package:grocery/model/user.dart';

class GoogleService {
  GoogleService._();

  factory GoogleService.getInstance() => _instance;

  static final GoogleService _instance = GoogleService._();

  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
    'email',
  ]);

  Future<LoggedInUser> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    LoggedInUser loggedInUser = LoggedInUser();
    loggedInUser.uid = googleSignInAccount.id;
    loggedInUser.email = googleSignInAccount.email;
    loggedInUser.name = googleSignInAccount.displayName;
    loggedInUser.imgUrl = googleSignInAccount.photoUrl;
    loggedInUser.createdAt = DateTime.now().toString();
    loggedInUser.lastLoggedIn = DateTime.now().toString();
    print("user Sign In");
    print(LoggedInUser.toJson(loggedInUser));
    return loggedInUser;
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
    print("User Sign Out");
  }
}
