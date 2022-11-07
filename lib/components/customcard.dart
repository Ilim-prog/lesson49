import 'package:flutter/material.dart';

class CustormCard extends StatelessWidget {
  final bool isGrid;

  const CustormCard({
    Key? key,
    required this.isGrid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isGrid
        ? Column(
            children: [
              CircleAvatar(
                  backgroundImage: AssetImage('assets/images/image1).png'),
                  radius: 60),
              SizedBox(
                height: 18,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "живой",
                    style: TextStyle(
                      color: Color(0xff27AE60),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    "Рик Санчез",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 3),
                  Text(
                    "Человек, Мужской",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              )
            ],
          )
        : Row(
            children: [
              CircleAvatar(
                  backgroundImage: AssetImage('assets/images/image1).png'),
                  radius: 40),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "живой",
                    style: TextStyle(
                      color: Color(0xff27AE60),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Рик Санчез",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Человек, Мужской",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          );
  }
}
