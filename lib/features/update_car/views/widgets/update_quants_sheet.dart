import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/controllers/car/updatecar/updatecar_bloc.dart';
import 'package:mahatati/core/consts.dart';

class UpdateQuantsSheet extends StatelessWidget {
  const UpdateQuantsSheet({super.key, required this.quantsList});
  final List quantsList;

  @override
  Widget build(BuildContext context) {
    UpdateCarBloc controller = BlocProvider.of<UpdateCarBloc>(context);
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const ListTile(
          title: Text(
            "اختر الكمية",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        quantsList.isEmpty
            ? Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: const Text("لا يوجد كميات متاحة"),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: quantsList.length,
                itemBuilder: (contextList, index) {
                  return Card(
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      title: Text(
                        "${quantsList[index]}",
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
                          QuantsSelectedUpdateEvent(
                            context: context,
                            quantsSelected: quantsList[index].toString(),
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
