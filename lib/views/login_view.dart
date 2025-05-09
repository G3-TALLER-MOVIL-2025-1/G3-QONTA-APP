import 'package:flutter/material.dart';
import 'package:qonta_app/constants/constants.dart';

class LoginView extends StatelessWidget{
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      
                      SizedBox(height: 10.0),
                      _textFieldEmail(),
                      SizedBox(height: 10.0),
                      _textFieldPassword(),
                      SizedBox(height: 30.0),
                      
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                          context,
                          'main',
                        );
                        },
                        child: const Text(
                          'Ingresar',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
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
    );
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