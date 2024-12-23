import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {

  final GoogleSignIn googleSignIn = GoogleSignIn();

  //google sign in

  signInWithGoogle()async{

        await googleSignIn.signOut();


    // bigin interactive sign in

    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //obtain auth details from request

    final GoogleSignInAuthentication? gAuth = await gUser!.authentication;

    // create new credential for user

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth!.accessToken,
      idToken: gAuth.idToken
    );

    // finaly sign in

    return await FirebaseAuth.instance.signInWithCredential(credential);

  }
  
}