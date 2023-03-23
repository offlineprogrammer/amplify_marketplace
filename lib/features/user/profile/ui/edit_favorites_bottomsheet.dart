import 'package:amplify_marketplace/models/ModelProvider.dart';
import 'package:flutter/material.dart';

class EditFavoritesBottomSheet extends StatefulWidget {
  const EditFavoritesBottomSheet({
    required this.favoritedepartments,
    super.key,
  });

  final List<MarketPlaceDepartments>? favoritedepartments;

  @override
  State<EditFavoritesBottomSheet> createState() =>
      _EditFavoritesBottomSheetState();
}

class _EditFavoritesBottomSheetState extends State<EditFavoritesBottomSheet> {
  final formGlobalKey = GlobalKey<FormState>();

  @override
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formGlobalKey,
      child: Container(
        padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 15),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var department in MarketPlaceDepartments.values)
              CheckboxListTile(
                title: Text(department.name),

                value: widget.favoritedepartments!.contains(department),
                onChanged: (bool? value) {
                  if (value!) {
                    setState(() {
                      widget.favoritedepartments!.add(department);
                    });
                  } else {
                    setState(() {
                      widget.favoritedepartments!.remove(department);
                    });
                  }
                },
                //value: _checked,
              ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                child: const Text('OK'),
                onPressed: () async {
                  final currentState = formGlobalKey.currentState;
                  if (currentState == null) {
                    return;
                  }
                  if (currentState.validate()) {
                    Navigator.of(context).pop(widget.favoritedepartments);
                  }
                } //,
                ),
          ],
        ),
      ),
    );
  }
}
