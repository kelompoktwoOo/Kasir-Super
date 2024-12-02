part of '../page.dart';

class _HeadingSection extends StatelessWidget {
  const _HeadingSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dp16),
      child: Column(
        children: [
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return SubtitleText(
                state.user?.name ?? 'Kasir Super SMK 10',
                align: TextAlign.center,
              );
            },
          ),
        ],
      ),
    );
  }
}
