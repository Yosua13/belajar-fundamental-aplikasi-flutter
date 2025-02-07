import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training/4_networking/3_tourism_api_future_builder/data/model/tourism.dart';
import 'package:training/4_networking/3_tourism_api_future_builder/provider/detail/bookmark_icon_provider.dart';
import 'package:training/4_networking/3_tourism_api_future_builder/provider/detail/bookmark_list_provider.dart';

class BookmarkIconWidget extends StatefulWidget {
  final Tourism tourism;
  const BookmarkIconWidget({
    super.key,
    required this.tourism,
  });

  @override
  State<BookmarkIconWidget> createState() => _BookmarkIconWidgetState();
}

class _BookmarkIconWidgetState extends State<BookmarkIconWidget> {
  // late bool _isBookMarked;

  @override
  void initState() {
    // final tourismInList =
    //     bookMarkTourismList.where((element) => element.id == widget.tourism.id);
    // setState(() {
    //   if (tourismInList.isNotEmpty) {
    //     _isBookMarked = true;
    //   } else {
    //     _isBookMarked = false;
    //   }
    // });

    final bookmarkListProvider = context.read<BookmarkListProvider>();
    final bookmarkIconProvider = context.read<BookmarkIconProvider>();

    Future.microtask(() {
      final tourismInList =
          bookmarkListProvider.checkItemBookmark(widget.tourism);
      bookmarkIconProvider.isBookmarked = tourismInList;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final bookmarkListProvider = context.read<BookmarkListProvider>();
        final bookmarkIconProvider = context.read<BookmarkIconProvider>();
        final isBookmarked = bookmarkIconProvider.isBookmarked;

        if (!isBookmarked) {
          bookmarkListProvider.addBookmark(widget.tourism);
        } else {
          bookmarkListProvider.removeBookmark(widget.tourism);
        }
        bookmarkIconProvider.isBookmarked = !isBookmarked;
        // setState(() {
        //   if (_isBookMarked) {
        //     bookMarkTourismList
        //         .removeWhere((element) => element.id == widget.tourism.id);
        //   } else {
        //     bookMarkTourismList.add(widget.tourism);
        //   }
        //   _isBookMarked = !_isBookMarked;
        // });
      },
      icon: Icon(
        context.watch<BookmarkIconProvider>().isBookmarked
            ? Icons.bookmark
            : Icons.bookmark_outline,
      ),
    );
  }
}
