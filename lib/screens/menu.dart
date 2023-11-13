import 'package:flutter/material.dart';
import 'package:wargo/widgets/left_drawer.dart';
import 'package:wargo/widgets/wargo_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<WargoItem> items = [
    WargoItem("Lihat Item", Icons.checklist),
    WargoItem("Tambah Item", Icons.add_shopping_cart),
    WargoItem("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wargo',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor:Colors.cyan,
      ),
      drawer: const LeftDrawer(),

      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Wargo Inventory', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((WargoItem item) {
                  // Iterasi untuk setiap item
                  return WargoCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WargoItem {
  final String name;
  final IconData icon;

  WargoItem(this.name, this.icon);
}

