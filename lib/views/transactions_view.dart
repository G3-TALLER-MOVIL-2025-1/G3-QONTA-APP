import 'package:flutter/material.dart';
import 'package:qonta_app/constants/constants.dart';
import 'package:qonta_app/models/transaction.dart';

class TransactionsView extends StatefulWidget {
  // final String title;
  const TransactionsView({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TransactionsView> {
  List<Transaction> transactions = getTransactions();

  static List<Transaction> getTransactions() {
    const data = [
      {
        "amount": 120.0,
        "date": "2025-05-05",
        "state": 'Egreso'
      },
      {
        "amount": 80.0,
        "date": "2025-04-25",
        "state": 'Ingreso'
      },
      {
        "amount": 20.0,
        "date": "2025-03-16",
        "state": 'Egreso'
      },
      {
        "amount": 1100.0,
        "date": "2025-02-20",
        "state": 'Ingreso'
      },
      {
        "amount": 340.0,
        "date": "2025-01-01",
        "state": 'Egreso'
      },
      {
        "amount": 120.0,
        "date": "2025-05-05",
        "state": 'Egreso'
      },
      {
        "amount": 80.0,
        "date": "2025-04-25",
        "state": 'Ingreso'
      },
      {
        "amount": 20.0,
        "date": "2025-03-16",
        "state": 'Egreso'
      },
      {
        "amount": 1100.0,
        "date": "2025-02-20",
        "state": 'Ingreso'
      },
      {
        "amount": 340.0,
        "date": "2025-01-01",
        "state": 'Egreso'
      },
      {
        "amount": 80.0,
        "date": "2025-04-25",
        "state": 'Ingreso'
      },
      {
        "amount": 20.0,
        "date": "2025-03-16",
        "state": 'Egreso'
      },
      {
        "amount": 1100.0,
        "date": "2025-02-20",
        "state": 'Ingreso'
      },
      {
        "amount": 340.0,
        "date": "2025-01-01",
        "state": 'Egreso'
      },
      
    ];
    return data.map<Transaction>(Transaction.fromJson).toList();
  }

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
                const SizedBox(height: 40),
               
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
                      "Estado",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                      ),
                  ],
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     color: kBackgroundColor,
                //     borderRadius: BorderRadius.circular(50),
                //   ),
                //   child: buildTransactions(transactions),
                // )
                Expanded(
                  child: buildTransactions(transactions),

                  ),
                 
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
  Widget buildTransactions(List<Transaction> transactions) => ListView.builder(
    itemCount: transactions.length,
    itemBuilder: (context, index) {
      final transaction = transactions[index];
      return Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(
            transaction.amount.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
            ),
          Text(
            transaction.date.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
            ),
          Text(
            transaction.state,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
            ),
        ],
        )
      );
    },
  );
}