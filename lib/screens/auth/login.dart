import 'package:fitness_tracker/screens/home.dart';
import 'package:fitness_tracker/services/db/db_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    final username = usernameController.text.trim();
    final password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter username and password')),
      );
      return;
    }

    setState(() => _isLoading = true);
    await DatabaseHelper.instance.printAllTables();
    final db = await DatabaseHelper.instance.database;
    final res = await db.rawQuery("PRAGMA table_info(users)");
    print(res);

    // Query the DB for user
    final user = await DatabaseHelper.instance.loginUser(username, password);
    print(user);

    setState(() => _isLoading = false);

    if (user != null) {
      // Login successful, navigate to home or dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(user: user),
        ),
      );
    } else {
      // Show error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final text = theme.textTheme;

    return Scaffold(
      backgroundColor: colors.surface,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 180),

                // FleetPredict Logo
                Center(
                  child: Column(
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
                              style: text.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colors.primary,
                              ),
                            ),
                            TextSpan(
                              text: 'Tracker',
                              style: text.headlineMedium?.copyWith(
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
                ),

                const SizedBox(height: 40),

                // Sign In heading
                Text(
                  'Sign In',
                  style: text.headlineSmall?.copyWith(
                    color: colors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),

                // Username
                TextField(
                  controller: usernameController,
                  style: text.bodyMedium?.copyWith(color: colors.primary),
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: text.bodySmall
                        ?.copyWith(color: colors.primary.withOpacity(0.6)),
                    filled: true,
                    fillColor: colors.surfaceContainer,
                    prefixIcon: Icon(Icons.person, color: colors.primary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Password
                TextField(
                  controller: passwordController,
                  style: text.bodyMedium?.copyWith(color: colors.primary),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: text.bodySmall
                        ?.copyWith(color: colors.primary.withOpacity(0.6)),
                    filled: true,
                    fillColor: colors.surfaceContainer,
                    prefixIcon: Icon(Icons.lock, color: colors.primary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot-password');
                    },
                    child: Text(
                      'Forgot password?',
                      style: text.bodySmall?.copyWith(
                        color: colors.primary.withOpacity(0.9),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Sign In button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _signIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Text(
                            'Sign In',
                            style: text.labelLarge?.copyWith(
                              color: colors.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 30),

                // Contact Admin
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, '/register');
                    },
                    child: RichText(
                      text: TextSpan(
                        style: text.bodySmall,
                        children: [
                          TextSpan(
                            text: "Don't have an account? ",
                            style:
                                text.bodySmall?.copyWith(color: colors.primary),
                          ),
                          TextSpan(
                            text: 'Register',
                            style: text.bodySmall?.copyWith(
                              color: colors.primary.withOpacity(0.85),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Perform navigation or logic here
                                Navigator.pushNamed(context, '/register');
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
