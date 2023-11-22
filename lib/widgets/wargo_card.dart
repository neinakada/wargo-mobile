import 'package:flutter/material.dart';
import 'package:wargo/screens/shoplist_form.dart';
import 'package:wargo/screens/menu.dart';
import 'package:wargo/screens/list_product.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:wargo/screens/login.dart';

class WargoCard extends StatelessWidget {
  final WargoItem item;

  const WargoCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

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
        onTap: () async {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Tambah Item") {
            // TODO: Gunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ShopFormPage()));
          }
          else if (item.name == "Lihat Item") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProductPage()));
          }
          else if (item.name == "Logout") {
            final response = await request.logout(
              // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                "http://127.0.0.1:8000/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
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