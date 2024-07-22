// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:smart_daigoku/auth/auth_service.dart';
import 'package:smart_daigoku/components/drawer.dart';
import '../themes/theme_provider.dart';
import 'initial_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final String _currentPage = 'Settings';
  final AuthService _authService = AuthService();
  final User? user = FirebaseAuth.instance.currentUser;

  void _updateUsername(BuildContext context, String userEmail) {
    TextEditingController usernameController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update Username"),
          content: TextField(
            controller: usernameController,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              hintText: "Enter username",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                String newUsername = usernameController.text.trim();

                if (newUsername.isEmpty) {
                  // Handle empty username case if needed
                  Fluttertoast.showToast(
                    msg: 'Username cannot be empty!',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.SNACKBAR,
                    backgroundColor: Colors.redAccent,
                    textColor: Colors.white,
                    fontSize: 17.0,
                  );
                  return;
                }

                if (newUsername.length < 3) {
                  // Handle username length requirement
                  Fluttertoast.showToast(
                    msg:
                        'Username must be longer than or equal to 3 characters!',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.SNACKBAR,
                    backgroundColor: Colors.redAccent,
                    textColor: Colors.white,
                    fontSize: 17.0,
                  );
                  return;
                }

                try {
                  // Call the authentication service to update username
                  await _authService.updateUsername(userEmail, newUsername);

                  // Optionally, reload the user to get the updated username
                  await user?.reload();

                  // Close the dialog
                  Navigator.of(context).pop();
                } catch (e) {
                  return;
                }
              },
              child: Text(
                "Update",
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _updateEmail(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    TextEditingController emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Update Email'),
        content: TextField(
          controller: emailController,
          decoration: InputDecoration(hintText: "Enter new email"),
        ),
        actions: [
          TextButton(
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text(
              'Update',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            onPressed: () async {
              String newEmail = emailController.text.trim();
              if (newEmail.isNotEmpty) {
                await authService.updateEmail(newEmail);
                Navigator.pop(context);

                // Show warning dialog
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Email Updated'),
                    content:
                        Text('You will be signed out. Please log in again.'),
                    actions: [
                      TextButton(
                        child: Text(
                          'OK',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          authService.logout();
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => InitialPage()),
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                );
              } else {
                Fluttertoast.showToast(
                  msg: 'Please enter a valid email.',
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.SNACKBAR,
                  backgroundColor: Colors.amber,
                  textColor: Colors.white,
                  fontSize: 17.0,
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void _updatePassword(BuildContext context) {
    TextEditingController currentPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Update Password"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: currentPasswordController,
                obscureText: true,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: "Current password",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              TextField(
                controller: newPasswordController,
                obscureText: true,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: "New password",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                String currentPassword = currentPasswordController.text.trim();
                String newPassword = newPasswordController.text.trim();

                if (newPassword.isEmpty || newPassword.length < 6) {
                  // Handle empty or short password case
                  Fluttertoast.showToast(
                    msg: 'New password must be at least 6 characters!',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.SNACKBAR,
                    backgroundColor: Colors.redAccent,
                    textColor: Colors.white,
                    fontSize: 17.0,
                  );
                  return;
                }

                if (newPassword == currentPassword) {
                  // Handle empty or short password case
                  Fluttertoast.showToast(
                    msg: 'New password is the same as the old password!',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.SNACKBAR,
                    backgroundColor: Colors.redAccent,
                    textColor: Colors.white,
                    fontSize: 17.0,
                  );
                  return;
                }

                try {
                  // Call the authentication service to update the password
                  await _authService.updatePassword(
                      currentPassword, newPassword);
                  Navigator.of(context).pop();
                } catch (e) {
                  // Error handling already done in updatePassword method
                  return;
                }
              },
              child: Text(
                "Update",
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _updateProfilePhoto(
      BuildContext context, AuthService authService) async {
    try {
      await authService.updatePhoto(context);
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Failed to update profile photo: ${e.toString()}',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 17.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isGoogleUser = user?.providerData
            .any((userInfo) => userInfo.providerId == 'google.com') ??
        false;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: AppDrawer(currentPage: _currentPage),
      appBar: AppBar(
        title: Text("S E T T I N G S"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Personal",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _SettingsListTile(
                  context,
                  title: 'Update Username',
                  subtitle: 'Revamp your unique handle',
                  icon: Icons.drive_file_rename_outline,
                  onTap: () => _updateUsername(context, user!.email!),
                ),
                if (!isGoogleUser)
                  _SettingsListTile(
                    context,
                    title: 'Update Email',
                    subtitle: 'Refresh your contact email',
                    icon: Icons.email,
                    onTap: () {
                      _updateEmail(context);
                    },
                  ),
                // Only show this tile for email/password users
                if (!isGoogleUser)
                  _SettingsListTile(
                    context,
                    title: 'Update Password',
                    subtitle: 'Secure your account with a new password',
                    icon: Icons.password,
                    onTap: () => _updatePassword(context),
                  ),
                _SettingsListTile(
                  context,
                  title: 'Update Profile Photo',
                  subtitle: 'Show the world your new look',
                  icon: Icons.photo,
                  onTap: () => _updateProfilePhoto(context, _authService),
                ),

                Divider(height: 30, indent: 10, endIndent: 30),
                // SizedBox(height: 20),
                Text(
                  "Theme Settings",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 75,
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    color: Provider.of<ThemeProvider>(context).isDarkMode
                        ? Theme.of(context).colorScheme.inversePrimary
                        : Theme.of(context).colorScheme.primary,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .inversePrimary
                            .withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(Icons.photo_size_select_actual_outlined),
                      title: Text(
                        "Change Theme",
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      subtitle: Text(
                        "Customize the app's appearance",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      trailing: Container(
                        height: 30,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 3,
                            color: Provider.of<ThemeProvider>(context)
                                    .isDarkMode
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/color_wheel.png',
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 75,
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    color: Provider.of<ThemeProvider>(context).isDarkMode
                        ? Theme.of(context).colorScheme.inversePrimary
                        : Theme.of(context).colorScheme.primary,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .inversePrimary
                            .withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Dark Mode",
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Switch(
                          value:
                              Provider.of<ThemeProvider>(context, listen: false)
                                  .isDarkMode,
                          onChanged: (value) =>
                              Provider.of<ThemeProvider>(context, listen: false)
                                  .toggleTheme(),
                        ),
                      ),
                    ],
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

Container _SettingsListTile(BuildContext context,
    {required String title,
    required String subtitle,
    required IconData icon,
    Function()? onTap}) {
  return Container(
    height: 75,
    width: MediaQuery.of(context).size.width - 40,
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: Provider.of<ThemeProvider>(context).isDarkMode
          ? Theme.of(context).colorScheme.inversePrimary
          : Theme.of(context).colorScheme.primary,
      border: Border.all(),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 7,
          offset: Offset(0, 5),
        ),
      ],
    ),
    child: GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon, size: 40),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    ),
  );
}
