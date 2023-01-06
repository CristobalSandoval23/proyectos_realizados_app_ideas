import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{
    GlobalKey<FormState> formKey = GlobalKey<FormState>();  
    String email = "";
    String correo = "";
    
    bool isValidForm(){
      print(email);
      return  formKey.currentState?.validate() ?? false;
    }
}