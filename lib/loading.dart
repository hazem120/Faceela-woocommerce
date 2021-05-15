import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class iPhoneXRXSMax111 extends StatelessWidget {
  iPhoneXRXSMax111({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        brightness: Brightness.dark,
        title: Text(
          'Faceela shop',
          style: TextStyle(fontSize: 30),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 193.0, middle: 0.4612),
            Pin(size: 193.0, start: 110.0),
            child:
                // Adobe XD layer: '1' (shape)
                Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(145.0),
                image: DecorationImage(
                  image: const AssetImage('assets/images/logo1.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Pinned(child: SpinKitFadingFour(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.amber : Colors.red,
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
