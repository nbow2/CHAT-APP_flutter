import 'package:vertion_1_0_chat/model/myuser.dart';

abstract class  RegisterNavigator{
  void showLoading();
  void hideLoading();
  void showMessage(String message);
  void navigateToHome(MyUser user);

}

