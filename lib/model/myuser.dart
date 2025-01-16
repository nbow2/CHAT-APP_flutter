class MyUser{
  static const String CollectionName = 'users';
  String id ;
  String firstName;
  String lastName;
   String userName;
   String Email;

   MyUser({
    required this.id ,
     required this.Email ,
     required this.userName ,
     required this.firstName ,
     required this.lastName
    });

   MyUser.formJason(Map<String,dynamic> json) :this(
     id: json["id"] as String ,
     firstName: json["first_name"] as String,
     lastName: json["last_name"] as String,
     Email: json["email"] as String,
     userName: json["user_name"] as String
   );


   Map<String,dynamic> toJason(){
     return {
       "id":id,
       "first_name":firstName,
       "last_name":lastName,
       "user_name":userName,
       "email":Email
     };

   }


}

