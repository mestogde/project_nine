import 'package:get_it/get_it.dart';

class AppService {
  String data = "изначальные данные";
}

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AppService>(AppService());
}
