import 'package:flutter/material.dart';
import 'package:qonta_app/constants/constants.dart';

class ExpenseView extends StatefulWidget {
  // final String title;
  const ExpenseView({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ExpenseView> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.transparent,
      //   elevation: 0.0,),
      key: _scaffoldKey,
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
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.5),Colors.black.withOpacity(0.1)],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              ),
            ),
          ),
          const SizedBox(height: 40),

          Padding(
            // padding: const EdgeInsets.symmetric(horizontal: 100.0),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    IconButton(
                      iconSize: 50,
                      icon: Icon(Icons.menu, color: kBackgroundColor),
                      onPressed:
                          () => _scaffoldKey.currentState?.openEndDrawer(),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Ingreso Manual',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      // SizedBox(height: 10.0),
                      _textFieldAmount(),
                      SizedBox(height: 10.0),
                      _textFieldDate(),
                      SizedBox(height: 10.0),
                      _textFieldExpense(),
                      SizedBox(height: 80.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'main');
                        },
                        child: const Text(
                          'Salir',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(220),
            topLeft: Radius.circular(220),
          ),
          side: BorderSide.none,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(child: Container(color: Colors.transparent)),
            ListTile(
              title: Text('Inicio', style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.pushNamed(
                        context,
                        'main',
                );
              },
            ),
            ListTile(
              title: Text('Perfil', style: TextStyle(fontSize: 20)),
              onTap: () {},
            ),
            ListTile(
              title: Text('Escanear', style: TextStyle(fontSize: 20)),
              onTap: () {},
            ),
            ListTile(
              title: Text('Ingreso Manual', style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.pushNamed(
                        context,
                        'main',
                );
              },
            ),
            ListTile(
              title: Text('Historial', style: TextStyle(fontSize: 20)),
              onTap: () {
                Navigator.pushNamed(
                        context,
                        'transactions',
                );
              },
            ),
            ListTile(
              title: Text('Cerrar Sesión', style: TextStyle(fontSize: 20)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFieldAmount() {
    return _textFieldGeneral(labelText: 'Cantidad', onChanged: (value) {});
  }

  Widget _textFieldDate() {
    return _textFieldGeneral(labelText: 'Fecha', onChanged: (value) {});
  }

  Widget _textFieldExpense() {
    return _textFieldGeneral(
      labelText: 'Tipo de Egreso',
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
      margin: EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
        color: kFieldColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        // keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
