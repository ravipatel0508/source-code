//
// AbsorbPointer Example
//
// Created by: Ravi Patel
// Instagram: @bugs_fixes (https://www.instagram.com/bugs_fixes)
//
// add-dependencies: flutter_staggered_grid_view: latest

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math' as math;

class AbsorbPointerExample extends StatelessWidget {
  const AbsorbPointerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AbsorbPointer Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AbsorbPointer(
          absorbing: true,
          child: GridView.custom(
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: [
                const QuiltedGridTile(2, 2),
                const QuiltedGridTile(1, 1),
                const QuiltedGridTile(1, 1),
                const QuiltedGridTile(1, 2),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[
                      100 * ((math.Random().nextDouble() * 9).toInt() + 1)],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {},
                child: Text('Button $index'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
