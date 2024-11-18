import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.textEditingController,
    required this.name,
    required this.fieldHint,
    this.isPasswordField = false,
    this.focusNode,
    this.textInputAction,
    this.maxLines = 1,
    this.onChanged,
    this.onTap,
    this.onTapOutside,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.suffix,
    this.keyboardType,
    this.readOnly = false,
  });

  final TextEditingController textEditingController;
  final String name;
  final String fieldHint;
  final bool isPasswordField;
  final bool? enabled;
  final bool readOnly;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final TextInputType? keyboardType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;

  @override
  void initState() {
    if (widget.isPasswordField) {
      obscureText = widget.isPasswordField;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 12.w,
            bottom: 2.h,
          ),
          child: Text(
            widget.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        TextFormField(
          controller: widget.textEditingController,
          obscureText: obscureText,
          focusNode: widget.focusNode,
          obscuringCharacter: '•',
          enabled: widget.enabled,
          maxLines: widget.maxLines,
          readOnly: widget.readOnly,
          decoration: InputDecoration(
            hintText: widget.fieldHint,
            suffixIcon: widget.suffix ??
                (widget.isPasswordField
                    ? IconButton(
                        onPressed: () {
                          obscureText = !obscureText;
                          setState(() {});
                        },
                        icon: AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          child: obscureText
                              ? Icon(
                                  key: ValueKey(0),
                                  Icons.visibility_off_outlined)
                              : Icon(
                                  key: ValueKey(1), Icons.visibility_outlined),
                        ))
                    : null),
          ),
          textInputAction: widget.textInputAction,
          onTapOutside: widget.onTapOutside ??
              (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: widget.validator,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
        ),
      ],
    );
  }
}
