import 'package:cuzdan/core/base/state/base_state.dart';
import 'package:cuzdan/core/base/view/base_view.dart';
import 'package:cuzdan/core/constant/enum/authentication_enum.dart';
import 'package:cuzdan/ui/login/viewmodel/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  final Authentication authentication;
  const LoginView({Key? key, required this.authentication}) : super(key: key);

  @override
  BaseState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) => Scaffold(
        key: value.scaffoldState,
        backgroundColor: Color(0xff111016),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildBackButton(value),
              buildTextHeader(),
              buildTextDetail(),
              buildTextFormFieldEmail(value),
              buildTextFormFieldPassword(value),
              buildTextForgetPassword(),
              buildElevatedButtonLogin(value),
              buildText(),
              buildElevatedButtonLoginWithGoogle(value),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBackButton(LoginViewModel viewModel) {
    return IconButton(onPressed: () => viewModel.goBack(), icon: Icon(Icons.arrow_back));
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

  Widget buildTextFormFieldEmail(LoginViewModel viewModel) {
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
        controller: viewModel.emailController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: dynamicWidth(15), top: dynamicHeight(16)),
          focusColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff2B44FF), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff2B44FF), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.grey,
          hintText: "Email",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget buildTextFormFieldPassword(LoginViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(20)),
      width: dynamicWidth(330),
      height: dynamicHeight(50),
      child: TextFormField(
        obscureText: viewModel.passwordVisible,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
        controller: viewModel.passwordController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: dynamicWidth(15), top: dynamicHeight(16)),
          focusColor: Colors.white,
          suffixIcon: IconButton(
              icon: Icon(
                viewModel.passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                viewModel.isLockStateChange();
              }),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff2B44FF), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff2B44FF), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.grey,
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400),
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

  Widget buildElevatedButtonLogin(LoginViewModel viewModel) {
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
        onPressed: widget.authentication == Authentication.LOGIN ? viewModel.loginWithEmailAndPassword : viewModel.createUserWithEmailAndPassword,
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

  Widget buildElevatedButtonLoginWithGoogle(LoginViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(30)),
      width: dynamicWidth(330),
      height: dynamicHeight(50),
      child: ElevatedButton.icon(
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(
            width: 1.0,
            color: Color(0xff2B44FF),
          )),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(43, 68, 255, 0.2),
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
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        ),
        onPressed: () {
          viewModel.signInWithGoogle();
        },
      ),
    );
  }
}
