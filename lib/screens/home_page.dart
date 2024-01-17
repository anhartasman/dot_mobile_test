import 'package:dot_mobile_test/bloc/gallery_list/bloc.dart';
import 'package:dot_mobile_test/bloc/place_list/bloc.dart';
import 'package:dot_mobile_test/bloc/user_profile/bloc.dart';
import 'package:dot_mobile_test/screens/gallery_page.dart';
import 'package:dot_mobile_test/screens/place_page.dart';
import 'package:dot_mobile_test/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:dot_mobile_test/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class home_page extends StatefulWidget {
  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PlaceListBloc>(
            create: (BuildContext context) =>
                di.sl<PlaceListBloc>()..add(PlaceListBlocRetrieve())),
        BlocProvider<GalleryListBloc>(
            create: (BuildContext context) =>
                di.sl<GalleryListBloc>()..add(GalleryListBlocRetrieve())),
        BlocProvider<UserProfileBloc>(
            create: (BuildContext context) =>
                di.sl<UserProfileBloc>()..add(UserProfileBlocRetrieve())),
      ],
      child: Scaffold(
        body: _getPage(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.place),
              label: 'Place',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.photo),
              label: 'Gallery',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'User',
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return place_page();
      case 1:
        return gallery_page();
      case 2:
        return profile_page();
      default:
        return Container();
    }
  }
}
