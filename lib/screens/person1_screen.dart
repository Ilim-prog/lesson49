import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson49/components/customcard.dart';
import 'package:lesson49/models/episode_model.dart';
import 'package:lesson49/models/person_model.dart';
import 'package:lesson49/screens/bloc/person_bloc.dart';
import 'package:lesson49/screens/person_card.dart';
import 'package:lesson49/screens/personifo_screen.dart';

class Person1Screen extends StatefulWidget {
  const Person1Screen({
    super.key,
  });

  // final String title;

  @override
  State<Person1Screen> createState() => _Person1ScreenState();
}

class _Person1ScreenState extends State<Person1Screen> {
  late PersonBloc bloc;
  List<PersonModel> personModelList = [];
  // int _counter = 0;
  final ValueNotifier<bool> _isGrid = ValueNotifier<bool>(true);

  @override
  void initState() {
    bloc = PersonBloc();
    bloc.add(GetPersonsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   _isGrid.value = !_isGrid.value;
      // }),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.grey[200]),
          child: TextField(
            keyboardType: TextInputType.text,
            controller: TextEditingController(),
            obscureText: true,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: 'Найти персонажа',
              hintStyle: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xff5B6975),
              ),
              suffixText: '|',
              suffixStyle: TextStyle(
                color: Colors.grey,
              ),
              suffixIcon: Container(
                width: 40,
                // color: Colors.red,
                child: Row(
                  children: [
                    Text('|'),
                    Icon(
                      Icons.filter_alt,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<PersonBloc, PersonState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is PersonFetchedState) {
            personModelList = state.personModelList;
          }

          if (state is PersonErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error.message ?? '')));
          }
        },
        builder: (context, state) {
          if (state is PersonLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: ValueListenableBuilder(
              valueListenable: _isGrid,
              builder: (context, value, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 29),
                    child: Row(
                      children: [
                        Text(
                          'Всего персонажей: ${personModelList.length}',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff828282)),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            _isGrid.value = !_isGrid.value;
                            // _isGrid.value = true;
                          },
                          child: _isGrid.value
                              ? Image.asset(
                                  'assets/images/colon.png',
                                  width: 24,
                                  height: 24,
                                )
                              : Image.asset(
                                  'assets/images/menu.png',
                                  color: Color(0xff5B6975),
                                  width: 24,
                                  height: 24,
                                ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: _isGrid.value
                        ? GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 24,
                              childAspectRatio:
                                  _isGrid.value ? 164 / 192 : 343 / 74,
                              crossAxisCount: 2,
                            ),
                            itemCount: personModelList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PersonInfoScreen()));
                                },
                                child: PersonCard(
                                  isGrid: true,
                                  image: personModelList[index].image ?? '',
                                  name: personModelList[index].name ?? '',
                                  status: personModelList[index].status ?? '',
                                  species: personModelList[index].species ?? '',
                                  gender: personModelList[index].gender ?? '',
                                ),
                              );
                            })
                        : ListView.builder(
                            itemCount: personModelList.length,

                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PersonInfoScreen()));
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  child: PersonCard(
                                    isGrid: false,
                                    image: personModelList[index].image ?? '',
                                    name: personModelList[index].name ?? '',
                                    status: personModelList[index].status ?? '',
                                    species:
                                        personModelList[index].species ?? '',
                                    gender: personModelList[index].gender ?? '',
                                  ),
                                ),
                              );
                            },

                            // children:GridView.count(
                            //   padding: const EdgeInsets.all(20),
                            //   crossAxisSpacing: 16,
                            //   mainAxisSpacing: 24,
                            //   childAspectRatio: _isGrid.value ? 164 / 192 : 343 / 74,
                            //   crossAxisCount: _isGrid.value ? 2 : 1,
                            //   children: <Widget>[
                            //     CustormCard(isGrid: _isGrid.value),
                            // Container(
                            //   padding: const EdgeInsets.all(8),
                            //   color: Colors.teal[200],
                            //   child: const Text('Heed not the rabble'),
                            // ),
                            // Container(
                            //   padding: const EdgeInsets.all(8),
                            //   color: Colors.teal[300],
                            //   child: const Text('Sound of screams but the'),
                            // ),
                            // Container(
                            //   padding: const EdgeInsets.all(8),
                            //   color: Colors.teal[400],
                            //   child: const Text('Who scream'),
                            // ),
                            // Container(
                            //   padding: const EdgeInsets.all(8),
                            //   color: Colors.teal[500],
                            //   child: const Text('Revolution is coming...'),
                            // ),
                            // Container(
                            //   padding: const EdgeInsets.all(8),
                            //   color: Colors.teal[600],
                            //   child: const Text('Revolution, they...'),
                            // ),
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
