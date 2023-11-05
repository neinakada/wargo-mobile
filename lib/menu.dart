import 'package:flutter/material.dart';

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

class WargoCard extends StatelessWidget {
  final WargoItem item;

  const WargoCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    var btnColor;
    if (item.name.compareTo("Lihat Item") == 0) {
      btnColor= Colors.orange;
    }
    else if (item.name.compareTo("Tambah Item") == 0) {
      btnColor= Colors.cyan;
    }
    else if (item.name.compareTo("Logout") == 0) {
      btnColor= Colors.red;
    }

    return Material(
      color: btnColor,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}