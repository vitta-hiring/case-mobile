import 'package:VittaChallenge/services/http/http_adapter.dart';
import 'package:VittaChallenge/share_components/load/load_controller.dart';
import 'package:VittaChallenge/widgets/detail_film/detail_controller.dart';
import 'package:VittaChallenge/widgets/detail_film/detail_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    final Dio dio = Dio();
    final HttpAdapter http = HttpAdapter(dio);
    final IDetailRepository repository = DetailRepository(http);
    final LoadController load = Get.put(LoadController());
    Get.lazyPut<DetailController>(() => DetailController(repository, load));
  }
}
