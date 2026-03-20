import 'package:flutter/material.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';
import 'package:travel_india/Config/Widgets/glassDecoTextfield.dart';
import 'package:travel_india/Config/Widgets/glassDecoration.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
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
                          GlassDecoTextfield(text: 'Name', icon: Icons.person),
                          GlassDecoTextfield(
                            text: 'Email',
                            icon: Icons.mail_outline,
                          ),
                          GlassDecoTextfield(
                            text: 'Password',
                            icon: Icons.remove_red_eye_outlined,
                          ),
                          GlassDecoTextfield(
                            text: 'phone Number',
                            icon: Icons.phone,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: TextButton(
                              // SUBMIT BUTTON
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                backgroundColor: AppTheme.primaryColor,
                                foregroundColor: Colors.white,
                              ),
                              child: const Text('Submit'),
                            ),
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
    );
  }
}
