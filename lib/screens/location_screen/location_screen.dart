import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson49/models/location_model.dart';
import 'package:lesson49/screens/bloc/person_bloc.dart';
import 'package:lesson49/screens/location_screen/bloc/location_bloc.dart';
import 'package:lesson49/screens/location_screen/location_info_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late LocationBloc bloc;
  List<LocationModel> locationModelList = [];

  @override
  void initState() {
    bloc = LocationBloc();
    bloc.add(GetLocationsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              hintText: 'Найти локацию',
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
      body: BlocConsumer<LocationBloc, LocationState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is LocationFetchedState) {
            locationModelList = state.locationModelList;
          }

          if (state is LocationErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error.message ?? '')));
          }
        },
        builder: (context, state) {
          if (state is PersonLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Всего персонажей: ${locationModelList.length}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff828282)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: locationModelList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LocationInfoScreen()));
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Customwidget(
                              name: locationModelList[index].name ?? '',
                              dimension:
                                  locationModelList[index].dimension ?? '',
                            ),
                          ));
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Customwidget extends StatelessWidget {
  final String name;
  final String dimension;

  const Customwidget({
    Key? key,
    required this.name,
    required this.dimension,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 218,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(color: Colors.grey, width: 0.5)),
      child: Stack(
        // clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/planety.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000)),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Text(
                          'Мир',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff828282)),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '•',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff828282)),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Измерение С-137',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff828282)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
