import 'package:flutter/material.dart';
import 'package:training/2_desain_ui_dengan_widget/3_tourism_app_theme/model/tourism.dart';

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
