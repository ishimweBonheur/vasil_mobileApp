import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// RootPage moved into `lib/main.dart`. Navigation now uses named routes.

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Expanded(child: SvgPicture.asset('assets/images/welcome.svg')),
              const SizedBox(height: 24),
              const Text(
                'Welcome to Begin Your Strength',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Step into a journey that nurtures both body and mind. Through simple yet powerful workouts.',
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/root');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.black87,
                ),
                child: const Text('Get Started'),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Already have an account? Login',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
