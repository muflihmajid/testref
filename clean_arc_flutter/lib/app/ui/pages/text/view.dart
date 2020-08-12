import 'package:clean_arc_flutter/app/infrastructure/app_component.dart';
import 'package:clean_arc_flutter/app/ui/pages/text/controller.dart';
import 'package:clean_arc_flutter/app/ui/res/generated/i18n.dart';
import 'package:clean_arc_flutter/app/ui/widgets/button.dart';
import 'package:clean_arc_flutter/app/ui/widgets/text_input.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';

class LoginPage extends View {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState(
      AppComponent.getInjector().getDependency<LoginController>());
}

class _LoginPageState extends ViewState<LoginPage, LoginController>
    with WidgetsBindingObserver {
  _LoginPageState(LoginController controller) : super(controller);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget buildPage() {
    return new Scaffold(
      key: globalKey,
      body: Container(
        alignment: Alignment.bottomCenter,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              child: CommonTextInput(
                isDense: true,
                isError:
                    controller.errorMessage.employeecode?.isNotEmpty ?? false,
                errorText: controller.errorMessage.employeecode,
                controller: controller.input,
                placeholder: "Text",
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
              ),
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            ),
            Container(
                child: Text(
              controller.datareverse == null
                  ? "hayo apa"
                  : controller.datareverse,
              textAlign: TextAlign.center,
            )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: CommonButton(
                    minWidth: MediaQuery.of(context).size.width / 4,
                    outerPadding: EdgeInsets.only(left: 5),
                    height: 48,
                    isDisabled: false,
                    buttonText: "reverse",
                    onPressed: () {
                      controller.reverse();
                    },
                  ),
                ),
                Container(
                  child: CommonButton(
                    minWidth: MediaQuery.of(context).size.width / 4,
                    height: 48,
                    outerPadding: EdgeInsets.only(left: 5),
                    isDisabled: false,
                    buttonText: "undo/redo",
                    onPressed: () {
                      controller.undo();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          ],
        ),
      ),
    );
  }
}
