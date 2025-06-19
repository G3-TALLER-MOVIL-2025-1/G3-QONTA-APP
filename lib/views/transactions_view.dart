import 'package:flutter/material.dart';
import 'package:qonta_app/constants/constants.dart';
import 'package:qonta_app/models/transaction.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../viewmodels/search_viewmodel.dart';
import 'package:provider/provider.dart';
import '../utils/user_preferences.dart';
import '../main.dart';

class TransactionsView extends StatefulWidget {
  // final String title;
  const TransactionsView({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TransactionsView> {
  // List<Transaction> transactions = getTransactions();

  // static List<Transaction> getTransactions() {
    // const data = [
    //   {
    //     "amount": 120.0,
    //     "date": "2025-05-05",
    //     "state": 'Egreso'
    //   },
    //   {
    //     "amount": 80.0,
    //     "date": "2025-04-25",
    //     "state": 'Ingreso'
    //   },
    //   {
    //     "amount": 20.0,
    //     "date": "2025-03-16",
    //     "state": 'Egreso'
    //   },
    //   {
    //     "amount": 1100.0,
    //     "date": "2025-02-20",
    //     "state": 'Ingreso'
    //   },
    //   {
    //     "amount": 340.0,
    //     "date": "2025-01-01",
    //     "state": 'Egreso'
    //   },
    //   {
    //     "amount": 120.0,
    //     "date": "2025-05-05",
    //     "state": 'Egreso'
    //   },
    //   {
    //     "amount": 80.0,
    //     "date": "2025-04-25",
    //     "state": 'Ingreso'
    //   },
    //   {
    //     "amount": 20.0,
    //     "date": "2025-03-16",
    //     "state": 'Egreso'
    //   },
    //   {
    //     "amount": 1100.0,
    //     "date": "2025-02-20",
    //     "state": 'Ingreso'
    //   },
    //   {
    //     "amount": 340.0,
    //     "date": "2025-01-01",
    //     "state": 'Egreso'
    //   },
    //   {
    //     "amount": 80.0,
    //     "date": "2025-04-25",
    //     "state": 'Ingreso'
    //   },
    //   {
    //     "amount": 20.0,
    //     "date": "2025-03-16",
    //     "state": 'Egreso'
    //   },
    //   {
    //     "amount": 1100.0,
    //     "date": "2025-02-20",
    //     "state": 'Ingreso'
    //   },
    //   {
    //     "amount": 340.0,
    //     "date": "2025-01-01",
    //     "state": 'Egreso'
    //   },
      
    // ];
    // const data = [];
    // return data.map<Transaction>(Transaction.fromJson).toList();
  // }
  
  
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static int? usersid;
  // @override
  // void initState() {
  //   name();
  //   super.initState();
  // }
  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //   // await this.updateUI();
  //   name();  
  //   // setState(() { });        
  // });
  // }
  // void getUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     usersid = prefs.getInt('usersid');  
  //     print('set'+usersid.toString());
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    usersid = UserPreferences.instance.preferences!.getInt('usersid');
    // name();
    print('wuidget'+usersid.toString());
    return ChangeNotifierProvider(
      create: (_) => SearchViewmodel()..loadTransactions(usersid),
      child: Consumer<SearchViewmodel>(
      builder: (context, viewModel, _) => Scaffold(
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
                Expanded(
                child: 
                Container(
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(25),
                ),  
                child: Column(
                children: [  
                SizedBox(height: 15),
                Padding(
            // padding: const EdgeInsets.symmetric(horizontal: 100.0),
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(
                      "Historial",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                      ),
                      ),
                    IconButton(
                        icon: Image.asset("assets/images/pdf.png",
                        height: 50,
                        color: null
                        ),
                        onPressed: () {
                          // do something here
                          
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
                                child: Text("¡Archivo Exportado!", style:TextStyle(fontSize: 30.0,color: Colors.black)),
                              )//
                            ),
                          ),
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
                        }),
                  ],
                ),
                ),
                Padding(
            // padding: const EdgeInsets.symmetric(horizontal: 100.0),
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: 
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                      color: kFieldColor,
                      // borderRadius: BorderRadius.circular(25),
                      borderRadius: BorderRadius.only(bottomLeft: Radius.zero, bottomRight: Radius.zero,
                      topLeft: Radius.circular(25), topRight: Radius.circular(25))
                    ),  
                    child:
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(
                      "Monto",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                      ),
                    Text(
                      "Fecha",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                      ),
                    Text(
                      "Categ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                      ),
                  ],
                ),)
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     color: kBackgroundColor,
                //     borderRadius: BorderRadius.circular(50),
                //   ),
                //   child: buildTransactions(transactions),
                // )

                viewModel.isLoading ? const CircularProgressIndicator() : Expanded(
                  child: buildTransactions(viewModel.all),
                  
                  ),
                ]),)
                )


              ]
            ),
           ),
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
    ) ), );

  }
  Widget buildTransactions(List<Transaction> transactions) => 
  
    Padding(
            // padding: const EdgeInsets.symmetric(horizontal: 100.0),
            // padding: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 0),
    child: Container( 
    padding: EdgeInsets.all(5.0),
    decoration: BoxDecoration(
      color: kFieldColor,
      // borderRadius: BorderRadius.circular(25),
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25),
      topLeft: Radius.zero, topRight: Radius.zero)
    ),  
    
    child: ListView.builder(
      
    itemCount: transactions.length,
    itemBuilder: (context, index) {
      final transaction = transactions[index];
      return Card(
        elevation: 0,
        color: Colors.transparent,
        child: 
        ColoredBox(
        color: kFieldColor, // <-- Red color provided to below Row
        child: 
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(
            "${transaction.amount.toString()} S/.",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),
          Text(
            transaction.date.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),
          Text(
            // transaction.description,
            "${transaction.category.toString().substring(0,4)}.",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),
        ],
        ))
      );
    },
  )
    )
    )
    ;
}