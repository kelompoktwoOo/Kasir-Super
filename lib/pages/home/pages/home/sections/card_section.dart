part of '../page.dart';

class _CardSection extends StatelessWidget {
  const _CardSection({
    required this.label,
    required this.value,
    required this.page,
  });

  final String label;
  final String value;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dp24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RegularText(label),
            Dimens.dp4.height,
            HeadingText(
              value,
              style: const TextStyle(fontSize: Dimens.dp24),
            ),
            Dimens.dp6.height,
            GestureDetector(
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return page;
              }));
              },
              child: const HeadingText(
              'Lihat detail',
              style: TextStyle(fontSize: Dimens.dp16, color: Color(0xff2DBE78)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}