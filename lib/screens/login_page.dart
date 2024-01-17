import 'package:dot_mobile_test/architectures/domain/entities/UserAuth.dart';
import 'package:dot_mobile_test/bloc/user_login/bloc.dart';
import 'package:dot_mobile_test/routes/app_routes.dart';
import 'package:dot_mobile_test/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class login_page extends StatefulWidget {
  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController _etEmail = new TextEditingController();
  TextEditingController _etPassword = new TextEditingController();
  void submitForm() {
    final userAuth = UserAuth(
      email: _etEmail.text,
      password: _etPassword.text,
    );
    BlocProvider.of<UserLoginBloc>(context).add(UserLoginBlocStart(userAuth));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<UserLoginBloc, UserLoginBlocState>(
            listener: (context, state) {
          if (state is UserLoginOnSuccess) {
            final authService = Get.find<AuthService>();
            authService.setIsLoggedIn(
              true,
              newUser: state.theAccount,
            );
            // TampilanDialog.showDialogSuccess("Login berhasil");
            Future.delayed(Duration(milliseconds: 500))
                .then((value) => Get.offNamed(Routes.homeRoute));
          } else if (state is UserLoginOnError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        }, builder: (context, state) {
          if (state is UserLoginOnStarted) {
            return Center(
              child: SpinKitWave(
                color: Colors.blue,
                size: 50.0,
              ),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _etEmail,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12.0),
              TextField(
                controller: _etPassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: submitForm,
                child: Text('Submit'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
