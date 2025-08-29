import 'package:fitness_tracker/services/db/db_helper.dart';
import 'package:fitness_tracker/services/models/user.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _printAllUsers();
  }

  Future<void> _printAllUsers() async {
    final users = await DatabaseHelper.instance.getAllUsers();
    print('All registered users:');
    for (var user in users) {
      print('Username: ${user.username}, Email: ${user.email}');
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
                const SizedBox(height: 100),

                // Logo + Title
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
                        style:
                            const TextStyle(fontSize: 34, letterSpacing: 1.2),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                Text(
                  'Create Account',
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

                // Email
                TextField(
                  controller: emailController,
                  style: text.bodyMedium?.copyWith(color: colors.primary),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: text.bodySmall
                        ?.copyWith(color: colors.primary.withOpacity(0.6)),
                    filled: true,
                    fillColor: colors.surfaceContainer,
                    prefixIcon: Icon(Icons.email, color: colors.primary),
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
                  obscureText: true,
                  style: text.bodyMedium?.copyWith(color: colors.primary),
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
                const SizedBox(height: 16),

                // Confirm Password
                TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  style: text.bodyMedium?.copyWith(color: colors.primary),
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: text.bodySmall
                        ?.copyWith(color: colors.primary.withOpacity(0.6)),
                    filled: true,
                    fillColor: colors.surfaceContainer,
                    prefixIcon: Icon(Icons.lock_outline, color: colors.primary),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Register Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      final username = usernameController.text.trim();
                      final email = emailController.text.trim();
                      final password = passwordController.text;
                      final confirmPassword = confirmPasswordController.text;

                      if (password != confirmPassword) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("Passwords do not match")),
                        );
                        return;
                      }

                      final user = User(
                        username: username,
                        email: email,
                        password: password,
                      );

                      await DatabaseHelper.instance.registerUser(user);

                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Register',
                      style: text.labelLarge?.copyWith(
                        color: colors.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: RichText(
                      text: TextSpan(
                        style: text.bodySmall,
                        children: [
                          TextSpan(
                            text: 'Already have an account? ',
                            style:
                                text.bodySmall?.copyWith(color: colors.primary),
                          ),
                          TextSpan(
                            text: 'Sign In',
                            style: text.bodySmall?.copyWith(
                              color: colors.primary.withOpacity(0.85),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
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
