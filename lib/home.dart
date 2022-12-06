import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'base_network.dart';
import 'match.dart';


class Utama extends StatefulWidget {
  const Utama({Key? key}) : super(key: key);

  @override
  State<Utama> createState() => _UtamaState();
}

class _UtamaState extends State<Utama> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Piala Dunia 2022"),
            automaticallyImplyLeading: true,
            backgroundColor: Colors.blue,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            padding: EdgeInsets.all(8),
            child: FutureBuilder(
              future: BaseNetwork.get("matches"),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasError) {
                  return _buildErrorSection();
                }
                if (snapshot.hasData) {
                  MatchesModel matchesModel = MatchesModel.fromJson(snapshot.data);
                  return _buildSuccessSection(matchesModel);
                }
                return _buildLoadingSection();
              },
            ),
          ),
        )
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(MatchesModel data) {
    return ListView.builder(
        itemCount: 48,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
              },
              child: Text(data.homeTeam!.name!)
          );
        }
    );
  }
}