import 'package:flutter/material.dart';
import 'package:qonta_app/constants/constants.dart';
import '../models/user.dart';
import '../utils/user_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qonta_app/views/main_view.dart';
import 'package:qonta_app/views/login_view.dart';
import 'package:provider/provider.dart';
import '../viewmodels/register_viewmodel.dart';

// class RegisterView extends StatelessWidget{
//   const RegisterView({super.key});

class RegisterView extends StatefulWidget {
  // final String title;
  const RegisterView({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<RegisterView>{
  // User? users;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
   

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
      builder: (context, viewModel, _) => Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          SizedBox.expand(
            child: Image.asset(
              'assets/images/bg1.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.topRight,
            ),
          ),
          // Capa de oscurecimiento
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // Contenido centrado
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'QONTA',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor, // Verde institucional
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20.0),
                      Text("Completa tus datos personales",
                       style: TextStyle(
                         fontSize: 20,
                         color: Colors.black,
                       )),
                      SizedBox(height: 10.0),
                      // _textFieldName(),
                      // SizedBox(height: 10.0),
                      // _textFieldLastName(),
                      // SizedBox(height: 10.0),
                      // _textFieldEmail(),
                      // SizedBox(height: 10.0),
                      // _textFieldPassword(),
                      // SizedBox(height: 10.0),
                      // _textField(),
                       Form(
                        key: _formKey,
                        child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                      //   const Text(
                      //   'Iniciar Sesión',
                      //   style: TextStyle(
                      //   fontSize: 28,
                      //   fontWeight: FontWeight.bold,
                      //   color: Colors.indigo,
                      //   ),
                      //  ),

                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                        controller: _nameController,
                         style: TextStyle(color: Colors.black,
                        fontSize: 20
                        ),
                        decoration:  InputDecoration(
                        labelText: 'Nombre',
                        labelStyle: TextStyle(
                         color: Colors.white,
                        fontSize: 20,
                        ),
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        fillColor: kFieldColor,
                        filled: true,
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su nombre';
                          }
                          // final emailRegex = RegExp(r'^\S+@\S+\.\S+$');
                          // if (!emailRegex.hasMatch(value)) {
                          //   return 'Ingrese un correo válido';
                          // }
                          return null;
                        },

                      onChanged: (val) => viewModel.name = val,

                      ),
                      ),
                        const SizedBox(height: 20),
                        Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                        controller: _lastnameController,
                         style: TextStyle(color: Colors.black,
                        fontSize: 20
                        ),
                        decoration:  InputDecoration(
                        labelText: 'Apellido',
                        labelStyle: TextStyle(
                         color: Colors.white,
                        fontSize: 20,
                        ),
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        fillColor: kFieldColor,
                        filled: true,
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su correo';
                          }
                          // final emailRegex = RegExp(r'^\S+@\S+\.\S+$');
                          // if (!emailRegex.hasMatch(value)) {
                          //   return 'Ingrese un correo válido';
                          // }
                          return null;
                        },

                      onChanged: (val) => viewModel.lastname = val,

                      ),
                        ),

                        const SizedBox(height: 20),
                        Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                        controller: _emailController,
                         style: TextStyle(color: Colors.black,
                        fontSize: 20
                        ),
                        decoration:  InputDecoration(
                        labelText: 'Correo electrónico',
                        labelStyle: TextStyle(
                         color: Colors.white,
                        fontSize: 20,
                        ),
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        fillColor: kFieldColor,
                        filled: true,
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su correo';
                          }
                          final emailRegex = RegExp(r'^\S+@\S+\.\S+$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Ingrese un correo válido';
                          }
                          return null;
                        },

                      onChanged: (val) => viewModel.em = val,

                      ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextFormField(
                        controller: _passwordController,
                         style: TextStyle(color: Colors.black,
                        fontSize: 20
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                        labelText: 'Contraseña',
                        prefixIcon: Icon(Icons.lock),
                        labelStyle: TextStyle(
                        color: Colors.white,
                        // borderRadius: BorderRadius.circular(25),
                        fontSize: 20,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.00),
                        ),
                        // fillColor: kFieldColor,
                        fillColor: kFieldColor,
                        filled: true,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su contraseña';
                          }
                          if (value.length < 4) {
                            return 'La contraseña debe tener al menos 4 caracteres';
                          }
                          return null;
                        },

                      onChanged: (val) => viewModel.pass = val,
                      ),
                        ),
                      SizedBox(height: 10.0),
                      ListTile(
                        leading: Icon(Icons.check_box_outlined),
                        title: Text(
                          "Acepto los términos y condiciones",

                        ),
                        
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        ),
                           onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                          final success = await viewModel.saveUser();
                          if (success != 0) {
                            // SharedPreferences pref = await SharedPreferences.getInstance();
                            UserPreferences.instance.preferences!.setInt('usersid', success);
                            // pref.setInt('usersid', success);
                            // print('Navigator: '+usersid.toString());
                            // Navigator.pushReplacement(
                            // context,
                            // MaterialPageRoute(
                            // builder: (_) => const
                            // MainView(),
                            // ),
                            // );
                             showDialog(
                  //if set to true allow to close popup by tapping out of the popup
                  barrierDismissible: false, 
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                             backgroundColor: kBackgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32.0))),
                            contentPadding: EdgeInsets.all(10.0),
                            content: Stack(
                            children: <Widget>[
                            Container(
                            width: 200,
                            height: 200,
                            child:Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text("!Usuario registrado!", style:TextStyle(fontSize: 30.0,color: Colors.black)),
                              )//
                            ),
                          ),
                        //   InkWell(
                        //   child: Container(
                        //     padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                        //     decoration: BoxDecoration(
                        //       color:kBackgroundColor,
                        //       borderRadius: BorderRadius.only(
                        //       bottomLeft: Radius.circular(32.0),
                        //       bottomRight: Radius.circular(32.0)),
                        //     ),
                        //     child:  Text(
                        //     "OK",
                        //       style: TextStyle(color: Colors.black,fontSize: 25.0),
                        //       textAlign: TextAlign.center,
                        //     ),
                        //   ),
                        //   onTap:(){
                        //     Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //     builder: (_) => const
                        //     LoginView(),
                        //     ),
                        //     );
                        //   },
                        // ),
                             Positioned(
                              top: 0.0,
                              right: 0.0,
                              child: FloatingActionButton(
                                child: Image.asset("assets/images/cross.png"),
                                onPressed: (){
                                Navigator.pop(context);
                                },
                                // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
                                backgroundColor: kBackgroundColor,
                                mini: true,
                                elevation: 0.0,
                              ),
                            ), 
                            ]
                          )
                          )
                          );

                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content:
                              Text('Usuario existente')),
                            );
                          }
                      }
                      },
                        child: const Text(
                          'Registrar',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      )
                        ]
                      ), 
                       ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '¿Ya tienes una cuenta? ',
                          style: TextStyle(color: Colors.black,fontSize: 20,),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                            context,
                            'login',
                        );
                          },
                          child: const Text(
                            'Ingresar',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                       
                  ],
                  )
                )
                
              ]
            )
          )
        ],  
      )
    )
      ));
  }
Widget _textFieldName() {
  return _textFieldGeneral(
    labelText: 'Nombres',
    onChanged: (value) {},
    );
}
Widget _textFieldLastName() {
  return _textFieldGeneral(
    labelText: 'Apellidos',
    onChanged: (value) {},
    );
}
Widget _textFieldEmail() {
  return _textFieldGeneral(
    labelText: 'Correo',
    onChanged: (value) {},
    );
}
Widget _textFieldPassword() {
  return _textFieldGeneral(
    labelText: 'Contraseña',
    onChanged: (value) {},
  );
}
Widget _textField() {
  return _textFieldGeneral(
    labelText: 'Repite Contraseña',
    onChanged: (value) {},
    );
}

}

class _textFieldGeneral extends StatelessWidget {
  final String labelText;
  // final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  const _textFieldGeneral({
    required this.labelText,
    // this.keyboardType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
      horizontal: 30.0,
    ),
    decoration: BoxDecoration(
      color: kFieldColor,
      borderRadius: BorderRadius.circular(25),
    ),
    child: TextField(
      // keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onChanged: onChanged,
    ),
    );
  }

}