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
    final _formkey = GlobalKey<FormState>();

    TextEditingController userEmailID = TextEditingController();
    TextEditingController userPassword = TextEditingController();

    final _emailFocus = FocusNode();
    final _passwordFocus = FocusNode();

    String? _validateEmail(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your Email';
      }
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(value)) {
        return 'Please enter a valid email address';
      }
      return null;
    }

    // Password validation
    String? _validatePassword(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter a password';
      }
      if (value.length < 6) {
        return 'Password must be at least 6 characters long';
      }
      return null;
    }

    @override
    void dispose() {
      
      super.dispose();
    }

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Center(
                child: Text(
                  'Login Successful',
                  style: TextStyle(color: Colors.green),
                ),
              ),
              backgroundColor: Colors.white,
            ),
          );
        }

        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Center(
                child: Text(
                  'Wrong Email or Password',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              backgroundColor: Colors.white,
            ),
          );
        }
      },
      child: Scaffold(
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
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
                children: [
                  const SizedBox(height: 50),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 38, color: Colors.white),
                  ),

                  SizedBox(height: 5),
                  Text(
                    'Welcome Back',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),

                  // WHITE SECTION
                  Padding(
                    padding: const EdgeInsets.only(top: 70),

                    child: Container(
                      width: double.infinity,
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
                            top: 75,
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
                                    TextFormField(
                                      controller: userEmailID,
                                      focusNode: _emailFocus,
                                      validator: _validateEmail,
                                      decoration: const InputDecoration(
                                        hintText: 'Email',
                                        hintStyle: TextStyle(
                                          color: Colors.white,
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 12,
                                        ),
                                      ),
                                    ),
                                    const Divider(height: 1),
                                    TextFormField(
                                      controller: userPassword,
                                      obscureText: true,
                                      focusNode: _passwordFocus,
                                      validator: _validatePassword,
                                      decoration: const InputDecoration(
                                        hintText: 'Password',
                                        hintStyle: TextStyle(
                                          color: Colors.white,
                                        ),
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
                                              password: userPassword.text
                                                  .trim(),
                                            ),
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                          minimumSize: const Size(
                                            double.infinity,
                                            50,
                                          ),
                                          backgroundColor:
                                              AppTheme.primaryColor,
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
      ),
    );
  }
}
