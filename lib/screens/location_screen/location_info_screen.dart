import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LocationInfoScreen extends StatefulWidget {
  const LocationInfoScreen({Key? key}) : super(key: key);

  @override
  State<LocationInfoScreen> createState() => _LocationInfoScreenState();
}

class _LocationInfoScreenState extends State<LocationInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Stack(
            // clipBehavior: Clip.none,
            children: [
              Expanded(
                child: Container(
                  width: 400,
                  height: 312,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/planetu.png',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 0,
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: 395,
            height: 490.90,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Text('dcfdvdvdv'),
                SizedBox(
                  height: 20,
                ),
                Text('dvdvdvdv'),
                SizedBox(
                  height: 20,
                ),
                Text('dfvdfdvdvvdfvdvdvdvdvdvdvdvdvdvdvdvdvvddvvdvdvdv'),
                SizedBox(
                  height: 40,
                ),
                Text('dfvdfdvdvvdfvdvdvdvdvdvdvdvdvdvdvdvdvvddvvdvdvdv'),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        child: Container(
                          width: 200,
                          height: 78,
                          color: Colors.amber,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.amber, Colors.blue, Colors.yellow])),
          ),
        ],
      ),
    );
  }
}
