import 'package:clean_arc_flutter/app/infrastructure/contract/base_controller.dart';
import 'package:clean_arc_flutter/app/misc/user_data.dart';
import 'package:clean_arc_flutter/app/ui/pages/text/presenter.dart';
import 'package:clean_arc_flutter/app/ui/pages/pages.dart';
import 'package:clean_arc_flutter/domains/entities/user.dart';
import 'package:flutter/widgets.dart';

class LoginController extends BaseController {
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
    print(input.text);
    int k = cou - 1;
    print(cou);
    if (cou == 1) {
      datainput.add(input.text);
    } else if (cou.isEven) {
      datainput.add(input.text);
      undo(k);
    } else {
      datainput.add(input.text);
      redo(cou);
    }
  }

  void undo(int i) {
    print("Undo");
    print(i);
    _input.text = datainput[i - 1];
    refreshUI();
    print(_input.text);
    refreshUI();
  }

  void redo(int i) {
    print("redo");
    print(i);
    _input.text = datainput[i-2];
    print(_input.text);
    refreshUI();
    refreshUI();
  }

  bool isAllFilled() {
    return _input.text.isNotEmpty ? true : false;
  }

  @override
  void initListeners() {
    super.initListeners();

    _presenter.loginOnNext = (User auth) {
      _auth = auth;
      refreshUI();
    };

    _presenter.loginOnComplete = () async {
      _userData.fromUser(_auth);
      _userData.password = _passwordInput.text;
      await _userData.save();

      dismissLoading();
      Navigator.pushReplacementNamed(getContext(), Pages.main);
    };

    _presenter.loginOnError = (e) {
      // do log here
    };
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

  void _onInputChange() {}
}

class ErrorMessage {
  String employeecode = '';
  bool isValid() {
    return employeecode.isEmpty ? true : false;
  }
}
