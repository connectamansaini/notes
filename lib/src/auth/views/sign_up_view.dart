import 'package:flutter/material.dart';
import 'package:notes/src/home/views/home_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const String id = 'sign_up_view';

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
              const Text(
                'Sign up',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text(
                    'First Name',
                  ),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text(
                    'Last Name',
                  ),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  suffix: Icon(Icons.email),
                  label: Text(
                    'Enter your Email',
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 24,
              // ),
              TextFormField(
                decoration: const InputDecoration(
                  suffix: Icon(Icons.password),
                  label: Text(
                    'Password',
                  ),
                ),
              ),
              const SizedBox(height: 24),
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

              // ElevatedButton.icon(
              //   icon: const Icon(Icons.login),
              //   onPressed: () {},
              //   label: const Text('Sign in with Google'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
