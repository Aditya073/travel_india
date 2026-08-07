import 'package:flutter/material.dart';
import 'package:travel_india/Config/Theme/app_theme.dart';
import 'package:travel_india/features/auth/data/models/user_model.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  final UserModel userDetails;

  const ProfilePage({super.key, required this.userDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: AppTheme.powderBlue),
        ),
        title: Text(
          "Profile",
          style: TextStyle(
            color: AppTheme.powderBlue,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 29,
                    backgroundColor: AppTheme.darkColor,
                    child: const Icon(
                      Icons.person_outline,
                      color: AppTheme.powderBlue,
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userDetails.userName!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat.yMMMd().format(userDetails.timestamp!.toDate()),
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.powderBlue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppTheme.powderBlue, width: 0.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 14, 16, 4),
                    child: Text(
                      'ACCOUNT INFO',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.primaryColor,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),

                  // Email
                  ProfileDetails(
                    icon: Icons.mail_outline,
                    label: 'Email address',
                    value:
                        (userDetails.email != null &&
                            userDetails.email!.isNotEmpty)
                        ? userDetails.email!
                        : "Not available",
                    trailing: const Icon(
                      Icons.copy_outlined,
                      size: 18,
                      color: AppTheme.powderBlue,
                    ),
                  ),

                  const Divider(
                    height: 0.5,
                    thickness: 0.5,
                    color: AppTheme.iceBlue,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // Phone  ← remove if not in your model
                  ProfileDetails(
                    icon: Icons.phone_outlined,
                    label: 'Phone number',
                    value:
                        (userDetails.email != null &&
                            userDetails.email!.isNotEmpty)
                        ? userDetails.email!
                        : "Not available",
                    trailing: const Icon(
                      Icons.copy_outlined,
                      size: 18,
                      color: AppTheme.powderBlue,
                    ),
                  ),

                  const Divider(
                    height: 0.5,
                    thickness: 0.5,
                    color: AppTheme.iceBlue,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // Location  ← remove if not in your model
                  ProfileDetails(
                    icon: Icons.location_on_outlined,
                    label: 'Location',
                    value:
                        (userDetails.email != null &&
                            userDetails.email!.isNotEmpty)
                        ? userDetails.email!
                        : "Not found",
                    trailing: const Icon(
                      Icons.chevron_right,
                      size: 18,
                      color: AppTheme.powderBlue,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // TODO: navigate to edit screen
                },
                icon: const Icon(
                  Icons.edit_outlined,
                  color: AppTheme.powderBlue,
                  size: 18,
                ),
                label: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.darkColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.trailing,
  });

  final IconData icon;
  final String label;
  final String value;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.iceBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppTheme.primaryColor, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF888780),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.darkColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
