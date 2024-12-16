import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/painting.dart';
import 'package:post_ace/screens/home_screen.dart';
import 'package:post_ace/screens/login_screen_admin.dart';
import 'package:post_ace/services/auth_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _signUp() async {
      String Email = _email.text;
      String Password = _password.text;

      User? user = await _auth.createUserWithEmailId(Email, Password);

      if (user != null) {
        print("user Succefully register");
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      } else {
        print("UnsuccessFull");
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'WELCOME',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Login illustration
                SvgPicture.asset(
                  'assets/illustrations/login_student_illus.svg',
                  height: 200,
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/icons/lock.svg',
                        colorFilter: const ColorFilter.mode(
                          Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    hintText: 'E-Mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        'assets/icons/key.svg',
                        colorFilter: const ColorFilter.mode(
                          Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: 180,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: _signUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6C63FF),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                ),
                // SizedBox(
                //   width: 180,
                //   height: 40,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       // TODO: Implement email validation
                //       // if (email.endsWith('@atharvacoe.ac.in')) {
                //       Navigator.pushReplacement(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) =>
                //               const SignIn(),
                //         ),
                //       );
                //       // }
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: const Color(0xFF6C63FF),
                //       foregroundColor: Colors.white,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(50),
                //       ),
                //     ),
                //     child: const Text('create account'),
                //   ),
                // ),
                // const SizedBox(height: 26),
                // SizedBox(
                //   width: 250,
                //   height: 50,
                //   child: OutlinedButton.icon(
                //     onPressed: () {
                //       // TODO: Implement Firebase Google Sign In
                //       // For now, just navigate to admin screen
                //       Navigator.pushReplacement(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => const LoginScreen(),
                //         ),
                //       );

                //       // TODO: Uncomment this when Firebase is setup
                //       // final authService = AuthService();
                //       // final user = await authService.signInWithGoogle();
                //       // if (user != null && context.mounted) {
                //       //   if (user.email.endsWith('@admin.atharvacoe.ac.in')) {
                //       //     Navigator.pushReplacement(
                //       //       context,
                //       //       MaterialPageRoute(
                //       //         builder: (context) => const AdminHomeScreen(),
                //       //       ),
                //       //     );
                //       //   } else if (user.email.endsWith('@atharvacoe.ac.in')) {
                //       //     Navigator.pushReplacement(
                //       //       context,
                //       //       MaterialPageRoute(
                //       //         builder: (context) => const StudentHomeScreen(),
                //       //       ),
                //       //     );
                //       //   } else {
                //       //     ScaffoldMessenger.of(context).showSnackBar(
                //       //       const SnackBar(
                //       //         content: Text('Please use your college email address'),
                //       //       ),
                //       //     );
                //       //     await authService.signOut();
                //       //   }
                //       // }
                //     },
                //     style: OutlinedButton.styleFrom(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(50),
                //       ),
                //     ),
                //     icon: SvgPicture.asset(
                //       'assets/google_logo.svg',
                //       height: 24,
                //     ),
                //     label: const Text('Sign-in with Google'),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
