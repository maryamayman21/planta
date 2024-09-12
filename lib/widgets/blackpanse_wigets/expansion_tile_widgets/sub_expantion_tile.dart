import 'package:flutter/material.dart';

class SubExpantionTile extends StatelessWidget {
  const SubExpantionTile({super.key, required this.subtitle});
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(subtitle),
      children: const [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            ''' - Small pots or large pots if you don't want to change pots later) or seedling trays if sowing in large quantities.
Whether you plan to plant directly in pots or transfer to soil, it's best to 
sow seeds in pots first for easier moisture, pest, and nutrient management...


- Fungicide: This is an essential part of the preparation process. 
It helps to limit harmful molds affecting your seeds and future crops.


- Planting soil: According to feedback and practical experience from gardeners, sowing seeds in a mixture of coconut coir + 
compost (ratio 7:3, even 100% coconut coir) yields better results than sowing in clean soil.


 However, coconut coir needs to be soaked and rinsed several times to remove tannin
(brown-yellow color) before use, and compost should also be rinsed multiple times to remove salt.
- Planting Cabinet - Humidity Control''',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
