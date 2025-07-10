import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahatati/controllers/car/updatecar/updatecar_bloc.dart';
import 'package:mahatati/core/consts.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesViewer extends StatefulWidget {
  const ImagesViewer({super.key});

  @override
  State<ImagesViewer> createState() => _ImagesViewerState();
}

class _ImagesViewerState extends State<ImagesViewer> {
  late UpdateCarBloc controller;
  @override
  Widget build(BuildContext context) {
    controller = BlocProvider.of<UpdateCarBloc>(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: CachedNetworkImageProvider(
                    controller.listImagesLinks[index],
                  ),
                  initialScale: PhotoViewComputedScale.contained * 0.8,
                  heroAttributes: PhotoViewHeroAttributes(
                    tag: controller.listImagesLinks[index],
                  ),
                );
              },
              itemCount: controller.listImagesLinks.length,
              loadingBuilder: (context, event) => const Center(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              onPageChanged: (index) {
                controller.add(SlideImageEvent(index: index));
              },
            ),
          ),
          const SizedBox(height: 25),
          BlocBuilder<UpdateCarBloc, UpdateCarState>(
            builder: (context, state) {
              return Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: controller.activeImages,
                  count: controller.listImagesLinks.length,
                  effect: const WormEffect(
                    activeDotColor: kPrimaryColor,
                  ), // your preferred effect
                ),
              );
            },
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}
