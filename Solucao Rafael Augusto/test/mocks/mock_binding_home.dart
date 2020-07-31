import 'package:VittaChallenge/services/http/http_adapter.dart';
import 'package:VittaChallenge/share_components/load/load_controller.dart';
import 'package:VittaChallenge/widgets/home/home_controller.dart';
import 'package:VittaChallenge/widgets/home/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'mock_home_repository.dart';

class MockHomeBinding implements Bindings {
  @override
  void dependencies() {
    final Dio dio = Dio();
    final HttpAdapter http = HttpAdapter(dio);
    final IHomeRepository repository = MockHomeRepository(http);
    final LoadController load = Get.put(LoadController());

    Get.lazyPut<HomeController>(() => HomeController(repository, load));
  }
}
