import 'package:flutter/material.dart';

import '../../../core/utils/app_prefs.dart';

class RememberCheckBox extends StatefulWidget {
  RememberCheckBox({super.key, required this.selected});

  final bool selected;
  @override
  State<RememberCheckBox> createState() => _RememberCheckBoxState();
}

class _RememberCheckBoxState extends State<RememberCheckBox> {
 late bool selected;

  @override
  void initState() {
    super.initState();
    // Charger l'état sauvegardé lors de la création du widget
    selected = widget.selected;
    loadSavedState();
  }

  void loadSavedState() async {
    bool savedState = await AppPreferences.loadRememberCheckBoxState();
    setState(() {
      selected = savedState;
    });
  }

  void saveState(bool value) async {
    setState(() {
      selected = value;
    });
    // Sauvegarder l'état lorsque la case à cocher est modifiée
    await AppPreferences.saveRememberCheckBoxState(selected);
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Color.fromARGB(255, 47, 125, 203),
      value: selected,
      onChanged: (value) {
        saveState(value ?? false);
      },
    );
  }
}
