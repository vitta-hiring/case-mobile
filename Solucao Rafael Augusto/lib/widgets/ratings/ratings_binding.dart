import 'package:VittaChallenge/widgets/ratings/ratings_controller.dart';
import 'package:get/get.dart';

class RatingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RatingsController>(() => RatingsController());
  }
}
