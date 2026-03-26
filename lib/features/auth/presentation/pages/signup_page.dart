import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';
import 'package:travel_india/Config/Widgets/glassDecoTextfield.dart';
import 'package:travel_india/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:travel_india/features/home_page/home_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // guest signUp method
  // Google signUp method

  final _formkey = GlobalKey<FormState>();

  final TextEditingController newUserName = TextEditingController();
  final TextEditingController newUserEmailID = TextEditingController();
  final TextEditingController newUserPassword = TextEditingController();
  final TextEditingController newUserPhoneNumber = TextEditingController();

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _phoneNumberFocus = FocusNode();

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Name';
    }
    return null;
  }

  // Email validator
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

  // Phone validation
  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }

    final phoneRegex = RegExp(r'^\+?[\d\s-]{10,}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number (e.g., +1234567890)';
    }
    return null;
  }

  Future<void> handleSignUp() async {
    FocusScope.of(context).unfocus();
    print('In handleSignUp()');
    if (_formkey.currentState?.validate() ?? false) {
      context.read<AuthBloc>().add(
        AuthSignUpUsingEmailandPassword(
          name: newUserName.text.trim(),
          email: newUserEmailID.text.trim(),
          password: newUserPassword.text.trim(), 
          phone: newUserPhoneNumber.text.trim(),
        ),
      );
    }
  }

  @override
  void dispose() {
    newUserEmailID.dispose();
    newUserPassword.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _nameFocus.dispose();
    _phoneNumberFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          Center(child: CircularProgressIndicator(color: Colors.black));
        }

        if (state is AuthSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Center(
                child: Text(
                  'Sign Up Successful',
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
              ),
              backgroundColor: Colors.white.withOpacity(0.2),
            ),
          );
        }

        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Center(
                child: Text(
                  'Failed to sign Up',
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
              ),
              backgroundColor: Colors.white.withOpacity(0.2),
            ),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Form(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
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
                          'Sign Up',
                          style: TextStyle(fontSize: 38, color: Colors.white),
                        ),
                      ),

                      SizedBox(height: 5),
                      Center(
                        child: Text(
                          'Welcome',
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
                            top: 50,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // TEXT FIELD BOX
                              GlassDecoTextfield(
                                contant: Row(
                                  children: [
                                    Icon(Icons.person, color: Colors.white),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: TextFormField(
                                        controller: newUserName,
                                        focusNode: _nameFocus,
                                        validator: _validateName,
                                        decoration: InputDecoration(
                                          hintText: 'Name',
                                          hintStyle: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GlassDecoTextfield(
                                contant: Row(
                                  children: [
                                    Icon(
                                      Icons.mail_outline,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: TextFormField(
                                        controller: newUserEmailID,
                                        focusNode: _emailFocus,
                                        validator: _validateEmail,
                                        decoration: InputDecoration(
                                          hintText: 'Email',
                                          hintStyle: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GlassDecoTextfield(
                                contant: Row(
                                  children: [
                                    Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: TextFormField(
                                        controller: newUserPassword,
                                        focusNode: _passwordFocus,
                                        validator: _validatePassword,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          hintText: 'Password',
                                          hintStyle: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GlassDecoTextfield(
                                contant: Row(
                                  children: [
                                    Icon(Icons.phone, color: Colors.white),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        controller: newUserPhoneNumber,
                                        focusNode: _phoneNumberFocus,
                                        validator: _validatePhoneNumber,
                                        decoration: InputDecoration(
                                          hintText: 'phone Number',
                                          hintStyle: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: TextButton(
                                  // SUBMIT BUTTON
                                  onPressed: () {
                                    handleSignUp();
                                  },
                                  style: TextButton.styleFrom(
                                    minimumSize: const Size(
                                      double.infinity,
                                      50,
                                    ),
                                    backgroundColor: AppTheme.primaryColor,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text('Submit'),
                                ),
                              ),
                              const SizedBox(height: 30),

                              const Text(
                                'Continue with other options',
                                style: TextStyle(color: Colors.white),
                              ),

                              const SizedBox(height: 20),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // Other login options
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      minimumSize: Size.fromRadius(30),
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: Image.asset(
                                      height: 40,
                                      width: 40,
                                      'assets/images/Google_logo.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                      minimumSize: const Size(150, 40),
                                      backgroundColor: Colors.grey,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text('Guest account'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
