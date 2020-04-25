import 'dart:convert';
import 'package:coronatrackingapp/pages/countryPage.dart';
import 'package:coronatrackingapp/panels/infoPanel.dart';
import 'package:coronatrackingapp/panels/worldwidepanel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DataSource.dart';
import 'package:http/http.dart' as http;
import 'package:coronatrackingapp/panels/mosteffectedcountries.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePState();
}

class _HomePState extends State<HomePage> {
  Map worlddata;

  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worlddata = json.decode(response.body);
    });
  }

  List countryData;

  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldWideData();
    fetchCountryData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID 19 TRACKER'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 100,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10.0),
            color: Colors.orange[100],
            child: Text(
              DataSource.quote,
              style: TextStyle(
                  color: Colors.orange[800],
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Worldwide",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: primaryblack,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CountryPage()));
                        },
                        child: Text(
                      "Regional",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ))),
              ],
            ),
          ),
          worlddata == null
              ? LinearProgressIndicator()
              : WorldWidePanel(
                  worldData: worlddata,
                ),
          SizedBox(
            width: 40.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Text(
              "Most Affected Countries",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          countryData == null
              ? LinearProgressIndicator()
              : MostAffectedPanel(
                  CountryData: countryData,
                ),
          InfoPanel(),
          SizedBox(
            height: 20.0,
          ),
          Center(
              child: Text(
            "WE ARE TOGETHER IN THE FIGHT",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          )),
          SizedBox(
            height: 50.0,
          )
        ],
      ),
    );
  }
}
