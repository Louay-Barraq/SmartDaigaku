import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.verifyBeforeUpdateEmail(newEmail);
        await user.reload();
        user = _firebaseAuth.currentUser;
      } else {
        throw FirebaseAuthException(
          code: 'user-not-logged-in',
          message: 'User is not logged in.',
        );
      }

      // Update email in Firestore
      String? userType = await _getUserType(user!.email!);
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
            await collection.where('email', isEqualTo: user!.email!).get();
        if (querySnapshot.docs.isNotEmpty) {
          String docId = querySnapshot.docs.first.id;
          await collection.doc(docId).update({
            'email': newEmail,
            'timestamp': Timestamp.now(),
          });
        } else {
          throw Exception('User document not found.');
        }
      } else {
        throw Exception('User type not found.');
      }

      Fluttertoast.showToast(
        msg: 'Email updated successfully!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 17.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Failed to update email: ${e.toString()}',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 17.0,
      );
      rethrow;
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
