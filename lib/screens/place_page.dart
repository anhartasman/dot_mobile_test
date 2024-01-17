import 'package:dot_mobile_test/bloc/place_list/bloc.dart';
import 'package:dot_mobile_test/widgets/ListShimmer.dart';
import 'package:flutter/material.dart';
import 'package:dot_mobile_test/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class place_page extends StatelessWidget {
  TextEditingController _etSearch = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Place'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _etSearch,
            decoration: InputDecoration(
              hintText: 'Search...',
              border: OutlineInputBorder(),
            ),
          ),
          BlocConsumer<PlaceListBloc, PlaceListBlocState>(
              listener: (context, state) {},
              builder: (BuildContext context, state) {
                if (state.onLoading) {
                  return Expanded(child: ListShimmer());
                }
                return Expanded(
                    child: ListView.builder(
                  itemCount: state.placeList.length,
                  itemBuilder: (ctx, index) {
                    final thePlace = state.placeList[index];
                    return Container(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Image.network(
                              thePlace.type == "image"
                                  ? thePlace.image
                                  : thePlace.media[0],
                              width: 100,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 100,
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  thePlace.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  thePlace.content,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ));
              }),
        ],
      ),
    );
  }
}
