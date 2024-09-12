import 'package:flutter/material.dart';
import 'package:planta/widgets/blackpanse_wigets/expansion_tile_widgets/sub_expantion_tile.dart';

class ExpansionTileItem extends StatefulWidget {
  const ExpansionTileItem({super.key, required this.tileTitle});
  final String tileTitle;
  @override
  State<ExpansionTileItem> createState() => _ExpansionTileItemState();
}

class _ExpansionTileItemState extends State<ExpansionTileItem> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        onExpansionChanged: (bool expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
        title: Text(
          widget.tileTitle,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        trailing:
            isExpanded ? const Icon(Icons.minimize) : const Icon(Icons.add),
        children: const <Widget>[
          SubExpantionTile(
            subtitle: 'Step 1: Prepare all tools and seeds',
          ),
          SubExpantionTile(
            subtitle: 'Bước 2: Tiến hành gieo hạt giống cây trồng',
          ),
          SubExpantionTile(
            subtitle: 'Bước 3: Chăm sóc sau khi gieo hạt',
          )
        ],
      ),
    );
  }
}
