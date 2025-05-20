import 'package:flutter/material.dart';
import 'package:qonta_app/constants/constants.dart';

// class MainView extends StatelessWidget{
//   const MainView({super.key});
class ProfileView extends StatefulWidget {
  // final String title;
  const ProfileView({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<ProfileView>{

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
            // color: Colors.black.withOpacity(0.5),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
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
                  icon: Icon(Icons.menu,color:kBackgroundColor),
                  onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
                ),
                  ]
                ),
                // const SizedBox(height: 40),
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: 10.0,),
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                     ListTile(
                      leading: Icon(Icons.account_circle, size: 80,),
                      title: Text('Juan Diego Flores Martinez',style: TextStyle(
                         fontSize: 25,
                         color: Colors.black,
                       )),
                      subtitle: Text('juandmar@gmail.com',style: TextStyle(
                         fontSize: 20,
                         color: Colors.black,
                       )),
                     ),
                     const SizedBox(height: 50),
                      Text('Saldo actual',style: TextStyle(
                         fontSize: 25,
                         color: Colors.black,
                       ),
                       textAlign: TextAlign.left),
                       Text('120 S/.',style: TextStyle(
                         fontSize: 25,
                         color: Colors.black,
                       )),
                       const SizedBox(height: 50),
                       Text('Último ingreso',style: TextStyle(
                         fontSize: 25,
                         color: Colors.black,
                       ),
                       textAlign: TextAlign.left,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text('120 S/.',style: TextStyle(
                         fontSize: 25,
                         color: Colors.black,
                       )),
                       Text('16/05/2025',style: TextStyle(
                         fontSize: 25,
                         color: kPrimaryColor,
                       )),
                        ],),
                        const SizedBox(height: 50),
                       Text('Último egreso',style: TextStyle(
                         fontSize: 25,
                         color: Colors.black,
                       ),
                       textAlign: TextAlign.left,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Text('80 S/.',style: TextStyle(
                         fontSize: 25,
                         color: Colors.black,
                       )),
                       Text('10/05/2025',style: TextStyle(
                         fontSize: 25,
                         color: Colors.red,
                       )),
                        ],)
                    ],
                  )
                )
              ]
            )
          )
        ],
      ),
      endDrawer: Drawer(
        
        shape: RoundedRectangleBorder(
           borderRadius: 
            BorderRadius.only(bottomLeft: Radius.circular(220), topLeft: Radius.circular(220)),
            side: BorderSide.none,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Container(color:Colors.transparent),
            ),
            ListTile(
              title: Text('Inicio', style: TextStyle(fontSize: 20),),
              onTap: () {
                Navigator.pushNamed(
                        context,
                        'main',
                );
              },
            ),
            ListTile(
              title: Text('Perfil', style: TextStyle(fontSize: 20),),
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
              title: Text('Ingreso Manual', style: TextStyle(fontSize: 20),),
              onTap: () {
                Navigator.pushNamed(
                        context,
                        'expenses',
                );
              },
            ),
            ListTile(
              title: Text('Historial', style: TextStyle(fontSize: 20),),
              onTap: () {
                Navigator.pushNamed(
                        context,
                        'transactions',
                );
              },
            ),
            ListTile(
              title: Text('Cerrar Sesión', style: TextStyle(fontSize: 20),),
              onTap: () {
                Navigator.pushNamed(
                        context,
                        'welcome',
                );
              },
            ),
          ]
        )
      ),
    );
  }


}