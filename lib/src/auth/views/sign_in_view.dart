import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:notes/src/auth/views/sign_up_view.dart';
import 'package:notes/src/home/views/home_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const String id = 'sign_in_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Sign in'),
              const SizedBox(
                height: 12,
              ),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  children: [
                    TextSpan(
                      text: 'Register',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, SignUpView.id);
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  suffix: Icon(Icons.email),
                  label: Text(
                    'Enter your Email',
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  suffix: Icon(Icons.password),
                  label: Text(
                    'Password',
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgotten password?',
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, HomeView.id);
                },
                child: const Text(
                  'Sign in',
                ),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.login),
                onPressed: () {},
                label: const Text('Sign in with Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
