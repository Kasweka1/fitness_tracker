import 'package:fitness_tracker/core/theme/theme.dart';
import 'package:fitness_tracker/core/theme/util.dart';
import 'package:fitness_tracker/screens/auth/login.dart';
import 'package:fitness_tracker/screens/auth/register.dart';
import 'package:fitness_tracker/screens/splash/splash_screen.dart';
import 'package:fitness_tracker/services/db/db_helper.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Wipe DB on app start (for development/testing)
  // await DatabaseHelper.instance.resetDatabase();
  runApp(const MyFitnessTracker());
}

class MyFitnessTracker extends StatelessWidget {
  const MyFitnessTracker({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Fitness Tracker',
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      themeMode: ThemeMode.system,
      home: SplashScreen(),
      routes: {
        // '/home': (_) => const HomePage(),
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
      },
    );
  }
}
