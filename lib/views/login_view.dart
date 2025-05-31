import 'package:flutter/material.dart';
import 'package:qonta_app/constants/constants.dart';
import 'package:qonta_app/views/main_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../viewmodels/login_viewmodel.dart';
import 'package:provider/provider.dart';

// class LoginView extends StatelessWidget{
//   const LoginView({super.key});

class LoginView extends StatefulWidget {
  // final String title;
  const LoginView({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<LoginView>{
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
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
          Padding(
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
                      Text("Bienvenido a QONTA",
                       style: TextStyle(
                         fontSize: 20,
                         color: Colors.black,
                       )),
                      
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

                        TextFormField(
                        controller: _emailController,
                        style: TextStyle(color: Colors.black,
                        fontSize: 20
                        ),
                        decoration:  InputDecoration(
                        labelText: 'Correo electrónico',
                        labelStyle: TextStyle(
                         color: Colors.black,
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

                      onChanged: (val) => viewModel.email = val,

                      ),

                        const SizedBox(height: 20),

                        TextFormField(
                        controller: _passwordController,
                         style: TextStyle(color: Colors.black,
                        fontSize: 20
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                        labelText: 'Contraseña',
                        prefixIcon: Icon(Icons.lock),
                        labelStyle: TextStyle(
                        color: Colors.black,
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

                      onChanged: (val) => viewModel.password = val,
                      ),

                      const SizedBox(height: 30),
                      viewModel.isLoading ? const CircularProgressIndicator() : ElevatedButton(
                           style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                        ),
                          onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                          final success = await viewModel.validateLogin();
                          if (success) {
                            SharedPreferences pref = await SharedPreferences.getInstance();
                            int? usersid = pref.getInt('usersid');
                            print('Navigator: '+usersid.toString());
                            Navigator.pushReplacement(
                            context,

                            MaterialPageRoute(
                            builder: (_) => const
                            MainView(),
                            ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content:
                              Text('Credenciales inválidas')),
                            );
                          }
                      }
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal:
                        32, vertical: 12),
                        child: Text('Ingresar',  style: TextStyle(fontSize: 18, color: Colors.white),),
                      ),
                      ),
                      ],
                      ),
                      ),
                      // SizedBox(height: 10.0),
                      // _textFieldEmail(),
                      // SizedBox(height: 10.0),
                      // _textFieldPassword(),
                      // SizedBox(height: 30.0),
                      
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //   backgroundColor: kPrimaryColor,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(25),
                      //   ),
                      //   ),
                      //   onPressed: () {
                      //     Navigator.pushNamed(
                      //     context,
                      //     'main',
                      //   );
                      //   },
                      //   child: const Text(
                      //     'Ingresar',
                      //     style: TextStyle(fontSize: 18, color: Colors.white),
                      //   ),
                      // ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'No tienes una cuenta? ',
                          style: TextStyle(color: Colors.black,fontSize: 20,),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                            context,
                            'register',
                        );
                          },
                          child: const Text(
                            'Registrar',
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
    ) ));
  }

Widget _textFieldEmail() {
  return _textFieldGeneral(
    labelText: 'Email',
    onChanged: (value) {},
    );
}
Widget _textFieldPassword() {
  return _textFieldGeneral(
    labelText: 'Contraseña',
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