import 'package:flutter/material.dart';
import 'package:training/3_state_management/2_tourism_app_state/model/tourism.dart';

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
  late bool _isBookMarked;

  @override
  void initState() {
    final tourismInList =
        bookMarkTourismList.where((element) => element.id == widget.tourism.id);
    setState(() {
      if (tourismInList.isNotEmpty) {
        _isBookMarked = true;
      } else {
        _isBookMarked = false;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          if (_isBookMarked) {
            bookMarkTourismList
                .removeWhere((element) => element.id == widget.tourism.id);
          } else {
            bookMarkTourismList.add(widget.tourism);
          }
          _isBookMarked = !_isBookMarked;
        });
      },
      icon: Icon(
        _isBookMarked ? Icons.bookmark : Icons.bookmark_outline,
      ),
    );
  }
}
