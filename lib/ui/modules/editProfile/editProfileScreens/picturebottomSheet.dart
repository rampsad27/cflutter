import 'package:flutter/material.dart';

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
        body: const TabBarView(
          children: [
            Center(child: Text("Choose from library")),
            Center(child: Text("Create Avatar")),
          ],
        ),
      ),
    );
  }
}
