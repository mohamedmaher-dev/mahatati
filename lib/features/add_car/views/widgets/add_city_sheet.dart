import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/controllers/car/addcar/addcar_bloc.dart';
import 'package:mahatati/core/consts.dart';

class AddCitySheet extends StatelessWidget {
  const AddCitySheet({super.key, required this.citiesList});
  final List citiesList;

  @override
  Widget build(BuildContext context) {
    AddCarBloc controller = BlocProvider.of<AddCarBloc>(context);
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const ListTile(
          title: Text(
            "اختر المدينة",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        citiesList.isEmpty
            ? Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: const Text("لا يوجد مدن متاحة"),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: citiesList.length,
                itemBuilder: (contextList, index) {
                  return Card(
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      title: Text(
                        "${citiesList[index]["name"]}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        "${citiesList[index]["id"]}",
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
                          SelectCityEvent(
                            context: context,
                            city: citiesList[index]["name"].toString(),
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
