import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/authentication/screens/signup/widgets/text_button.dart';
import 'package:quiz_app/model/constants.dart';
import '../../../screens/home_screen.dart';
import '../signup/widgets/signin_button.dart';
import 'login_widets/login_button.dart';
import 'login_widets/email_field.dart';
import 'login_widets/password_field.dart';
import 'login_widets/remember_me_checkbox.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void SignIn() async {
    try {
      final result=   await _auth.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);


      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen(),));

    }on FirebaseAuthException  catch( e){
      print('login field');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/img.png"),
            ),
            SizedBox(height: 10),
            Text(
              "Login",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Welcome back! Please enter your details",
              style: TextStyle(
                color: texts,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30),

            // Custom Email Field
            EmailField(controller: _emailController),
            SizedBox(height: 20),

            // Custom Password Field
            PasswordField(controller: _passwordController),
            SizedBox(height: 10),

            // Custom Checkbox
            RememberMeCheckbox(
              value: _rememberMe,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
            SizedBox(height: 30),

            // Login Button
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Sign In',style: TextStyle(color: texts),),
                onPressed: () {
                  print('Button pressed');
                  SignIn();
                },
              ),
            ),
            SizedBox(height: 20),
            SignInButton(),


                  ],
        ),
      ),
    );
  }
}
