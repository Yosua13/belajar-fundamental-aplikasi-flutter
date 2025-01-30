import 'package:flutter/material.dart';
import 'package:training/2_desain_ui_dengan_widget/5_latihan_slivers/models/dicoding_course.dart';

class ListTileItem extends StatelessWidget {
  final DicodingCourse dicodingCourse;

  const ListTileItem({
    super.key,
    required this.dicodingCourse,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(dicodingCourse.title),
      subtitle: Text(
        dicodingCourse.description,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
      isThreeLine: true,
      onTap: () {},
    );
  }
}
