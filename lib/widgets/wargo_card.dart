import 'package:flutter/material.dart';
import 'package:wargo/screens/shoplist_form.dart';
import '../screens/menu.dart';

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

          if (item.name == "Tambah Item") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShopFormPage()));
          }
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