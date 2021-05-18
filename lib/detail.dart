import 'package:faceelawoo/description.dart';
import 'package:flutter/material.dart';
import 'package:woocommerce/woocommerce.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_html/html_parser.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final WooProduct product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[600],
          title: Text(
            product.name,
            style: TextStyle(color: Colors.grey[200]),
          ),
        ),
        body: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: SizedBox(
                height: 260,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(product.images[0].src),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                'short description',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    spreadRadius: 5,

                    offset: Offset(3, 3), // changes position of shadow
                  ),
                ], borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Html(
                  data: product.shortDescription,
                  style: {
                    'html': Style(
                      color: Colors.grey[800],
                      fontSize: FontSize.xLarge,
                    ),
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  color: Colors.red[400],
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(),
                        settings: RouteSettings(
                          arguments: product,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'full description',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[200],
                          spreadRadius: 5,

                          offset: Offset(3, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      '${product.price} US',
                      style: TextStyle(color: Colors.grey[800], fontSize: 20),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue[800],
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Add to card',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
