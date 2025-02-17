import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/3_state_management/3_tourism_app_provider/model/tourism.dart';
import 'package:training/3_state_management/3_tourism_app_provider/provider/detail/bookmark_icon_provider.dart';
import 'package:training/3_state_management/3_tourism_app_provider/screen/detail/bookmark_icon_widget.dart';

class DetailScreen extends StatelessWidget {
  final Tourism tourism;

  const DetailScreen({
    super.key,
    required this.tourism,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tourism Detail"),
        actions: [
          ChangeNotifierProvider(
            create: (context) => BookmarkIconProvider(),
            child: BookmarkIconWidget(tourism: tourism),
          ),
          // BookmarkIconWidget(tourism: tourism),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Hero(
                tag: tourism.image,
                child: Image.network(
                  tourism.image,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox.square(dimension: 16),
              // todo-09: change the text style
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tourism.name,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          tourism.address,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.pink,
                      ),
                      const SizedBox.square(dimension: 4),
                      Text(
                        tourism.like.toString(),
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox.square(dimension: 16),
              Text(
                tourism.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
