import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/buttons.dart';
import '../components/text_fields.dart';

import '../bloc/register/register_bloc.dart';
import '../repository/student/student_repository.dart';

class RegisterPage extends StatefulWidget {
  /// Convenience method to route to WelcomePage
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => RegisterPage());
  }

  @override
  _RegisterPageState createState() {
    return _RegisterPageState();
  }
}

/// Main page for registration for new students
class _RegisterPageState extends State<RegisterPage> {
  final _registerScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Material(
        child: Stack(children: <Widget>[
      SvgPicture.asset("./assets/images/background-register.svg",
          semanticsLabel: "Background Color", width: width),
      SafeArea(
          child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Register",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                            "Give us some basic information about yourself and we’ll get you up and running in a jiffy",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Colors.white))),
                  ]))),
      Align(
          alignment: Alignment.bottomCenter,
          child: SafeArea(
              child: KeyboardAvoider(
                  child: SingleChildScrollView(
                      controller: _registerScrollController,
                      child: Container(
                          margin: EdgeInsets.all(20.0),
                          child: Material(
                              type: MaterialType.card,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              elevation: 3,
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 30,
                                      bottom: 20,
                                      left: 25.0,
                                      right: 25.0),
                                  child: BlocProvider(
                                      create: (context) {
                                        return RegisterBloc(RepositoryProvider
                                            .of<StudentRepository>(context));
                                      },
                                      child: _RegisterForm()))))))))
    ]));
  }
}

/// Register Form widget
class _RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<_RegisterForm> {
  final _registerFormKey = GlobalKey<FormState>();

  /// TextEditing controllers for form input
  final _usernameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
      if (state.status == RegisterStatus.failed) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text(state.message)),
          );
      }
    }, child:
            BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return Form(
          key: _registerFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BorderTextFormField(
                  controller: _usernameController,
                  labelText: 'Username',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please complete this field';
                    }
                    return null;
                  }),
              Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: BorderTextFormField(
                    controller: _firstNameController,
                    labelText: 'First Name',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please complete this field';
                      }
                      return null;
                    },
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: BorderTextFormField(
                    controller: _lastNameController,
                    labelText: 'Last Name',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please complete this field';
                      }
                      return null;
                    },
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: BorderTextFormField(
                    controller: _emailController,
                    labelText: 'Email',
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please complete this field';
                      }
                      return null;
                    },
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: BorderTextFormField(
                    controller: _passwordController,
                    hidden: true,
                    labelText: 'Password',
                    suffixIcon: Icon(Icons.visibility_off),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please complete this field';
                      }
                      return null;
                    },
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: BorderTextFormField(
                    controller: _confirmPasswordController,
                    hidden: true,
                    labelText: 'Confirm Password',
                    suffixIcon: Icon(Icons.visibility_off),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please complete this field';
                      } else if (value != _passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  )),
              Padding(
                  padding: EdgeInsets.only(
                    top: 40.0,
                  ),
                  child: Row(children: <Widget>[
                    StandardFlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: "BACK"),
                    Spacer(),
                    Container(
                        width: 140.0,
                        child: StandardRaisedButton(
                            loading:
                                (state.status == RegisterStatus.submitting ||
                                    state.status == RegisterStatus.successful),
                            onPressed: () => _submitForm(context),
                            text: "CONTINUE",
                            icon: Icons.navigate_next)),
                  ])),
            ],
          ));
    }));
  }

  void _submitForm(BuildContext context) {
    // Dismiss the keyboard
    FocusScope.of(context).unfocus();

    if (_registerFormKey.currentState.validate()) {
      final username = _usernameController.text;
      final firstName = _firstNameController.text;
      final lastName = _lastNameController.text;
      final email = _emailController.text;
      final password = _passwordController.text;

      context.read<RegisterBloc>().add(
          RegisterSubmitted(username, firstName, lastName, email, password));
    }
  }
}
