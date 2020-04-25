import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _countryPageState();
}

// ignore: camel_case_types
class _countryPageState extends State<CountryPage> {

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
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Country Stats'),
        ),
        body: countryData == null ? Center(child: CircularProgressIndicator()) :
        ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    height: 130.0,
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey[100],
                          blurRadius: 10.0,
                          offset: Offset(0, 10))
                    ]),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                countryData[index]['country'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Image.network(
                                countryData[index]['countryInfo']['flag'],
                                height: 50.0,
                                width: 60.0,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('CONFIRMED: ${countryData[index]['cases'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                                Text('ACTIVE: ${countryData[index]['active'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
                                Text('RECOVERED: ${countryData[index]['recovered'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green)),
                                Text('DEATHS: ${countryData[index]['deaths'].toString()}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[800]),),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: countryData == null ? 0 : countryData.length,
              ));
  }
}
