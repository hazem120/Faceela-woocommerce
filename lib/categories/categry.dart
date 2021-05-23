import 'package:faceelawoo/detail.dart';
import 'package:faceelawoo/loading2.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/html_parser.dart';
import 'package:faceelawoo/woocommerce.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    final product_category = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      //appbar****
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                size: 25,
              ),
              onPressed: () {})
        ],
        centerTitle: true,
        title: Text('Faceela shop',
            style: GoogleFonts.koHo(
              fontSize: 30,
            )),
        toolbarHeight: 60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              image: DecorationImage(
                  image: AssetImage('assets/images/purple.jpeg'),
                  fit: BoxFit.fill)),
        ),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 9, 0, 0),
        child: FutureBuilder(
            future: WoocommerceApi(category: product_category).getMyProducts(),
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
                                Container(
                                  padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
                                  child: FadeInImage(
                                    placeholder:
                                        AssetImage('assets/images/place2.png'),
                                    image: snapshot.data[index].images[0].src ==
                                            null
                                        ? AssetImage('assets/images/place2.png')
                                        : NetworkImage(
                                            snapshot.data[index].images[0].src),
                                  ),
                                ),

                                // Image.network(
                                //     snapshot.data[index].images[0].src),
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
                                            color: Colors.red[800]),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      RaisedButton(
                                        child: Text('see detailes',
                                            style: GoogleFonts.ubuntu(
                                                fontSize: 20,
                                                color: Colors.white)),
                                        color: Colors.deepPurple[400],
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
                                                arguments: snapshot.data[index],
                                              ),
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
