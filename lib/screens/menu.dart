import 'package:quest99/widgets/left_drawer.dart';
import 'package:quest99/widgets/item_card.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Quest> items = [
    Quest("Open Backpack", Icons.checklist, Colors.blueGrey.shade600),
    Quest("Add Items", Icons.add_shopping_cart, Colors.purple.shade900),
    Quest("Logout", Icons.logout, Colors.brown.shade800),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Quest Backpack',
        ),
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.redAccent,
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
                  'Check Your Item Before Back To The Quest', // Text yang menandakan toko
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
                children: items.map((Quest item) {
                  // Iterasi untuk setiap item
                  return QuestCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}