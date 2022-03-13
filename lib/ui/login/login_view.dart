import 'package:cuzdan/core/base/state/base_state.dart';
import 'package:cuzdan/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView(this.isLogin, {Key? key}) : super(key: key);
  final bool isLogin;
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseState<LoginView> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = !widget.isLogin;
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
          margin:
              EdgeInsets.only(left: dynamicWidth(32), top: dynamicHeight(124)),
          width: dynamicWidth(67.15),
          height: dynamicHeight(67.15),
          decoration: BoxDecoration(
            color: Color(0xff2B44FF),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(left: dynamicWidth(61), top: dynamicHeight(128)),
          child: Text(
            widget.isLogin ? 'giriş yap' : 'kayıt ol',
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
        onChanged: (value) {},
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(left: dynamicWidth(15), top: dynamicHeight(16)),
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
        onChanged: (value) {},
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.only(left: dynamicWidth(15), top: dynamicHeight(16)),
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
          widget.isLogin ? 'şifremi unuttum' : '',
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
          widget.isLogin ? 'giriş yap' : 'kayıt ol',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          //TODO press login
        },
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
          'Google ile ' + (widget.isLogin ? 'giriş yap' : 'kayıt ol'),
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          //TODO press google login
        },
      ),
    );
  }
}
