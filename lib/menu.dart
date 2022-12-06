import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsi_124200016/source.dart';

import 'match.dart';

class Menu extends StatefulWidget {
  const Menu ({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
      body: Container(
        child: FutureBuilder(
            future: MatchesSource.instance.LoadMatches(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
              if (snapshot.hasError) {
                return _buildErrorSection();
              }
              if (snapshot.hasData) {
                return _buildSuccessSection(snapshot.data);
              }
              return _buildLoadingSection();
            }
        ),
      ),
    );
  }

  Widget _buildErrorSection(){
    return Text("Error");
  }
  Widget _buildLoadingSection(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(List<dynamic> data){
    return ListView.builder(
      itemCount: 54,
      itemBuilder: (BuildContext context, int index){
        MatchesModel matchesModel = MatchesModel.fromJson(data[index]);
        return InkWell(
          onTap: ( ) {},
          child: Container(
            height: 100,
            width: 200,
            child: Card(
              child:   Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      width: 60,
                      height: 35,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.network('https://countryflagsapi.com/png/${matchesModel!.homeTeam!.name!}'))),
                  Text(("${matchesModel!.homeTeam!.name!}")),
                  Text(("${matchesModel!.homeTeam!.goals!}")),
                  Text('-'),
                  Text(("${matchesModel!.awayTeam!.goals!}")),
                  Text(("${matchesModel!.awayTeam!.name!}")),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      width: 60,
                      height: 20,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.network('https://countryflagsapi.com/png/${matchesModel!.awayTeam!.name!}'))),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
