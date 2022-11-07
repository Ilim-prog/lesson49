import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  final String species;
  final String image;
  final String name;
  final String gender;
  final String status;
  final bool isGrid;
  const PersonCard({
    Key? key,
    required this.name,
    required this.gender,
    required this.status,
    required this.image,
    required this.species,
    required this.isGrid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: isGrid
          ? Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Image.network(
                    image,
                    width: 120,
                    height: 123,
                  ),
                ),
                // SizedBox(height: 10),
                Text(
                  status,
                  style: TextStyle(
                    color: getColor(status),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 3),
                Text(
                  '${gender},${species}',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    image,
                    width: 73,
                    height: 73,
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      status,
                      style: TextStyle(
                        color: getColor(status),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '${gender},${species}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}

getColor(String status) {
  switch (status) {
    case 'Alive':
      return Colors.green;

    case 'Dead':
      return Colors.red;

    case 'unknown':
      return Colors.black;

    default:
      return Colors.black;
  }
}
