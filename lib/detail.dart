import 'package:flutter/material.dart';
import 'package:woocommerce/woocommerce.dart';

class Details extends StatefulWidget {
  // final product;

  // const Details(data, {Key key, this.product}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final WooProduct product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
    );
  }
}
