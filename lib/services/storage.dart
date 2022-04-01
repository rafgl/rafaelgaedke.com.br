import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rafaelgaedke/utils/config.dart';

class StorageService extends GetxService {
  static GetStorage get box => GetStorage(Config.STORAGE_PREFIX);

  Future init() async {
    await GetStorage.init(Config.STORAGE_PREFIX);

    return this;
  }
}
