import 'package:flutter/material.dart';
import 'package:qonta_app/constants/constants.dart';

// class MainView extends StatelessWidget{
//   const MainView({super.key});
class MainView extends StatefulWidget {
  // final String title;
  const MainView({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MainView>{

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
                Expanded(
                child:
                Padding(
            // padding: const EdgeInsets.symmetric(horizontal: 100.0),
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  // margin: EdgeInsets.symmetric(horizontal: 10.0,),
                  padding: EdgeInsets.all(45.0),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    
                    children: [
                      SizedBox(height: 10.0),
                      Text("Tu saldo actual",
                       style: TextStyle(
                         fontSize: 25,
                         color: Colors.black,
                       )),
                      Text("120 s/.",
                       style: TextStyle(
                         fontSize: 30,
                         color: Colors.black,
                       )),
                      SizedBox(height: 20.0),
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
                          'scanner',
                        );
                        },
                        child: const Text(
                          'Scanear voucher',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                       IconButton(
                        icon: Image.asset("assets/images/ocr.png",
                        height: 50,
                        color: null
                        ),
                        onPressed: () {
                          // do something here
                        }),
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
                          'expenses',
                        );
                        },
                        child: const Text(
                          'Ingreso Manual',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),

                      IconButton(
                        icon: Image.asset("assets/images/register.png",
                        height: 50,
                        color: null
                        ),
                        onPressed: () {
                          // do something here
                        }),


                    ],
                  )
                )
                              )          )
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