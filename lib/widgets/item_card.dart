import 'package:quest99/screens/item_list.dart';
import 'package:flutter/material.dart';
import 'package:quest99/screens/menu.dart';
import 'package:quest99/screens/item_form.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:quest99/widgets/item_card.dart';

import '../screens/login.dart';

class Quest {
  final String name;
  final IconData icon;
  final Color color;

  Quest(this.name, this.icon, this.color);
}

class QuestItem {
  final String name;
  final String description;
  final String category;
  final int amount;




  QuestItem({
    required this.name,
    required this.description,
    required this.category,
    required this.amount,

  });
}

class QuestCard extends StatelessWidget {
  final Quest item;

  const QuestCard(this.item, {super.key}); // Constructor

  @override
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        // Area responsif terhadap sentuhan
        onTap: () async {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Add Items") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ItemFormPage()));
          } else if (item.name == "Open Backpack") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ItemPage()));
          } else if (item.name == "Logout") {
            final response = await request.logout(
                "https://natanael-bonaparte-tugas.pbp.cs.ui.ac.id/");
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