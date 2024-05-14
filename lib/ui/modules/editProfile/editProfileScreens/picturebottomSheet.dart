import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ig/ui/modules/imagePicker/bloc/imagepicker_bloc.dart';

class PictureBottomSheet extends StatefulWidget {
  const PictureBottomSheet({super.key});

  @override
  State<PictureBottomSheet> createState() => _PicureBottomSheetState();
}

class _PicureBottomSheetState extends State<PictureBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 1.5, color: Colors.black),
              insets: EdgeInsets.symmetric(horizontal: 105),
            ),
            tabs: [
              Tab(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://imgupscaler.com/images/samples/animal-after.webp"),
                ),
              ),
              Tab(icon: Icon(Icons.video_library_outlined)),
            ],
          ),
        ),
        body: BlocBuilder<ImageAndFilePickerBloc, ImageAndFilePickerState>(
          builder: (context, state) {
            return TabBarView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        context
                            .read<ImageAndFilePickerBloc>()
                            .add(ImageAndFilePickUpRequested());
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.photo_library),
                          SizedBox(width: 8),
                          Text(
                            "Choose from library",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context
                            .read<ImageAndFilePickerBloc>()
                            .add(TakePictureRequested());
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.camera_alt),
                          SizedBox(width: 8),
                          Text("Take Photo"),
                        ],
                      ),
                    ),
                  ],
                ),
                const Text("Create Avatar"),
              ],
            );
          },
        ),
      ),
    );
  }
}
