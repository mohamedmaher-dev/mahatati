import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/controllers/car/addcar/addcar_bloc.dart';
import 'package:mahatati/core/consts.dart';
import 'package:mahatati/features/add_car/views/widgets/add_car_group.dart';
import 'package:mahatati/features/add_car/views/widgets/add_material_group.dart';
import 'package:mahatati/features/add_car/views/widgets/add_owner_group.dart';
import 'package:mahatati/features/add_car/views/widgets/group_item.dart';

class AddCarView extends StatefulWidget {
  const AddCarView({super.key});

  @override
  State<AddCarView> createState() => _AddCarViewState();
}

class _AddCarViewState extends State<AddCarView> {
  late AddCarBloc controller;
  @override
  Widget build(BuildContext context) {
    controller = BlocProvider.of<AddCarBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ادخال بيانات جديده"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: ListView(
                shrinkWrap: true,
                children: [
                  GroupItem(
                    title: "السيارة",
                    subtitle: AddCarGroup(
                      controller: controller,
                    ),
                  ),
                  GroupItem(
                    title: "المالك",
                    subtitle: AddOwnerGroup(
                      controller: controller,
                    ),
                  ),
                  AddMaterialGroup(controller: controller),
                  BlocBuilder<AddCarBloc, AddCarState>(
                    builder: (context, state) {
                      return GroupItem(
                        title: "الصور",
                        trailing: IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          color: kPrimaryColor,
                          onPressed: () {
                            controller.add(AddImageEvent(context: context));
                          },
                        ),
                        subtitle: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: ListTile(
                                title: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Image.file(
                                    fit: BoxFit.contain,
                                    controller.imagesList[index],
                                  ),
                                ),
                                leading: IconButton(
                                  icon: const Icon(Icons.delete),
                                  color: kRedColor,
                                  onPressed: () {
                                    controller.add(DeleteImageEvent(
                                        context: context, index: index));
                                  },
                                ),
                              ),
                            );
                          },
                          itemCount: controller.imagesList.length,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: MaterialButton(
                    color: kPrimaryColor,
                    height: 50,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      controller.add(AddEvent(context: context));
                    },
                    child: const Text(
                      style: TextStyle(color: kSecColor),
                      "اضافة",
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: MaterialButton(
                    color: kRedColor,
                    height: 50,
                    minWidth: double.infinity,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      controller.add(BackClickEvent(context: context));
                    },
                    child: const Text(
                      style: TextStyle(
                        color: kSecColor,
                      ),
                      "الغاء",
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
