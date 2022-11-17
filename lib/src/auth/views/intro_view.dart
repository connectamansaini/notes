import 'package:flutter/material.dart';
import 'package:notes/src/auth/views/sign_in_view.dart';
import 'package:notes/src/auth/views/sign_up_view.dart';
import 'package:notes/src/auth/views/widgets/custom_auth_butto.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  static const String id = 'intro_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300.0,
              width: 300.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomAuthButton(
                  title: 'Sign up',
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpView.id);
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomAuthButton(
                  title: 'Sign in',
                  onPressed: () {
                    Navigator.pushNamed(context, SignInView.id);
                  },
                ),
              ],
            ),
            const Divider(
              height: 64,
              color: Colors.white,
              thickness: 3,
              indent: 35,
              endIndent: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomAuthButton(
                  title: 'Google',
                  onPressed: () {
                    // Navigator.pushNamed(context, SignInView.id);
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomAuthButton(
                  title: 'Facebook',
                  onPressed: () {
                    // Navigator.pushNamed(context, SignInView.id);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(200, 60),
                ),
              ),
              onPressed: () {},
              child: const Text('Continue with apple'),
            )
          ],
        ),
      ),
    );
  }
}
