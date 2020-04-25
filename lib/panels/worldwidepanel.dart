import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  final Map worldData;

  const WorldWidePanel({Key key, this.worldData}) : super(key: key);
  @override
  Widget build(BuildContext context)  {
    // TODO: implement createState
    return Container(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          StatusPanel(
            title: 'CONFIRMED',
            panelcolor: Colors.red[100],
            textcolor: Colors.red,
            count: worldData['cases'].toString(),
          ),
          StatusPanel(
            title: 'ACTIVE',
            panelcolor: Colors.blue[100],
            textcolor: Colors.blue[900],
            count: worldData['active'].toString(),
          ),
          StatusPanel(
            title: 'RECOVERED',
            panelcolor: Colors.green[100],
            textcolor: Colors.green,
            count: worldData['recovered'].toString(),
          ),
          StatusPanel(title: 'DEATHS',
            panelcolor: Colors.grey[400],
            textcolor: Colors.grey[900],
            count: worldData['deaths'].toString(),)
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {
  final Color panelcolor;
  final Color textcolor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelcolor, this.textcolor, this.title, this.count}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 80.0,
      width: width/2,
      color: panelcolor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: textcolor),), Text(count,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: textcolor),)
        ],
      ),
    );
  }

}
