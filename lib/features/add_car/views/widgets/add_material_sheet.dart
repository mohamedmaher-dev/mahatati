import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/controllers/car/addcar/addcar_bloc.dart';
import 'package:mahatati/core/consts.dart';

class AddMaterialSheet extends StatelessWidget {
  const AddMaterialSheet({super.key, required this.materialList});
  final List materialList;
  @override
  Widget build(BuildContext context) {
    AddCarBloc controller = BlocProvider.of<AddCarBloc>(context);
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const ListTile(
          title: Text(
            "اختر المادة",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        materialList.isEmpty
            ? Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: const Text("لا يوجد مواد"),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: materialList.length,
                itemBuilder: (contextList, index) {
                  return Card(
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      title: Text(
                        "${materialList[index]["name"]}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        "${materialList[index]["id"]}",
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
                          MaterialSelectedAddEvent(
                            context: context,
                            materialSelected:
                                materialList[index]["name"].toString(),
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
