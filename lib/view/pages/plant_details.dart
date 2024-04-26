import 'package:flutter/material.dart';
import 'package:plant_identify/core/constant/imageassets.dart';

class PlantDetailes extends StatelessWidget {
  const PlantDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 150.0,
                  floating: true,
                  leading: const SizedBox(),
                  flexibleSpace: FlexibleSpaceBar(
                    title: const Text("Plant Name"),
                    background:
                        Image.asset(AppImageAsset.hassan, fit: BoxFit.cover),
                  ),
                ),
              ];
            },
            body: MediaQuery.removePadding(
                context: context, child: const Column())));
  }
}
