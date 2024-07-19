
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/popups/loaders.dart';
import '../models/user_model.dart';

class UserController extends GetxController{
  static UserController get instance =>Get.find();

  final userRepository=Get.put(UserRepository());

  ///Save user record from any Registration provider
  Future<void> saveUserRecord(UserCredential?userCredentials)async{
    try{
      if(userCredentials!=null){
        //convert Name to First and Last Name
        final nameParts = UserModel.nameParts(userCredentials.user!.displayName??'');
        final username=UserModel.generatedUsername(userCredentials.user!.displayName??'');

        //Map the data
        final user=UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length>1?nameParts.sublist(1).join(' '):'',
            username: username,
            email: userCredentials.user!.email??'',
            phoneNumber: userCredentials.user!.phoneNumber??'',
            profilePicture: userCredentials.user!.photoURL??''
        );

        //Save User data
        await userRepository.saveUserRecord(user);
      }
    }catch(e){
      MLoaders.warningSnackBar(
          title: 'Data not saved',
          message: 'Something went wrong while saving your information. You can re-save your data in your profile'
      );
    }
  }
}