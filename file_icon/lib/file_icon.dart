import 'package:flutter/widgets.dart';
import 'src/data.dart';

class FileIcon extends StatelessWidget {
  final String fileName;
  final double size;
  final Color? color;

  FileIcon(
    String fileName, {
    required this.size,
    this.color,
  }) : this.fileName = fileName.toLowerCase();

  @override
  Widget build(BuildContext context) {
    String? key;

    if (iconSetMap.containsKey(fileName)) {
      key = fileName;
    } else {
      var chunks = fileName.split('.').sublist(1);
      while (chunks.isNotEmpty) {
        var k = '.' + chunks.join();
        if (iconSetMap.containsKey(k)) {
          key = k;
          break;
        }
        chunks = chunks.sublist(1);
      }
    }

    if (key == null) {
      key = '.txt';
    }

    return Icon(
      iconSetMap[key]!,
      color: color ?? Color(0x00),
      size: size,
    );
  }
}
