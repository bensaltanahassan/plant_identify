import 'package:plant_identify/core/constant/imageassets.dart';
import 'package:plant_identify/data/model/chooselanguagemodel.dart';
import 'package:plant_identify/data/model/onboardingmodel.dart';

class StaticData {
  static List<OnboardingModel> onBoardingList = [
    OnboardingModel(
        title: "Welcome to Restaurant Akhawayn",
        body:
            "Indulge in a delightful culinary experience where your cravings meet exceptional flavors. Explore our diverse menu and let us take you on a gastronomic journey that tantalizes your taste buds. Your satisfaction is our top priority at Restaurant Akhawayn.",
        image: AppImageAsset.onBoardingImageOne),
    OnboardingModel(
        title: "Savor the Moment with Restaurant Akhawayn",
        body:
            "Step into a world of culinary excellence where every dish tells a story of passion and perfection. At Restaurant Akhawayn, we strive to create a dining experience that goes beyond just a meal. Join us as we craft memorable moments through exceptional food and impeccable service",
        image: AppImageAsset.onBoardingImageTwo),
    OnboardingModel(
        title: "Experience the Best of Restaurant Akhawayn",
        body:
            "At Restaurant Akhawayn, we are committed to delivering an exceptional dining experience that exceeds your expectations. Our team of culinary experts and service professionals are dedicated to creating a memorable experience that leaves you craving for more.",
        image: AppImageAsset.onBoardingImageThree),
  ];

  static List<ChooseLanguageModel> chooseLanguageList = [
    ChooseLanguageModel(AppImageAsset.chooseLanguageAr, "العربية"),
    ChooseLanguageModel(AppImageAsset.chooseLanguageFr, "Francais"),
    ChooseLanguageModel(AppImageAsset.chooseLanguageEn, "English"),
  ];
}
