import 'package:flutter/material.dart';
import 'infoPanel.dart';

class MostAffectedPanel extends StatelessWidget{
  final List CountryData;

  const MostAffectedPanel({Key key, this.CountryData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child:ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          child: Row(
            children: <Widget>[
              Image.network(CountryData[index]['countryInfo']['flag'],height: 30.0,),
              SizedBox(width: 10.0,),
              Text(CountryData[index]['country'],style: TextStyle(fontWeight: FontWeight.bold,)),
              SizedBox(width: 10.0,),
              Text('Deaths: ${CountryData[index]['deaths'].toString()}',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold, ),)
            ],
          ),
        );
      },
      itemCount: 5,
      ));
  }
}