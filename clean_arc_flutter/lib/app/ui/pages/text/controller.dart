import 'package:clean_arc_flutter/app/infrastructure/contract/base_controller.dart';
import 'package:clean_arc_flutter/app/misc/user_data.dart';
import 'package:clean_arc_flutter/app/ui/pages/text/presenter.dart';
import 'package:clean_arc_flutter/app/ui/pages/pages.dart';
import 'package:clean_arc_flutter/domains/entities/user.dart';
import 'package:flutter/widgets.dart';
import 'package:undo/undo.dart';

class LoginController extends BaseController {
  SimpleStack controller = SimpleStack<String>("123");
  LoginPresenter _presenter;
  User _auth;
  UserData _userData;
  bool loading = false;
  int cou = 0;
  String datareverse, undo1;
  List<String> datainput = List<String>();

  bool _isErrorEmployeeCode = false, _isObscured = true;

  TextEditingController _input = new TextEditingController();
  TextEditingController _passwordInput = new TextEditingController();
  String get undo12 => undo1;

  TextEditingController get input => _input;
  String get datareverses => datareverse;
  TextEditingController get passwordInput => _passwordInput;
  ErrorMessage _errorMessage = new ErrorMessage();
  User get auth => _auth;
  ErrorMessage get errorMessage => _errorMessage;
  bool get isErrorEmployeeCode => _isErrorEmployeeCode;
  bool get isObscured => _isObscured;

  LoginController(this._presenter, this._userData) : super() {
    _auth = User();
    _input.addListener(_onInputChange);
  }

  void reverse() {
    showLoading();
    refreshUI();
    datareverse = input.text.split('').reversed.join();
    print(datareverse);
    dismissLoading();
    refreshUI();
  }

  void count() {
    cou = cou + 1;
    if (cou == 1) {
    } else if (cou.isEven) {
      print("data undo depan ${controller.state}");
      undo();
    } else {
      redo();
    }
  }

  void undo() {
    controller.undo();
    _input.text = controller.state;
    print("data undo ${_input.text}");
    refreshUI();
  }

  void redo() {
    controller.redo();
    _input.text = controller.state;
    print("data redo ${_input.text}");
    refreshUI();
  }

  bool isAllFilled() {
    return _input.text.isNotEmpty ? true : false;
  }

  @override
  void initListeners() {
    super.initListeners();
  }

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }

  void toggleVisibility() {
    _isObscured = !_isObscured;
    refreshUI();
  }

  void _onInputChange() {
    if (_input.text == controller.state) {
    } else {
      controller.modify(_input.text);
    }
  }
}

class ErrorMessage {
  String employeecode = '';
  bool isValid() {
    return employeecode.isEmpty ? true : false;
  }
}
