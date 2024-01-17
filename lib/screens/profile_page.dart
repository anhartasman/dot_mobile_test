import 'package:dot_mobile_test/bloc/gallery_list/bloc.dart';
import 'package:dot_mobile_test/bloc/user_profile/bloc.dart';
import 'package:dot_mobile_test/routes/app_routes.dart';
import 'package:dot_mobile_test/services/auth_service.dart';
import 'package:dot_mobile_test/widgets/GridShimmer.dart';
import 'package:dot_mobile_test/widgets/ProfileShimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class profile_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: BlocConsumer<UserProfileBloc, UserProfileBlocState>(
          listener: (context, state) {
        if (state is UserProfileBlocStateOnError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      }, builder: (BuildContext context, state) {
        if (state is UserProfileBlocStateOnStarted) {
          return ProfileShimmer();
        }
        if (state is UserProfileBlocStateOnSuccess) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(
                    child: ClipOval(
                  child: Image.network(
                    state.userProfile.avatar,
                    width: 200,
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(child: Text(state.userProfile.username)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(child: Text(state.userProfile.fullname)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(child: Text(state.userProfile.email)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(child: Text(state.userProfile.phone)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      final authService = Get.find<AuthService>();
                      authService
                          .logout()
                          .then((value) => Get.offNamed(Routes.homeRoute));
                    },
                    child: Text('Logout'),
                  ),
                ),
              ),
            ],
          );
        }
        return Container();
      }),
    );
  }
}
