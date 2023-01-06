import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectos_flutter/validation_form/provider/login_provider.dart';
import 'package:proyectos_flutter/validation_form/utilidades/pattern.dart';


class ValidationFormPage extends StatelessWidget {
  late TextEditingController controllerName,
                             controllerEmail,      
                             controllerPhone;
 
 
  @override
  Widget build(BuildContext context) {

   final loginForm =  Provider.of<LoginFormProvider>(context);
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width/2,
        child: Form(
          key: loginForm.formKey,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children:  [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => loginForm.correo = value,
                decoration: const InputDecoration(
                  labelText: "Email"
                ),
                validator: (value){
                  print("${loginForm.correo} - hola");
                  return validador("email").hasMatch(value ?? "") ? null: "El valor no es válido";
                },
              ),
              const SizedBox(height: 10,),
                 TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      labelText: "Nombre"
                    ),
                    validator: (value){
                  print("}- hola");
                      return (value!.isNotEmpty) ? null: "El valor no es válido";
                    },
              ),
              const SizedBox(height: 10,),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Phone"
                ),
                validator: (phone){
                      return validador("phone").hasMatch(phone ?? "") ? null: "El valor no es número";
                    },
              ),
            ],
          ),
        ),
      ),
    );
  }
}