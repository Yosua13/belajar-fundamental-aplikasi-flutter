import 'package:flutter/material.dart';

class SliverAppbar extends StatelessWidget {
  const SliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: true,
            snap: true,
            backgroundColor: Colors.black,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://picsum.photos/1600/900",
                fit: BoxFit.cover,
              ),
              expandedTitleScale: 1.5,
              title: const Text(
                "Sliver Appbar",
                style: TextStyle(color: Colors.white),
              ),
              titlePadding: EdgeInsets.all(16.0),
            ),
          ),
          const SliverToBoxAdapter(
            child: ListTile(
              title: Text("Header of SliverToBoxAdapter"),
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              return ListTile(title: Text("Index $index"));
            },
          ),
        ],
      ),
    );
  }
}
