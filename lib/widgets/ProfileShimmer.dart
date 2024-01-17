import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[100]!, width: 0.5),
                color: Colors.white),
            padding: EdgeInsets.all(8),
            height: 120,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              width: double.infinity,
              height: 60.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              width: double.infinity,
              height: 60.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              width: double.infinity,
              height: 60.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
