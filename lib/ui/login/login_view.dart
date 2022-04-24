import 'package:cuzdan/core/base/state/base_state.dart';
import 'package:cuzdan/core/constant/db/collection_names.dart';
import 'package:cuzdan/core/constant/enum/authentication_enum.dart';
import 'package:cuzdan/core/constant/navigation/navigation_constants.dart';
import 'package:cuzdan/core/init/navigation/navigation_service.dart';
import 'package:cuzdan/service/auth_service.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  final Authentication authentication;
  const LoginView({Key? key, required this.authentication}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = widget.authentication == Authentication.REGISTER;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111016),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTextHeader(),
          buildTextDetail(),
          buildTextFormFieldEmail(),
          buildTextFormFieldPassword(),
          buildTextForgetPassword(),
          buildElevatedButtonLogin(),
          buildText(),
          buildElevatedButtonLoginWithGoogle(),
        ],
      )),
    );
  }

  Widget buildTextHeader() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: dynamicWidth(32), top: dynamicHeight(124)),
          width: dynamicWidth(67.15),
          height: dynamicHeight(67.15),
          decoration: BoxDecoration(
            color: Color(0xff2B44FF),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: dynamicWidth(61), top: dynamicHeight(128)),
          child: Text(
            widget.authentication == Authentication.LOGIN ? 'giriş yap' : 'kayıt ol',
            style: TextStyle(fontSize: 44),
          ),
        ),
      ],
    );
  }

  Widget buildTextDetail() {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(36), top: dynamicHeight(24)),
      child: Text(
        'Lorem ipsum dolor sit amet, consec adipiscing elit.',
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget buildTextFormFieldEmail() {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(50)),
      width: dynamicWidth(330),
      height: dynamicHeight(50),
      child: TextFormField(
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
        controller: _emailController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: dynamicWidth(15), top: dynamicHeight(16)),
          focusColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff2B44FF), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.grey,
          hintText: "Email",
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget buildTextFormFieldPassword() {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(20)),
      width: dynamicWidth(330),
      height: dynamicHeight(50),
      child: TextFormField(
        obscureText: !passwordVisible,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
        controller: _passwordController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: dynamicWidth(15), top: dynamicHeight(16)),
          focusColor: Colors.white,
          suffixIcon: IconButton(
              icon: Icon(
                passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              }),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff2B44FF), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.grey,
          hintText: "Password",
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget buildTextForgetPassword() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(right: dynamicWidth(30), top: dynamicHeight(20)),
      child: InkWell(
        onTap: () => {
          //TODO şifremi unuttum
        },
        child: Text(
          widget.authentication == Authentication.LOGIN ? 'şifremi unuttum' : '',
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  Widget buildElevatedButtonLogin() {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(235), top: dynamicHeight(20)),
      width: dynamicWidth(125),
      height: dynamicHeight(45),
      child: ElevatedButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 20),
          ),
          backgroundColor: MaterialStateProperty.all(
            Color(0xff2B44FF),
          ),
        ),
        child: Text(
          widget.authentication == Authentication.LOGIN ? 'giriş yap' : 'kayıt ol',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: widget.authentication == Authentication.LOGIN ? _loginWithEmailAndPassword : _createUserWithEmailAndPassword,
      ),
    );
  }

  Widget buildText() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: dynamicHeight(60)),
      child: Text(
        'ya da',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget buildElevatedButtonLoginWithGoogle() {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(30)),
      width: dynamicWidth(330),
      height: dynamicHeight(50),
      child: ElevatedButton.icon(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 20),
          ),
          backgroundColor: MaterialStateProperty.all(
            Color(0xff2B44FF),
          ),
          alignment: Alignment.centerLeft,
        ),
        icon: Image.asset(
          'assets/icons/googleicon.png',
          width: dynamicWidth(24),
          height: dynamicHeight(24),
        ),
        label: Text(
          'Google ile ' + (widget.authentication == Authentication.LOGIN ? 'giriş yap' : 'kayıt ol'),
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          _authService.signInWithGoogle();
        },
      ),
    );
  }

  _loginWithEmailAndPassword() async {
    String result = await _authService.loginWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
    if (result == AuthResultMessage.kAuthSuccessLogin) {
      showCustomSnackbar(context, 'Giriş başarılı!', Icons.done, Colors.green);
      NavigationService.instance.navigateToPageClear(path: NavigationConstants.HOME_VIEW);
    } else if (result == AuthResultMessage.kUserNotFound) {
      showCustomSnackbar(context, 'Kullanıcı bulunamadı!', Icons.info, Colors.blue);
    } else if (result == AuthResultMessage.kWrongPassword) {
      showCustomSnackbar(context, 'Hatalı şifre girişi!', Icons.warning, Colors.red);
    } else if (result == AuthResultMessage.kUnExpectedErrorMessage) {
      showCustomSnackbar(context, 'Beklenmeyen bir hata oluştu!', Icons.warning, Colors.red);
    }
  }

  _createUserWithEmailAndPassword() async {
    String result = await _authService.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
    if (result == AuthResultMessage.kAuthSuccessRegister) {
      showCustomSnackbar(context, 'Kayıt başarılı!', Icons.done, Colors.green);
      NavigationService.instance.navigateToPageClear(path: NavigationConstants.LOGIN_VIEW, object: {'authentication': Authentication.LOGIN});
    } else if (result == AuthResultMessage.kWeakPassword) {
      showCustomSnackbar(context, 'Şifre en az 6 karakter uzunluğunda olmalıdır!', Icons.info, Colors.blue);
    } else if (result == AuthResultMessage.kEmailAlreadyInUse) {
      showCustomSnackbar(context, 'Bu email adresine ait hesap bulunmakta!', Icons.warning, Colors.red);
    } else if (result == AuthResultMessage.kUnExpectedErrorMessage) {
      showCustomSnackbar(context, 'Beklenmeyen bir hata oluştu!', Icons.warning, Colors.red);
    }
  }

  void showCustomSnackbar(BuildContext context, String message, IconData icon, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Icon(icon), Expanded(child: Text(message))],
      ),
      backgroundColor: color,
      duration: Duration(seconds: 3),
      shape: StadiumBorder(),
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    ));
  }
}
