import 'package:flutter/material.dart';
import 'package:woocommerce/woocommerce.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
// import 'package:flutter_html/html_parser.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WooProduct product = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Full description'),
        backgroundColor: Colors.grey[600],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Html(
          data: product.description,
          style: {
            'html': Style(fontSize: FontSize.large),
            'div': Style(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                fontSize: FontSize.medium),
            'table': Style(backgroundColor: Colors.grey.shade200),
            'td': Style(
              backgroundColor: Colors.grey.shade400,
              padding: EdgeInsets.all(10),
            ),
            'th': Style(padding: EdgeInsets.all(10), color: Colors.black),
            'tr': Style(
                backgroundColor: Colors.grey.shade300,
                border: Border(bottom: BorderSide(color: Colors.greenAccent))),
          },
        ),
      ),
    );
  }
}
