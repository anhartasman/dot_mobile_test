import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class GridShimmer extends StatelessWidget {
  const GridShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child: GridView.count(
          physics: new NeverScrollableScrollPhysics(),
          childAspectRatio: 1.1,
          shrinkWrap: true,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: 3,
          children: List.generate(9, (index) {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[100]!, width: 0.5),
                  color: Colors.white),
              padding: EdgeInsets.all(8),
              width: 20,
              height: 20,
            );
          }),
        ),
      ),
    );
  }
}
