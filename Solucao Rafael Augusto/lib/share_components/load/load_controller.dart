import 'package:get/get.dart';

class LoadState {
  bool load;
  LoadState({this.load = false});
}

class LoadController extends GetxController {
  final _state = LoadState().obs;
  void status(bool status) => _state.update((_) => _.load = status);

  bool get statusLoad => _state.value.load;
}
