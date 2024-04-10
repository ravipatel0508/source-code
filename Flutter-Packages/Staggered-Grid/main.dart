//
// Staggered Grid View
//
// Created by: Ravi Patel
// Instagram: @bugs_fixes (https://www.instagram.com/bugs_fixes)
//

import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Packages by Bugs Fixes - RaviPatel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const StaggeredGridViewExample(),
    );
  }
}

class StaggeredGridViewExample extends StatelessWidget {
  const StaggeredGridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = List.generate(
      9,
      (index) => Colors.green.withOpacity(Random().nextInt(9) / 10),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Staggered Grid View'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.custom(
            gridDelegate: SliverWovenGridDelegate.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              pattern: [
                const WovenGridTile(1),
                const WovenGridTile(
                  5 / 7,
                  crossAxisRatio: 0.9,
                  alignment: AlignmentDirectional.centerEnd,
                ),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => Tile(
                index: index,
                extent: index.isEven ? 200 : 100,
                backgroundColor: colors[(Random().nextInt(8) + 1)],
              ),
            ),
          )

          /// [Quilted GridView Example]
          // child: GridView.custom(
          //   gridDelegate: SliverQuiltedGridDelegate(
          //     crossAxisCount: 4,
          //     mainAxisSpacing: 10,
          //     crossAxisSpacing: 4,
          //     repeatPattern: QuiltedGridRepeatPattern.inverted,
          //     pattern: [
          //       const QuiltedGridTile(2, 2),
          //       const QuiltedGridTile(2, 1),
          //       const QuiltedGridTile(1, 1),
          //       const QuiltedGridTile(1, 1),
          //     ],
          //   ),
          //   childrenDelegate: SliverChildBuilderDelegate(
          //       (context, index) => Tile(
          //             index: index,
          //             extent: index.isEven ? 200 : 100,
          //             backgroundColor: colors[(Random().nextInt(8) + 1)],
          //             // bottomSpace: index.isEven ? 20 : null,
          //           ),
          //       childCount: 30),
          // ),

          /// [Masonry GridView Example]
          // child: MasonryGridView.count(
          //   crossAxisCount: 4,
          //   mainAxisSpacing: 4,
          //   crossAxisSpacing: 4,
          //   itemCount: 30,
          //   itemBuilder: (context, index) {
          //     return Tile(
          //       index: index,
          //       extent: index.isEven ? 200 : 100,
          //       backgroundColor: colors[(Random().nextInt(8) + 1)],
          //       // bottomSpace: index.isEven ? 20 : null,
          //     );
          //   },
          // ),

          /// [Staggered GridView Example]
          // child: StaggeredGrid.count(
          //   crossAxisCount: 4,
          //   mainAxisSpacing: 4,
          //   crossAxisSpacing: 4,
          //   children: [
          //     StaggeredGridTile.count(
          //       crossAxisCellCount: 2,
          //       mainAxisCellCount: 2,
          //       child: Tile(
          //         index: 0,
          //         backgroundColor: colors[Random().nextInt(9)],
          //       ),
          //     ),
          //     StaggeredGridTile.count(
          //       crossAxisCellCount: 2,
          //       mainAxisCellCount: 1,
          //       child: Tile(
          //         index: 1,
          //         backgroundColor: colors[Random().nextInt(9)],
          //       ),
          //     ),
          //     StaggeredGridTile.count(
          //       crossAxisCellCount: 1,
          //       mainAxisCellCount: 1,
          //       child: Tile(
          //         index: 2,
          //         backgroundColor: colors[Random().nextInt(9)],
          //       ),
          //     ),
          //     StaggeredGridTile.count(
          //       crossAxisCellCount: 1,
          //       mainAxisCellCount: 1,
          //       child: Tile(
          //         index: 3,
          //         backgroundColor: colors[Random().nextInt(9)],
          //       ),
          //     ),
          //     StaggeredGridTile.count(
          //       crossAxisCellCount: 4,
          //       mainAxisCellCount: 2,
          //       child: Tile(
          //         index: 4,
          //         backgroundColor: colors[Random().nextInt(9)],
          //       ),
          //     ),
          //   ],
          // ),
          ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      height: extent,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text('$index', style: const TextStyle(fontSize: 20)),
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          // color: Colors.green,
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        )
      ],
    );
  }
}
