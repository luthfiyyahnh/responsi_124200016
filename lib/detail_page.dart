import 'package:flutter/material.dart';


class PageDetailMatches extends StatefulWidget {
  const PageDetailMatches({Key? key}) : super(key: key);

  @override
  State<PageDetailMatches> createState() => _PageDetailMatchesState();
}

class _PageDetailMatchesState extends State<PageDetailMatches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),

        ),
        title: Text("Piala Dunia 2022", style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
