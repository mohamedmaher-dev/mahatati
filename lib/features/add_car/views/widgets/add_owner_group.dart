import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controllers/car/addcar/addcar_bloc.dart';
import '../../../../core/consts.dart';

class AddOwnerGroup extends StatelessWidget {
  const AddOwnerGroup({super.key, required this.controller});
  final AddCarBloc controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller.ownerController,
          decoration: const InputDecoration(
            label: Text("اسم المالك"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  kValueRound,
                ),
              ),
            ),
            prefixIcon: Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller.idenController,
          decoration: const InputDecoration(
            label: Text("رقم الهوية"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  kValueRound,
                ),
              ),
            ),
            prefixIcon: Icon(Icons.perm_identity),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller.mobileController,
          decoration: const InputDecoration(
            label: Text("رقم الموبايل"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  kValueRound,
                ),
              ),
            ),
            prefixIcon: Icon(
              Icons.phone,
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller.notesController,
          decoration: const InputDecoration(
            label: Text("ملاحظه"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  kValueRound,
                ),
              ),
            ),
            prefixIcon: Icon(Icons.note_alt_outlined),
          ),
        ),
        BlocBuilder<AddCarBloc, AddCarState>(
          builder: (context, state) {
            return ListTile(
              leading: const Icon(Icons.location_city_rounded),
              title: Text(
                controller.citySelected ?? "اختر المدينة",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text("المدينة"),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                color: kPrimaryColor,
                onPressed: () {
                  controller.add(GetCitiesEvent(context: context));
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
