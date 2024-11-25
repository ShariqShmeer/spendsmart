import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendsmart/bloc/key_board_track_bloc/key_board_track_bloc.dart';
import 'package:spendsmart/res/app_size.dart';
import 'package:spendsmart/widgets/custom_scaffold.dart';
import 'package:spendsmart/widgets/custom_text_field.dart';

class AddCategoryAmountScreen extends StatefulWidget {
  const AddCategoryAmountScreen({super.key});

  @override
  State<AddCategoryAmountScreen> createState() =>
      _AddCategoryAmountScreenState();
}

class _AddCategoryAmountScreenState extends State<AddCategoryAmountScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  final FocusNode titleFocus = FocusNode();
  final FocusNode dateFocus = FocusNode();
  final FocusNode amountFocus = FocusNode();
  final FocusNode noteFocus = FocusNode();

  @override
  void dispose() {
    titleController.dispose();
    dateController.dispose();
    amountController.dispose();
    noteController.dispose();

    titleFocus.dispose();
    dateFocus.dispose();
    amountFocus.dispose();
    noteFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(
            'Add Expenses',
          ),
        ),
        backgroundColor: theme.appBarTheme.backgroundColor,
        topWidget: const SizedBox(),
        roundedBodyPercentage: 95,
        roundedBodyWidget: Stack(
          alignment: Alignment.center,
          children: [
            _inputForm(),
            BlocBuilder<KeyBoardTrackBloc, KeyBoardTrackState>(
              builder: (context, keyboard) {
                return Positioned(
                  bottom: keyboard.isVisible == true
                      ? 10.sp
                      : AppSize.defaultBottomNavHeight.sp,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Save'),
                  ),
                );
              },
            ),
          ],
        ));
  }

  Widget _inputForm() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        AppSize.defaultPadding.sp,
        AppSize.defaultPadding.sp,
        AppSize.defaultPadding.sp,
        AppSize.defaultBottomNavHeight.sp,
      ),
      child: Form(
        child: Column(
          children: [
            CustomTextField(
              textEditingController: titleController,
              focusNode: titleFocus,
              name: 'Title',
              fieldHint: 'Title of Transaction',
            ),
            CustomTextField(
              focusNode: dateFocus,
              textEditingController: dateController,
              name: 'Date',
              fieldHint: 'Date of Transaction',
            ),
            CustomTextField(
              focusNode: amountFocus,
              textEditingController: amountController,
              name: 'Amount',
              fieldHint: 'Amount of Transaction',
            ),
            CustomTextField(
              focusNode: noteFocus,
              textEditingController: noteController,
              name: 'Note',
              fieldHint: 'Note for Transaction',
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
