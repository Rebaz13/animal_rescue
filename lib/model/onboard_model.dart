import '../../../utils/app_images.dart';

class OnBoardModel {
  String title;
  String bodyTitle;
  String description;
  String image;

  OnBoardModel(
      {required this.title,
      required this.bodyTitle,
      required this.description,
      required this.image});

  static List<OnBoardModel> onBoardingData() {
    return [
      OnBoardModel(
          title: 'Animal Rescue',
          bodyTitle: 'Welcome ',
          description: 'as pet lovers we are here to help you',
          image: AppImages.onBoard1),
      OnBoardModel(
          title: 'Animal Rescue',
          bodyTitle: 'Welcome ',
          description: 'as pet lovers we are here to help you',
          image: AppImages.onBoard2),
      OnBoardModel(
          title: 'Wana Arabee',
          bodyTitle: 'Adopt or Give up a Pet?',
          description:
              'Whether you\'re looking to adopt a furry companion or give one up for adoption, we can help.',
          image: AppImages.onBoard3),
    ];
  }
}
