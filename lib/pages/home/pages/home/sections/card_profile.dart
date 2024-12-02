part of '../page.dart';

class CardProfile extends StatelessWidget {
  const CardProfile({
    super.key, 
    required this.label,
    required this.img,
    required this.url,
    required this.no,
  });

  final String label;
  final String img;
  final String url;
  final String no;


  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {
        LaunchHelper.launch(url);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.dp24),
          child: Row(
            children: [
              ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
                child: Image(
                  image: NetworkImage(img),
                  width: 50,
                ),
              ),
              Dimens.dp12.width,
              SubtitleText(label),
              const Spacer(),
              RegularText(no),
            ],
          ),
        ),
      ),
    );
  }
} 