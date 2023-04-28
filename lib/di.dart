import 'package:get_it/get_it.dart';
import 'package:qr_camera/respository/setting_repository.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<SettingRepository>(SettingRepository());

   // getIt.registerSingletonAsync<SettingRepository>(() async {
   //   final setting = SettingRepository();
   //   await setting.init();
   //   return setting;
   // });
}
