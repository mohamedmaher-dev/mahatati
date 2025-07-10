import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/core/consts.dart';
import 'package:mahatati/features/auth/data/models/station_model.dart';

import '../view_models/login/login_bloc.dart';

class SelectStationView extends StatefulWidget {
  const SelectStationView({super.key, required this.listStations});
  final List<StationModel> listStations;

  @override
  State<SelectStationView> createState() => _SelectStationViewState();
}

class _SelectStationViewState extends State<SelectStationView> {
  late List<StationModel> listStations;
  @override
  void initState() {
    listStations = widget.listStations;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LoginBloc controller = BlocProvider.of<LoginBloc>(context);
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ListTile(
          title: const Text(
            "اختر المحطة",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_forward,
              color: kPrimaryColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'بحث',
              suffixIcon: Icon(Icons.search),
            ),
            onChanged: (value) {
              setState(
                () {
                  if (value.isNotEmpty) {
                    listStations = widget.listStations
                        .where((element) => element.stationNumber == value)
                        .toList();
                  } else {
                    listStations = widget.listStations;
                  }
                },
              );
            },
          ),
        ),
        listStations.isEmpty
            ? Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: const Text("لايوجد محطات"),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: listStations.length,
                itemBuilder: (contextList, index) {
                  return Card(
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      title: Text(
                        listStations[index].stationNumber,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: const VerticalDivider(
                        color: kPrimaryColor,
                        thickness: 5,
                        width: 0,
                      ),
                      onTap: () {
                        controller.add(
                          StationSelectedEvent(
                            context: context,
                            station: listStations[index].stationNumber,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
      ],
    );
  }
}
