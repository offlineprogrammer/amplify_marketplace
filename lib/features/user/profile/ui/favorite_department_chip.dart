import 'package:amplify_marketplace/models/ModelProvider.dart';
import 'package:flutter/material.dart';

class FavoriteDepartmentChip extends StatelessWidget {
  const FavoriteDepartmentChip({
    required this.marketPlaceDepartment,
    super.key,
  });
  final MarketPlaceDepartments marketPlaceDepartment;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.white70,
        child: Text(marketPlaceDepartment.name[0].toUpperCase()),
      ),
      label: Text(
        marketPlaceDepartment.name,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.grey[300],
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: const EdgeInsets.all(8.0),
    );
  }
}
