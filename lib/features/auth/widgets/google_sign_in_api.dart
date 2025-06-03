import 'package:visit_uzbekistan/features/widgets/widget_imports.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();

  static Future logout() => _googleSignIn.disconnect();
}

Future signIn(BuildContext context) async {
  try {
    final user = await GoogleSignInApi.login();

    if (user == null) {
      // showMessage('Failed', isError: true);
    } else {
      print(user.displayName);
      // GoogleSignInAuthentication auth = await user.authentication;
      // String idToken = auth.idToken ?? '';

      // HiveHelperUser.googleSignInBox.put(
      //   HiveBoxes.googleUser,
      //   GoogleSignInModel(
      //     id: user.id,
      //     idToken: idToken,
      //     fullName: user.displayName,
      //     email: user.email,
      //     photoUrl: user.photoUrl,
      //   ),
      // );

      Navigator.pushReplacementNamed(context, AppRoutes.rootPage);
    }
  } catch (e) {
    print(e);
    return;
  }
}
