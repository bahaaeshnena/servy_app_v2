import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:servy_app/src/utils/constants/colors.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isCategorySelected;
  final List<SelectedListItem>? categories;

  const AppTextField({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCategorySelected,
    this.categories,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: Text(
          'done'.tr,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        clearButtonChild: Text(
          'clear'.tr,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.categories ?? [],
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
              widget.textEditingController.text = item.name;
            }
          }
          showSnackBar(list.toString());
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(
          controller: widget.textEditingController,
          cursorColor: Colors.black,
          onTap: widget.isCategorySelected
              ? () {
                  FocusScope.of(context).unfocus();
                  onTextFieldTap();
                }
              : null,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.category_outlined,
              color: TColors.primaryColor,
            ),
            filled: true,
            fillColor: Colors.black12,
            // contentPadding:
            //     const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
            hintText: widget.textEditingController.text == ""
                ? widget.hint
                : widget.textEditingController.text,
            border: const OutlineInputBorder().copyWith(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(width: 1, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
