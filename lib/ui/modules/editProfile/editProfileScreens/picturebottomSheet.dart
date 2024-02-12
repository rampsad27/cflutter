import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ig/ui/modules/imagePicker/bloc/imagepicker_bloc.dart';

class PicureBottomSheet extends StatefulWidget {
  const PicureBottomSheet({super.key});

  @override
  State<PicureBottomSheet> createState() => _PicureBottomSheetState();
}

class _PicureBottomSheetState extends State<PicureBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 1.5, color: Colors.black),
            ),
            tabs: [
              Tab(icon: Icon(Icons.grid_on_sharp)),
              Tab(icon: Icon(Icons.video_library_outlined)),
            ],
          ),
        ),
        body: BlocBuilder<ImageAndFilePickerBloc, ImageAndFilePickerState>(
          builder: (context, state) {
            return TabBarView(
              children: [
                TextButton(
                  onPressed: () {
                    context
                        .read<ImageAndFilePickerBloc>()
                        .add(ImageAndFilePickUpRequested());
                  },
                  child: const Column(
                    children: [
                      Text(
                        "Choose from library",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text("Take Photo"),
                    ],
                  ),
                ),
                if (state is ImageAndFilePickerLoadInProgress) ...[
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ] else if (state is ImageAndFilePickerFailure) ...[
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(state.errorMessage),
                  ),
                ],
                const Text("Create Avatar"),
              ],
            );
          },
        ),
      ),
    );
  }
}
