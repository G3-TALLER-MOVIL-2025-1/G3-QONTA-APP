import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:qonta_app/constants/constants.dart';

class ScannerView extends StatefulWidget {
  // final String title;
  const ScannerView({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ScannerView> with WidgetsBindingObserver{
  //Camaras disponibles
  List<CameraDescription> cameras = [];
  //Controlador de camara
  CameraController? cameraController;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    super.didChangeAppLifecycleState(state);
    if( cameraController == null || cameraController?.value.isInitialized == false){
      return;
    } 
    if (state == AppLifecycleState.inactive){
      cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed){
      _setupCameraController();
    }
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _setupCameraController();
  }

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                // Container(
                //   // margin: EdgeInsets.symmetric(horizontal: 10.0,),
                //   padding: EdgeInsets.all(90.0),
                //   decoration: BoxDecoration(
                //     color: kBackgroundColor,
                //     borderRadius: BorderRadius.circular(50),
                //   ),
                //   child: Column(
                    
                //     children: [
                      // Text("Enfoca la imagen dentro del cuadro",
                      //  style: TextStyle(
                      //    fontSize: 25,
                      //    color: Colors.black,
                      //  )),
                      _buildUI(),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.pushNamed(context, 'main');
                      //   },
                      //   child: const Text(
                      //     'Salir',
                      //     style: TextStyle(
                      //       fontSize: 20,
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                    //   // ),
                    // ],
                //   )
                // )
                
              ]
              )
          ),
          // Expanded(
          //   child: _buildUI(),
          // ),
          
        ]
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

Future<void> _setupCameraController() async {
  List<CameraDescription> _cameras = await availableCameras();
  if (_cameras.isNotEmpty) {
    setState(() {
      cameras = _cameras;
      cameraController = CameraController(_cameras.first, ResolutionPreset.high);
    });
    cameraController?.initialize().then((_) {
      if(!mounted){
        return;
      }
      setState(() {
        
      });
    }).catchError((Object e) {
      print(e);
    },
    );
  }
}
Widget _buildUI(){
  if(cameraController == null || cameraController?.value.isInitialized == false){
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
  return 
  // SafeArea(
  //   child: SizedBox.expand(
  Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.0),
                      Text("Enfoca la imagen dentro del cuadro",
                       style: TextStyle(
                         fontSize: 20,
                         color: Colors.black,
                       )),
          SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.30,
          width: MediaQuery.sizeOf(context).width * 0.70,
          child: CameraPreview(cameraController!,)
          ),
          IconButton(
           onPressed: () async {
            XFile picture = await cameraController!.takePicture();
            Gal.putImage(picture.path,);
           },
           iconSize: 100, 
           icon: const Icon(
            Icons.camera,
            color: Colors.red,
          ))
        ],
      )
      )
  );
}

}