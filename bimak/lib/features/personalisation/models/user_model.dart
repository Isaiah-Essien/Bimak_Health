import '../../../utils/formatters/formatter.dart';

class UserModel {
  //keep final values which won't be updated

  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  ///Constructor for userModel;
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  ///Helper Function to get the full name.
  String get fullName => '$firstName $lastName';

  ///Helper function to format PhoneNumber
  String get formattedPhoneNumber => MFormatter.formatPhoneNumber(phoneNumber);

  ///Function to split full Name into first and last
  static List<String> nameParts(fullName) => fullName.split(" ");

  ///function to generate username from full Name.
  static String generatedUsername(fullName){
    List<String> nameParts = fullName.split(" ");
    String firstName =nameParts[0].toLowerCase();
    String lastName=nameParts.length>1?nameParts[1].toLowerCase():"";

    String camelCaseUsername='$firstName$lastName';
    String usernameWithPrefix='cwt_$camelCaseUsername';
    return usernameWithPrefix;
  }

  ///function to create empty user model.
  static UserModel empty()=>UserModel(id: '', firstName: '', lastName: '', username: '', email: '', phoneNumber: '', profilePicture: '');

  ///Convert Model to Json structure for Storing data in Firebase.
  Map<String,dynamic> toJson(){
    return{
      'FirstName':firstName,
      'lastName':lastName,
      'username':username,
      'email':email,
      'phoneNumber':phoneNumber,
      'profilePicture':profilePicture,
    };
  }

  ///Factory method to create a UserModel from a firebase document snapshot.
  // factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>>document){
  //   if(document.data() != null){
  //     final data =document.data()!;
  //     return UserModel(
  //       id: document.id,
  //       firstName: data['FirstName'] ??'',
  //       lastName: data['LastName']??'', 
  //       username: data['Username']??'', 
  //       email: data['Email']??'', 
  //       phoneNumber: data['PhoneNumber']??'', 
  //       profilePicture: data['ProfilePicture']??'',
  //     );
  //   }
  // }
}
