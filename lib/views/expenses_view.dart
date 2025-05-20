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
  // final items = ['Soles', 'Dólares'];
  // String? value;
  List<String> items = ['Soles', 'Dólares'];
  String? selectedItem = 'Soles';
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
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Ingreso Manual',
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                      // SizedBox(height: 10.0),
                      // Align(
                      // alignment: Alignment.centerLeft,
                      // child: DropdownButton<String>(
                      //   value: value,
                      //   iconSize: 36,
                      //   isExpanded: false,
                      //   icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                      //   //isExpanded: true,
                      //   items: items.map(buildMenuItem).toList(),
                      //   onChanged: (value) => setState(() => this.value = value),
                      // )
                        // child: 
                        DropdownButton(
                          hint: Text('Moneda', style: TextStyle(fontSize: 20)),
                          value: selectedItem,
                          items: items.map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item, style: TextStyle(fontSize: 20))
                          ))
                          .toList(),
                          onChanged: (item) => setState(() => selectedItem = item),
                          ),
                      // ),
                      _textFieldAmount(),
                      SizedBox(height: 10.0),
                      _textFieldDate(),
                      SizedBox(height: 10.0),
                      _textFieldExpense(),
                      SizedBox(height: 80.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        ),
                        onPressed: () {
                          // Registrar
                        },
                        child: const Text(
                          'Registrar',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Align(
                      alignment: Alignment(0.0, 1.0),  
                      child:
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
                      ),)
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
              onTap: () {
                 Navigator.pushNamed(
                        context,
                        'profile',
                );
              },
            ),
            ListTile(
              title: Text('Escanear', style: TextStyle(fontSize: 20)),
              onTap: () {
                 Navigator.pushNamed(
                        context,
                        'scanner',
                );
              },
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
              onTap: () {
                Navigator.pushNamed(
                        context,
                        'welcome',
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
  //   value: item,
  //   child: Text(
  //     item,
  //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  //   ),
  // );

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
