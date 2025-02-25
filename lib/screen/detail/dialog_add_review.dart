import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:restaurant_app/static/navigation_route.dart';

class DialogAddReview extends StatefulWidget {
  final String restaurantId;

  const DialogAddReview({
    super.key,
    required this.restaurantId,
  });

  @override
  State<DialogAddReview> createState() => _DialogAddReviewState();
}

class _DialogAddReviewState extends State<DialogAddReview> {
  final _nameController = TextEditingController();

  final _reviewController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late final RestaurantDetailProvider provider;

  @override
  void initState() {
    super.initState();
    provider = context.read<RestaurantDetailProvider>();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetPadding: const EdgeInsets.all(16),
      title: const Text('Tambah Review'),
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
      content: Form(
        key: _formKey,
        child: SizedBox(
          width: width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Nama tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _reviewController,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Review',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  validator: (value) {
                    if (value.toString().isEmpty) {
                      return 'Review tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      actionsPadding: const EdgeInsets.all(16),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Batal'),
        ),
        ElevatedButton(
          onPressed: () async {
            FormState? form = _formKey.currentState;

            if (form != null) {
              if (form.validate()) {
                await provider.addReview(
                  widget.restaurantId,
                  _nameController.text,
                  _reviewController.text,
                );
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  NavigationRoute.detailRoute.name,
                  arguments: widget.restaurantId,
                );
              }
            }
          },
          child: const Text(
            'Tambah',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
