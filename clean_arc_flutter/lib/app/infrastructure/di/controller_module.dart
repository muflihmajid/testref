import 'package:clean_arc_flutter/app/misc/user_data.dart';
import 'package:clean_arc_flutter/app/ui/pages/text/controller.dart';
import 'package:clean_arc_flutter/app/ui/pages/text/presenter.dart';
import 'package:clean_arc_flutter/app/ui/pages/splash/controller.dart';
import 'package:injector/injector.dart';

class ControllerModule {
  static void init(Injector injector) {
    injector.registerDependency<SplashController>((Injector injector) {
      return SplashController(injector.getDependency<UserData>());
    });
    injector.registerDependency<LoginController>((Injector injector) {
      return LoginController(
          injector.getDependency<LoginPresenter>(),
          injector.getDependency<UserData>());
    });
  }
  
}
