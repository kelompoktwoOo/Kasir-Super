import 'package:flutter/material.dart';
import 'package:kelompoktwoo/core/core.dart';

class EmptyTemplate extends StatelessWidget {
  const EmptyTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(MainAssets.empty, width: 600, height: 400,),
            const SubtitleText(
              'Tidak ada produk di sini',
              align: TextAlign.center,
            ),
            Dimens.dp8.height,
            const RegularText(
              'Kamu tidak memiliki produk.'
              'Silahkan tambahkan produk terlebih dahulu.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
