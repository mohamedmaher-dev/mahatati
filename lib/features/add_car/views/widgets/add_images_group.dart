import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controllers/car/addcar/addcar_bloc.dart';
import '../../../../core/consts.dart';
import 'group_item.dart';

class AddImagesGroup extends StatelessWidget {
  const AddImagesGroup({super.key, required this.controller});
  final AddCarBloc controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCarBloc, AddCarState>(
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
                      controller.add(
                          DeleteImageEvent(context: context, index: index));
                    },
                  ),
                ),
              );
            },
            itemCount: controller.imagesList.length,
          ),
        );
      },
    );
  }
}
