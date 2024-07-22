import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();

  Future<UserCredential?> loginWithEmail({
    required String email,
    required String password,
    required String selectedType,
  }) async {
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      var userType = await _getUserType(userCredential.user!.email!);

      if (userType != selectedType) {
        Fluttertoast.showToast(
          msg: 'Incorrect user type selected.',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 17.0,
        );
        return null;
      }

      Fluttertoast.showToast(
        msg: 'Login successful !',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 17.0,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e);
      return null;
    }
  }

  Future<UserCredential?> signUpWithEmailAndPwd({
    required String email,
    required String password,
    required String name,
    required String userType,
  }) async {
    try {
      var userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await userCredential.user?.updateDisplayName(name);
      await _createUserDocument(userCredential, name, userType);

      Fluttertoast.showToast(
        msg: 'Sign-up successful !',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 17.0,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e);
      return null;
    }
  }

  Future<UserCredential?> signInWithGoogle(
      {required String selectedType}) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        Fluttertoast.showToast(
          msg: 'Google sign-in canceled.',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.amber,
          textColor: Colors.white,
          fontSize: 15.0,
        );
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      var userType = await _getUserType(userCredential.user!.email!);
      if (userType != null && userType != selectedType) {
        Fluttertoast.showToast(
          msg: 'Incorrect user type selected.',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 17.0,
        );
        return null;
      }

      await _createUserDocument(
          userCredential, userCredential.user!.displayName!, selectedType);
      Fluttertoast.showToast(
        msg: 'Google sign-in successful !',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      _handleAuthException(e);
      return null;
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
        msg: 'An unexpected error occurred. Please try again.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 15.0,
      );
      return null;
    }
  }

  Future<void> _createUserDocument(
      UserCredential? userCredential, String username, String userType) async {
    if (userCredential != null && userCredential.user != null) {
      CollectionReference collection;
      switch (userType) {
        case 'Student':
          collection = _firestore
              .collection('Users')
              .doc('Students')
              .collection('Students');
          break;
        case 'Professor':
          collection = _firestore
              .collection('Users')
              .doc('Professors')
              .collection('Professors');
          break;
        case 'Academic Staff Member':
          collection = _firestore
              .collection('Users')
              .doc('Academic Staff Members')
              .collection('Academic Staff Members');
          break;
        default:
          throw Exception('Invalid user type');
      }

      await collection.doc(userCredential.user!.uid).set({
        'email': userCredential.user!.email,
        'username': username,
        'userType': userType,
        'timestamp': Timestamp.now(),
      });
    }
  }

  Future<void> updateUsername(String userEmail, String newUsername) async {
    try {
      // Determine the user type first based on their email
      String? userType = await _getUserType(userEmail);
      if (userType == null) {
        throw Exception('User type not found.');
      }

      // Get the collection reference based on user type
      CollectionReference collection;
      switch (userType) {
        case 'Student':
          collection = _firestore
              .collection('Users')
              .doc('Students')
              .collection('Students');
          break;
        case 'Professor':
          collection = _firestore
              .collection('Users')
              .doc('Professors')
              .collection('Professors');
          break;
        case 'Academic Staff Member':
          collection = _firestore
              .collection('Users')
              .doc('Academic Staff Members')
              .collection('Academic Staff Members');
          break;
        default:
          throw Exception('Invalid user type');
      }

      if (newUsername == _firebaseAuth.currentUser!.displayName) {
        Fluttertoast.showToast(
          msg: 'Same username as the current one',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 17.0,
        );
        return;
      }

      QuerySnapshot querySnapshot =
          await collection.where('email', isEqualTo: userEmail).get();
      if (querySnapshot.docs.isNotEmpty) {
        String docId = querySnapshot.docs.first.id;
        await collection.doc(docId).update({
          'username': newUsername,
          'timestamp': Timestamp.now(),
        });
      } else {
        throw Exception('User document not found.');
      }

      await _firebaseAuth.currentUser!.updateDisplayName(newUsername);

      Fluttertoast.showToast(
        msg: 'Username updated successfully to $newUsername!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 17.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Failed to update username. Please try again.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 17.0,
      );
      rethrow;
    }
  }

  Future<void> updateEmail(String newEmail) async {
    User? user = _firebaseAuth.currentUser;
    if (user != null) {
      try {
        await user.verifyBeforeUpdateEmail(newEmail);

        // Update email in Firestore
        String? userType = await _getUserType(user.email!);
        CollectionReference collection;
        switch (userType) {
          case 'Student':
            collection = _firestore
                .collection('Users')
                .doc('Students')
                .collection('Students');
            break;
          case 'Professor':
            collection = _firestore
                .collection('Users')
                .doc('Professors')
                .collection('Professors');
            break;
          case 'Academic Staff Member':
            collection = _firestore
                .collection('Users')
                .doc('Academic Staff Members')
                .collection('Academic Staff Members');
            break;
          default:
            throw Exception('Invalid user type');
        }

        QuerySnapshot querySnapshot =
            await collection.where('email', isEqualTo: user.email).get();
        if (querySnapshot.docs.isNotEmpty) {
          String docId = querySnapshot.docs.first.id;
          await collection.doc(docId).update({
            'email': newEmail,
          });
        } else {
          throw Exception('User document not found.');
        }

        Fluttertoast.showToast(
          msg: 'Verification email sent. Please verify and log in again.',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 17.0,
        );

        // Sign out the user
        await _firebaseAuth.signOut();
      } catch (e) {
        Fluttertoast.showToast(
          msg: 'Failed to update email: ${e.toString()}',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 17.0,
        );
        rethrow;
      }
    } else {
      throw FirebaseAuthException(
        code: 'user-not-logged-in',
        message: 'User is not logged in.',
      );
    }
  }

  Future<void> updatePassword(
      String currentPassword, String newPassword) async {
    try {
      User? user = _firebaseAuth.currentUser;

      // Reauthenticate the user with the current password
      if (user != null) {
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: currentPassword,
        );
        await user.reauthenticateWithCredential(credential);

        // Update the password
        await user.updatePassword(newPassword);
        Fluttertoast.showToast(
          msg: 'Password updated successfully!',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 17.0,
        );
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.message ?? 'Failed to update password. Please try again.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 17.0,
      );
      rethrow;
    }
  }

  Future<void> updatePhoto(BuildContext context) async {
    try {
      final ImageSource? source = await showDialog<ImageSource>(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Select Image Source'),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () =>
                          Navigator.pop(context, ImageSource.camera),
                      child: Text(
                        'Camera',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pop(context, ImageSource.gallery),
                      child: Text(
                        'Gallery',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                  ],
                ),
              ));

      if (source == null) return;

      final XFile? image = await _picker.pickImage(source: source);
      if (image == null) return;

      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        final XFile? compressedImage = await _compressImage(File(image.path));
        if (compressedImage == null) {
          throw Exception('Image compression failed.');
        }

        final String fileName = '${user.uid}.jpg';
        final Reference storageRef =
            _firebaseStorage.ref().child('user_photos/$fileName');
        final UploadTask uploadTask =
            storageRef.putFile(File(compressedImage.path));
        final TaskSnapshot taskSnapshot = await uploadTask;
        final String photoUrl = await taskSnapshot.ref.getDownloadURL();

        await user.updatePhotoURL(photoUrl);

        // Update Firestore
        await _updateUserPhotoInFirestore(user.email!, photoUrl);

        Fluttertoast.showToast(
          msg: 'Profile photo updated successfully!',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 17.0,
        );
      }
    } catch (e) {
      print(e.toString());
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

  Future<XFile?> _compressImage(File file) async {
    final filePath = file.absolute.path;
    final lastIndex = filePath.lastIndexOf('.');
    final outPath = '${filePath.substring(0, lastIndex)}_compressed.jpg';

    final XFile? result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      outPath,
      quality: 85,
    );

    return result;
  }

  Future<void> _updateUserPhotoInFirestore(
      String email, String photoUrl) async {
    String? userType = await _getUserType(email);
    if (userType != null) {
      CollectionReference collection;
      switch (userType) {
        case 'Student':
          collection = _firestore
              .collection('Users')
              .doc('Students')
              .collection('Students');
          break;
        case 'Professor':
          collection = _firestore
              .collection('Users')
              .doc('Professors')
              .collection('Professors');
          break;
        case 'Academic Staff Member':
          collection = _firestore
              .collection('Users')
              .doc('Academic Staff Members')
              .collection('Academic Staff Members');
          break;
        default:
          throw Exception('Invalid user type');
      }

      QuerySnapshot querySnapshot =
          await collection.where('email', isEqualTo: email).get();
      if (querySnapshot.docs.isNotEmpty) {
        String docId = querySnapshot.docs.first.id;
        await collection.doc(docId).update({
          'photoUrl': photoUrl,
          'timestamp': Timestamp.now(),
        });
      } else {
        throw Exception('User document not found.');
      }
    } else {
      throw Exception('User type not found.');
    }
  }

  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
      Fluttertoast.showToast(
        msg: 'Logout successful!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 17.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'An error occurred during logout. Please try again.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 17.0,
      );
    }
  }

  Future<String?> _getUserType(String email) async {
    QuerySnapshot querySnapshot = await _firestore
        .collectionGroup('Students')
        .where('email', isEqualTo: email)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first['userType'] as String?;
    }

    querySnapshot = await _firestore
        .collectionGroup('Professors')
        .where('email', isEqualTo: email)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first['userType'] as String?;
    }

    querySnapshot = await _firestore
        .collectionGroup('Academic Staff Members')
        .where('email', isEqualTo: email)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first['userType'] as String?;
    }

    return null;
  }

  void _handleAuthException(FirebaseAuthException e) {
    String message = '';
    switch (e.code) {
      case 'invalid-email':
        message = 'The email address is not valid.';
        break;
      case 'invalid-credential':
        message = 'One of the credentials is invalid.';
        break;
      case 'user-disabled':
        message = 'The user account has been disabled.';
        break;
      case 'user-not-found':
        message = 'No user found for that email.';
        break;
      case 'wrong-password':
        message = 'Wrong password provided.';
        break;
      case 'email-already-in-use':
        message = 'The email address is already in use by another account.';
        break;
      case 'operation-not-allowed':
        message = 'Email/password accounts are not enabled.';
        break;
      case 'weak-password':
        message = 'The password is too weak.';
        break;
      case 'network-request-failed':
        message = 'Network error. Please try again later.';
        break;
      default:
        message = e.code;
    }
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      fontSize: 17.0,
    );
  }
}
