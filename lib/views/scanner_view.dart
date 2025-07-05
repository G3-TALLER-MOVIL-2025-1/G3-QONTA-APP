import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:qonta_app/constants/constants.dart';
//for File
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:qonta_app/models/category.dart';
import 'package:qonta_app/models/transaction.dart';
import '../services/api_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qonta_app/viewmodels/search_viewmodel.dart';
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
  final _formKey = GlobalKey<FormState>();
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
  Transaction transaction = new Transaction(amount: "", category: null, description: "", date: "");


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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(height: 35.0),
                      // Padding(padding: EdgeInsets.symmetric(horizontal: 25),
                      // child: Text("Enfoca la imagen dentro del cuadro",
                      //  style: TextStyle(
                      //    fontSize: 30,
                      //    color: Colors.black,
                      //  ))),
          // SizedBox(
          // height: MediaQuery.sizeOf(context).height * 0.30,
          // width: MediaQuery.sizeOf(context).width * 0.70,
          // child: CameraPreview(cameraController!,)
          // ),
          IconButton(
           onPressed: () async {
              final ImagePicker picker = ImagePicker();
              final XFile? picture = await picker.pickImage(source: ImageSource.gallery);

            // XFile picture = await cameraController!.takePicture();
            // Gal.putImage(picture.path,);
            // File? imageToOCR = File(picture.path);
            // MultipartFile multipartFile = await MultipartFile.fromFile(
            //   picture.path,
            //   // filename: xfile.name, // Optional: Custom file name
            // );
            // FormData formData = FormData.fromMap({
            //   'image': multipartFile,
            // });
            print("AFTER FILE");
            //Machine Learning API to process image
            ApiService as = new ApiService();
            
            final List<Category> categories = await as.getCategories();
            String? category;
            String? categoryId = null;
            List<Category> finalCategories = [];
            print("aaaaffffaaaaa");
            for (var i = 0; i < categories.length; i++) {
              // StrfinalCategories.add(finalCategories[i].categoryName!);
              print(categories[i].categoryName);
            }
            for (var i = 0; i < categories.length; i++) {
              var currentElement = categories[i];
              
              for (var j = i+1; j < categories.length; j++) {
                if(currentElement.categoryName == categories[j].categoryName){
                  categories[j].categoryName = "x";
                  
                }
              }
              if(currentElement.categoryName != "x"){
                finalCategories.add(currentElement);
              }
            }
            print("FFFFFFFFFFFFFFFFF");
            List<String> StrfinalCategories = [];
            for (var i = 0; i < finalCategories.length; i++) {
              StrfinalCategories.add(finalCategories[i].categoryName!);
              print(finalCategories[i].categoryName);
            }
            // bool x = await as.getAmountFromImage(picture);
            print("AFTER GETTING AMOUNT");
            // SearchViewmodel svm = new SearchViewmodel();
            double amountFromOCR = await double.parse(await as.getAmountFromImage(picture!));
            // print(" AMOUNT ${amountFromOCR}");
            transaction.amount = amountFromOCR.toString();
            showDialog(
                  //if set to true allow to close popup by tapping out of the popup
                  barrierDismissible: false, 
                  context: context,
                  builder: (BuildContext context) => 
                    Dialog(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(6, 6),
                        spreadRadius: 2,
                        blurStyle: BlurStyle.solid,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Align(
                          alignment: Alignment.topRight,
                          child: CloseButton(),
                        ),
                        const Center(
                          child: Text(
                            "!Escanéo exitoso!",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black,),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Cantidad",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                           style: TextStyle(color: Colors.black,
                        fontSize: 20
                        ),
                          readOnly: true,
                          initialValue: amountFromOCR.toString(),
                          onChanged: (value) {
                            //Apply api

                            transaction.amount = amountFromOCR.toString();
                          },
                          validator: (value) =>
                              value!.isEmpty ? 'Please enter a task title' : null,
                        ),
                        const Text(
                          "Categoria",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey[400]!),
                          ),
                          child: DropdownButtonFormField<String>(
                            value: category,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                            ),
                            isExpanded: true,
                            items: StrfinalCategories.map((String category) {
                              return DropdownMenuItem<String>(
                                value: category,
                                child: Text(category,
                                style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                for (var i = 0; i < finalCategories.length; i++) {
                                  if(value == finalCategories[i].categoryName){
                                    categoryId = finalCategories[i].categoryId;
                                  }
                                }
                                print("IDDD: ${categoryId}");
                                category = value;
                              });
                            },
                            validator: (value) =>
                                value == null ? 'Please select a category' : null,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Fecha",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            // labelText: (new DateTime(new DateTime.now().year, new DateTime.now().month, new DateTime.now().day)).toString()
                          ),
                           style: TextStyle(color: Colors.black,
                        fontSize: 20
                        ),
                          initialValue: (new DateTime(new DateTime.now().year, new DateTime.now().month, new DateTime.now().day)).toString(),
                          onChanged: (value) {
                            value = (new DateTime(new DateTime.now().year, new DateTime.now().month, new DateTime.now().day)).toString();
                            transaction.date = (new DateTime(new DateTime.now().year, new DateTime.now().month, new DateTime.now().day)).toString();
                          },
                          // validator: (value) =>
                          //     value!.isEmpty ? 'Please enter a task title' : null,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Descripcion",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                           style: TextStyle(color: Colors.black,
                        fontSize: 20
                        ),
                          onChanged: (value) {
                            transaction.description = value;
                          },
                          validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ingrese una descripcion';
                              }
                              return null;
                          }
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print("TRANSACTION ${transaction.amount} ${transaction.description}");
                                final success = as.saveExpenseFromOCR(transaction, categoryId);
                                Navigator.of(context).pop();
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  const WidgetStatePropertyAll(kPrimaryColor),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Guardar',
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            );
           },
          //  iconSize: 100, 
          //  icon: const Icon(
          //   Icons.camera,
          //   color: Colors.red,
          // )
          icon: Image.asset("assets/images/ocr.png",
          height: 50,
          color: null
          )
          ),
        ]
      )
      )
  );
}

}