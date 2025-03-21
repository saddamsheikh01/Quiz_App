import 'package:flutter/material.dart';
class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          print('Google Sign-In Clicked');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/google_ic.png',
              height: 24,
              width: 24,
            ),
            SizedBox(width: 10),
            Text(
              'Sign in with Google',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
