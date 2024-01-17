import 'package:dot_mobile_test/bloc/gallery_list/bloc.dart';
import 'package:dot_mobile_test/widgets/GridShimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class gallery_page extends StatelessWidget {
  TextEditingController _etSearch = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
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
          BlocConsumer<GalleryListBloc, GalleryListBlocState>(
              listener: (context, state) {},
              builder: (BuildContext context, state) {
                if (state.onLoading) {
                  return Expanded(child: GridShimmer());
                }
                return Expanded(
                    child: GridView.count(
                  childAspectRatio: 1.1,
                  shrinkWrap: true,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 3,
                  children: List.generate(state.galleryList.length, (index) {
                    final theGallery = state.galleryList[index];

                    return Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Colors.grey[100]!, width: 0.5),
                          color: Colors.white),
                      padding: EdgeInsets.all(8),
                      child: Image.network(
                        theGallery.thumbnail,
                        width: 100,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 100,
                          );
                        },
                      ),
                    );
                  }),
                ));
              }),
        ],
      ),
    );
  }
}
