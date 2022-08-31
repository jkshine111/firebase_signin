import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin/screens/signup_screen.dart';
import 'package:firebase_signin/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../api/todo_list.dart';
import '../reusable_widget/reusable_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emilTextController = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("CB2B93"),
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.5, 20, 0),
            child: Column(
              children: <Widget>[
                reusableTextField("Enter Email Id", Icons.email_outlined, false,
                    _emilTextController),
                SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, true, () {
                  print('Go to Home Page');
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emilTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    // homescreen
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  }).onError((error, stackTrace) {
                    print("Error: ${error.toString()}");
                  });
                }),
                // Image(
                //   // width: double.infinity,
                //   image: AssetImage("assets/images/google.png"),
                //   height: 50,
                //   width: 50,
                //   fit: BoxFit.cover,
                // ),
                // SizedBox(
                //   height: 10,
                // ),

                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white70),
                  ),
                  // onPressed: signIn,
                  onPressed: () {
                    print('Text Button');
                    Navigator.push(
                        context,
                        // google sign in
                        MaterialPageRoute(
                            builder: (context) => _HomeState())); //signIn
                  },
                  child: Text(
                    'Google SignIn',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                signUpOption()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account?",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

class _HomeState extends StatefulWidget {
  @override
  State<_HomeState> createState() => _HomeStateState();
}

class _HomeStateState extends State<_HomeState> {
  @override
  _HomeState createState() => _HomeState();

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Sign In'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: _buildWidget(),
      ),
    );
  }

  Widget _buildWidget() {
    GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ListTile(
              leading: GoogleUserCircleAvatar(identity: user),
              title: Text(user.displayName ?? ''),
              subtitle: Text(user.email),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Signed in successfully',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              // onPressed: signOut,
              onPressed: () {
                Navigator.push(
                    context,
                    // google sign in
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              child: const Text('Open Todo Page'),
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'You are not signed in',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: signIn,
              child: const Text('Sign in'),
            )
          ],
        ),
      );
    }
  }

  void signOut() {
    _googleSignIn.disconnect();
  }

  Future<void> signIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (e) {
      print('Error signing in $e');
    }
  }
}
