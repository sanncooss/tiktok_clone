import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/models/user.dart' as model;

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<File?> _pickedImage; 
  
  File? get profilePhot => _pickedImage.value;

  
  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      Get.snackbar(
        'Profile picture',
        'You have succesfully selected your profile picture',
      );
    }
    _pickedImage = Rx<File?>(
      File(pickedImage!.path),
    );
  }

  //upload to firebase storage
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // registering the user
  void registerUser(
      String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          image != null &&
          username.isNotEmpty) {
        // save our user to our ath and firebase database
        UserCredential userCredential =
            await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String downloadUrl = await _uploadToStorage(image);
        model.User user = model.User(
          name: username,
          profilePhoto: downloadUrl,
          email: email,
          uid: userCredential.user!.uid,
        );
        await firestore.collection('users').doc(userCredential.user!.uid).set(
              user.toJson(),
            );
      } else {
        Get.snackbar(
          'Error creating an account',
          'Please enter all fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error creating an account',
        e.toString(),
      );
    }
  }
}
