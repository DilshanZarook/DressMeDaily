import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  const AuthService();
  
  //Google Sign In
  signInWithGoogle() async {
    // begin interactive sign in process
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // obtain auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // creat a new credential for the user
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //finally let's sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
