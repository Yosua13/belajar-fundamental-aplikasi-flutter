import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:training/4_networking/4_tourism_api_provider/provider/detail/bookmark_icon_provider.dart';
import 'package:training/4_networking/4_tourism_api_provider/provider/detail/tourism_detail_provider.dart';
import 'package:training/4_networking/4_tourism_api_provider/screen/detail/body_of_detail_screen_widget.dart';
import 'package:training/4_networking/4_tourism_api_provider/screen/detail/bookmark_icon_widget.dart';
import 'package:training/4_networking/4_tourism_api_provider/static/tourism_detail_result_state.dart';

class DetailScreen extends StatefulWidget {
  final int tourismId;

  const DetailScreen({
    super.key,
    required this.tourismId,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // final Completer<Tourism> _completerTourism = Completer<Tourism>();
  // late Future<TourismDetailResponse> _futureTourismDetail;

  @override
  void initState() {
    super.initState();

    // _futureTourismDetail = ApiService().getTourismDetail(widget.tourismId);
    Future.microtask(() {
      context
          .read<TourismDetailProvider>()
          .fetchTourismDetail(widget.tourismId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tourism Detail"),
          actions: [
            ChangeNotifierProvider(
                create: (context) => BookmarkIconProvider(),
                child: Consumer<TourismDetailProvider>(
                  builder: (context, value, child) {
                    return switch (value.resultState) {
                      TourismDetailLoadedState(data: var tourism) =>
                        BookmarkIconWidget(tourism: tourism),
                      _ => const SizedBox()
                    };
                  },
                )),
            // BookmarkIconWidget(tourism: tourism),
          ],
        ),
        body: Consumer<TourismDetailProvider>(builder: (context, value, child) {
          return switch (value.resultState) {
            TourismDetailLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
            TourismDetailLoadedState(data: var tourism) =>
              BodyOfDetailScreenWidget(tourism: tourism),
            TourismDetailErrorState(error: var message) => Center(
                child: Text(message),
              ),
            _ => const SizedBox(),
          };
        })
        // FutureBuilder(
        //   future: _futureTourismDetail,
        //   builder: (context, snapshot) {
        //     switch (snapshot.connectionState) {
        //       case ConnectionState.waiting:
        //         return const Center(child: CircularProgressIndicator());
        //       case ConnectionState.done:
        //         if (snapshot.hasError) {
        //           return Center(
        //             child: Text(snapshot.error.toString()),
        //           );
        //         }
        //         final tourismData = snapshot.data!.place;
        //         _completerTourism.complete(tourismData);
        //         return BodyOfDetailScreenWidget(tourism: tourismData);
        //       default:
        //         return const SizedBox();
        //     }
        //   },
        // ),
        );
  }
}
