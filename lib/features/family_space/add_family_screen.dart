import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lega_sea/core/static/lega_assets.dart';
import 'package:lega_sea/core/static/lega_colors.dart';
import 'package:lega_sea/features/family_space/models/family_planet_model.dart';
import 'package:lega_sea/features/family_space/models/family_planet_tag.dart';
import 'package:lega_sea/widgets/lega_elevated_button.dart';
import 'package:lega_sea/widgets/lega_inkwell.dart';

class AddFamilyScreen extends StatefulWidget {
  const AddFamilyScreen({super.key});

  @override
  State<AddFamilyScreen> createState() => _AddFamilyScreenState();
}

class _AddFamilyScreenState extends State<AddFamilyScreen> {
  final TextEditingController _nameController = TextEditingController();

  final ValueNotifier<int?> _tagNotifier = ValueNotifier(null);
  final ValueNotifier<int?> _emojiNotifier = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  void onSubjectTap() {
    _tagNotifier.value ??= 0;
    _showDialog(
      CupertinoPicker(
        magnification: 1.22,
        squeeze: 1.2,
        useMagnifier: true,
        itemExtent: 24,
        scrollController: FixedExtentScrollController(initialItem: _tagNotifier.value ?? 0),
        onSelectedItemChanged: (int selectedItem) {
          _tagNotifier.value = selectedItem;
        },
        children: List<Widget>.generate(
          FamilyTag.values.length,
          (int index) {
            return Center(
              child: Text(
                FamilyTag.values[index].name,
              ),
            );
          },
        ),
      ),
    );
  }

  void onEmojiAdd() {
    _emojiNotifier.value ??= 0;
    _showDialog(
      CupertinoPicker(
        magnification: 1.22,
        squeeze: 1.2,
        useMagnifier: true,
        itemExtent: 60,
        scrollController: FixedExtentScrollController(initialItem: _emojiNotifier.value ?? 0),
        onSelectedItemChanged: (int selectedItem) {
          _emojiNotifier.value = selectedItem;
        },
        children: List<Widget>.generate(
          LegaAssets.values.length,
          (int index) {
            return Image.asset(
              LegaAssets.values[index],
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Add Family ',
            style: TextStyle(
              color: LegaColors.primaryContent,
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24),
                LegaInkwell(
                  inkRadius: 100,
                  materialColor: LegaColors.mainTone400,
                  borderRadius: BorderRadius.circular(100),
                  onTap: onEmojiAdd,
                  child: ValueListenableBuilder(
                    valueListenable: _emojiNotifier,
                    builder: (_, index, __) => SizedBox(
                      height: 100,
                      width: 100,
                      child: index == null
                          ? const Icon(
                              Icons.add,
                              color: LegaColors.mainTone700,
                              size: 48,
                            )
                          : Image.asset(LegaAssets.values[index]),
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                LegaTextField(
                  hint: 'Name',
                  controller: _nameController,
                ),
                // const SizedBox(height: 16),
                // LegaTextField(
                //   hint: 'Last Name',
                //   controller: _lastNameController,
                // ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: onSubjectTap,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: LegaColors.mainTone400,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ValueListenableBuilder(
                          valueListenable: _tagNotifier,
                          builder: (_, index, __) => Text(
                            index == null ? 'Subject' : FamilyTag.values[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: index == null ? LegaColors.mainTone700 : LegaColors.dark,
                            ),
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_down_sharp, color: LegaColors.mainTone700),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                LegaElevatedButton(
                  onPressed: () {
                    if (_nameController.text.isEmpty || _tagNotifier.value == null || _emojiNotifier.value == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Fill all fields'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }
                    Navigator.of(context).pop(
                      FamilyPlanetModel(
                        name: _nameController.text,
                        emoji: LegaAssets.values[_emojiNotifier.value!],
                        backgroundColor: LegaColors.getRandomColor(),
                        tag: FamilyTag.values[_tagNotifier.value!],
                      ),
                    );
                  },
                  text: 'SAVE',
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LegaTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const LegaTextField({
    required this.hint,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: LegaColors.dark,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 18,
        ),
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: LegaColors.mainTone400,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: LegaColors.mainTone700,
          ),
          //  LegaColors.mainTone400
        ),
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: LegaColors.mainTone700,
        ),
        fillColor: LegaColors.mainTone400,
        focusColor: LegaColors.mainTone400,
        filled: true,
      ),
    );
  }
}
