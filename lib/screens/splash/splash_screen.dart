import 'package:fitness_tracker/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Wait ~2.5 seconds then fade to Login
    Future.delayed(const Duration(milliseconds: 2500), () {
      Navigator.of(context).pushReplacement(_createFadeRoute());
    });
  }

  // 👇 Fade transition route
  Route _createFadeRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 800), // smooth fade
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: colors.surface, // A modern navy blue
      body: Stack(
        children: [
          // Center logo text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo text

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LineAwesomeIcons.dumbbell_solid,
                      size: 64,
                      color: colors.primary,
                    ),
                    const SizedBox(height: 16),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Fitness',
                            style: textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colors.primary,
                            ),
                          ),
                          TextSpan(
                            text: 'Tracker',
                            style: textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w300,
                              color: colors.error,
                            ),
                          ),
                        ],
                      ),
                      style: const TextStyle(
                        fontSize: 34,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Text(
                  'Keeping fit!',
                  style: textTheme.bodySmall?.copyWith(
                    color: colors.onPrimary.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
