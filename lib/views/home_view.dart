import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:planta/widgets/blackpanse_wigets/carousel_image_widgets/carousel_image_slider.dart';
import 'package:planta/widgets/blackpanse_wigets/expansion_tile_widgets/expansion_tile_item.dart';
import 'package:planta/widgets/blackpanse_wigets/plant_category.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: CarouselImageSlider(),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    PlantCategory(categoryTitle: 'Plant'),
                    SizedBox(
                      width: 16,
                    ),
                    PlantCategory(categoryTitle: 'Outdoor'),
                  ],
                ),
                ExpansionTileItem(
                  tileTitle: 'Basic Knowledge',
                ),
                Divider(
                  color: Color(0xff007537),
                  indent: 15,
                  endIndent: 15,
                  thickness: 2,
                ),
                ExpansionTileItem(
                  tileTitle: 'Staged',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
