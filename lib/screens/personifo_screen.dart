import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lesson49/models/person_model.dart';

class PersonInfoScreen extends StatefulWidget {
  const PersonInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonInfoScreen> createState() => _PersonInfoScreenState();
}

class _PersonInfoScreenState extends State<PersonInfoScreen> {
  List<PersonModel> personModelList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 218 + 90,
              // color: Colors.red,
              child: Stack(
                // clipBehavior: Clip.none,
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    width: 400,
                    height: 229,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/image2.png'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
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
                  Positioned(
                    left: 100,
                    right: 100,
                    bottom: 0,
                    child: SizedBox(
                      height: 146,
                      child: Image.asset(
                        'assets/images/_image_ (4).png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Text(
                    personModelList.first.name!,
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff0B1E2D)),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    personModelList.first.status!,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff43D049)),
                  ),
                  SizedBox(height: 36),
                  Text(
                    'Главный протагонист мультсериала «Рик и Морти». Безумный ученый, чей алкоголизм, безрассудность и социопатия заставляют беспокоиться семью его дочери.',
                    style: TextStyle(color: Color(0xff0B1E2D)),
                  ),
                  SizedBox(height: 24),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Пол'),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            personModelList.first.gender!,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 156,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Расса'),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            personModelList.first.species!,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Место рождения'),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            personModelList.first.origin!.name!,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Местоположение'),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            personModelList.first.location!.name!,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Divider(
                    thickness: 0.8,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Row(
                    children: [
                      Text(
                        'Эпизоды',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff0B1E2D)),
                      ),
                      Spacer(),
                      Text(
                        'Все эпизоды',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff828282)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemCount: personModelList.length,
                      separatorBuilder: ((context, index) => SizedBox(
                            height: 10,
                          )),
                      itemBuilder: ((BuildContext, int index) {
                        return InkWell(
                          onTap: () {},
                          child: PersonIfoCard(
                              // episode:personModelList[index].episode!.first.toString(),
                              // name: personModelList[index].name ?? '',
                              // airDate: personModelList[index].,
                              ),
                        );
                      })),
                ],
              ),

              //  Expanded(
              //   child: Column(
              //     children: [
              //       Container(
              //         alignment: Alignment.center,
              //         width: 400,
              //         height: 350,
              //         color: Colors.yellow,
              //         child: Container(
              //           alignment: Alignment.bottomCenter,
              //           width: 400,
              //           height: 229,
              //           child: Padding(
              //             padding: const EdgeInsets.only(top: 20),
              //             child: SizedBox(
              //               height: 146,
              //               child: Image.asset(
              //                 'assets/images/_image_ (4).png',
              //               ),
              //             ),
              //           ),
              //           decoration: BoxDecoration(
              //             image: DecorationImage(
              //               image: AssetImage('assets/images/image2.png'),
              //             ),
              //           ),
              //         ),
              //       ),
              //       Container(
              //         height: 200,
              //         width: 200,
              //         color: Colors.red,
              //       )
              //     ],
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonIfoCard extends StatelessWidget {
  // final String name;
  // final String episode;
  // final String airDate;

  const PersonIfoCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/rick.png',
          width: 74,
          height: 74,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'zczxccc',
              style: TextStyle(
                color: Color(0xff22A2BD),
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'sdfsdf',
              style: TextStyle(
                color: Color(0xff0B1E2D),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'sdfsffs',
              style: TextStyle(
                color: Color(0xff6E798C),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Spacer(),
        Icon(Icons.arrow_forward_ios_rounded)
      ],
    );
  }
}
