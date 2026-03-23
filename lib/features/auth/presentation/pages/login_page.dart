import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';
import 'package:travel_india/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:travel_india/features/auth/presentation/pages/signup_page.dart';
import 'package:travel_india/features/home_page/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userEmailID = TextEditingController();
    TextEditingController userPassword = TextEditingController();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Login Successful')));
        }

        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Wrong Email or Password')),
          );
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentGeometry.topCenter,
                end: AlignmentGeometry.bottomCenter,
                colors: [Color(0xFF0E52B8), Color(0xFFA6C5D8)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Center(
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 38, color: Colors.white),
                      ),
                    ),

                    SizedBox(height: 5),
                    Center(
                      child: Text(
                        'Welcome Back',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),

                // WHITE SECTION
                Padding(
                  padding: const EdgeInsets.only(top: 70),

                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2), // translucent
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),

                    child: Align(
                      // to align the inner container
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(
                          top: 80,
                          left: 10,
                          right: 10,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // TEXT FIELD BOX
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: userEmailID,
                                    decoration: const InputDecoration(
                                      hintText: 'Email',
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                    ),
                                  ),
                                  const Divider(height: 1),
                                  TextField(
                                    controller: userPassword,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: TextStyle(color: Colors.white),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 35),

                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),

                            const SizedBox(height: 35),
                            BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                if (state is AuthLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  );
                                }

                                return Column(
                                  children: [
                                    TextButton(
                                      // LOGIN BUTTON
                                      onPressed: () {
                                        // the login event is called
                                        context.read<AuthBloc>().add(
                                          AuthLoginUsingEmailandPassword(
                                            email: userEmailID.text.trim(),
                                            password: userPassword.text.trim(),
                                          ),
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        minimumSize: const Size(
                                          double.infinity,
                                          50,
                                        ),
                                        backgroundColor: AppTheme.primaryColor,
                                        foregroundColor: Colors.white,
                                      ),
                                      child: const Text('Login'),
                                    ),
                                  ],
                                );
                              },
                            ),

                            const SizedBox(height: 15),

                            TextButton(
                              // Sign Up BUTTON
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupPage(),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                backgroundColor: AppTheme.darkColor,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Sign Up'),
                            ),

                            // const SizedBox(height: 35),

                            // const Text(
                            //   'Continue with other options',
                            //   style: TextStyle(color: Colors.white),
                            // ),

                            // const SizedBox(height: 20),

                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //   children: [
                            //     // Other login options
                            //     TextButton(
                            //       onPressed: () {},
                            //       style: TextButton.styleFrom(
                            //         minimumSize: Size.fromRadius(30),
                            //         backgroundColor: Colors.white,
                            //         foregroundColor: Colors.white,
                            //       ),
                            //       child: Image.asset(
                            //         height: 40,
                            //         width: 40,
                            //         'assets/images/Google_logo.png',
                            //         fit: BoxFit.cover,
                            //       ),
                            //     ),
                            //     TextButton(
                            //       onPressed: () {},
                            //       style: TextButton.styleFrom(
                            //         minimumSize: const Size(150, 40),
                            //         backgroundColor: Colors.grey,
                            //         foregroundColor: Colors.white,
                            //       ),
                            //       child: const Text('Guest'),
                            //     ),
                            //   ],
                            // ),
                            const SizedBox(height: 30),
                          ],
                        ),
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

// BlocBuilder<AuthBloc, AuthState>(
//       builder: (context, state) {
//         if (state is AuthLoading) {
//           return Center(child: CircularProgressIndicator(color: Colors.white));
//         }
//         if (state is AuthSuccess) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => HomePage()),
//           );
//           return ScaffoldMessenger.of(
//             context,
//           ).showSnackBar(SnackBar(content: Text('Login Successful')));
//         }
//         if(state is AuthFailure){
//           return ScaffoldMessenger.of(
//             context,
//           ).showSnackBar(SnackBar(content: Text('Wrong Email or Password')));
//         }
//         return Container();
//       },
//     )(
//       create: (context) => AuthBloc(context),
//       child:
