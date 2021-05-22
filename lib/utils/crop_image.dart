import 'dart:typed_data' show Uint8List;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:image/image.dart' as img;

Future<Uint8List> cropImg(BuildContext context) async {
  if (kIsWeb) {
    String assetToLoad = 'asset/';

    final imgByte = await rootBundle.load(assetToLoad);
    final bytes = Uint8List.view(imgByte.buffer);

    await precacheImage(
        Image.memory(
          bytes,
          key: ValueKey('bg'),
        ).image,
        context);
    return bytes;
  }

  final sizeData = MediaQuery.of(context);
  String assetToLoad = 'x';

  final imgByte = await rootBundle.load(assetToLoad);

  List<int> bytes = Uint8List.view(imgByte.buffer);
  img.Image? initialImg = img.decodeImage(bytes);

  double newMultiplicator = maxMultiplicator(
    Size(initialImg!.width.toDouble(), initialImg.height.toDouble()),
    sizeData.size,
    sizeData.devicePixelRatio,
  );

  final x = (initialImg.width - sizeData.size.width * newMultiplicator) / 2;

  img.Image result = img.copyCrop(
    initialImg,
    x.floor(),
    0,
    (sizeData.size.width * newMultiplicator).floor(),
    (sizeData.size.height * newMultiplicator).floor(),
  );

  final croppedImageBytes = Uint8List.fromList(img.encodeJpg(result));
  await precacheImage(
      Image.memory(
        croppedImageBytes,
        key: ValueKey('bg'),
      ).image,
      context);
  return croppedImageBytes;
}

///
///Verifica se é possível multiplicar [secundarySize] pelo multiplicador passado.
///Se [secundarySize] tiver width ou height >= do que [maxSize]  retorna 1.
///Senão, retorna o maior multiplicador possível para que o Size secundário seja igual ao inicial.
///
double maxMultiplicator(
    Size maxSize, Size secundarySize, double multiplicadorInicial) {
  double newMaxMultiplicator = multiplicadorInicial;

  if (secundarySize.width >= maxSize.width ||
      secundarySize.height >= maxSize.height) return 1;

  if (multiplicadorInicial * secundarySize.width > maxSize.width)
    newMaxMultiplicator = maxSize.width / secundarySize.width;

  if (newMaxMultiplicator != multiplicadorInicial) {
    if (newMaxMultiplicator * secundarySize.height > maxSize.height) {
      newMaxMultiplicator = maxSize.height / secundarySize.height;
    }
  } else {
    if (multiplicadorInicial * secundarySize.height > maxSize.height)
      newMaxMultiplicator = maxSize.height / secundarySize.height;
  }

  return newMaxMultiplicator > 1 ? newMaxMultiplicator : 1;
}
