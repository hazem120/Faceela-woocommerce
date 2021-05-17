import 'package:faceelawoo/detail.dart';
import 'package:faceelawoo/loading2.dart';
import 'package:flutter/material.dart';
import 'woocommerce.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      //appbar
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          size: 39,
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
              ),
              onPressed: () {})
        ],
        centerTitle: true,
        title: Text(
          'Faceela shop',
          style: TextStyle(
              fontSize: 30,
              color: Colors.grey[100],
              fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              image: DecorationImage(
                  image: AssetImage('assets/images/Transfile.jpeg'),
                  fit: BoxFit.fill)),
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 9, 0, 0),
        child: FutureBuilder(
            future: WoocommerceApi().getMyProducts(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              while (!snapshot.hasData) {
                return Loading();
              }
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            spreadRadius: 5,

                            offset: Offset(3, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Image.network(
                                    snapshot.data[index].images[0].src),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(3, 30, 3, 5),
                                  child: Column(
                                    children: [
                                      Text(
                                        snapshot.data[index].name,
                                        style: TextStyle(fontSize: 19),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        '${snapshot.data[index].price} US',
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      RaisedButton(
                                        child: Text(
                                          'see detailes',
                                          style: TextStyle(
                                              color: Colors.grey[200],
                                              fontSize: 20),
                                        ),
                                        color: Colors.redAccent[200],
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(30.0),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Details(),
                                              settings: RouteSettings(
                                                  arguments:
                                                      snapshot.data[index]),
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
