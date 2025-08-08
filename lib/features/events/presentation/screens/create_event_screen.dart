import 'package:evently_app/core/app_assets/icons/app_icons.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_light.dart';
import 'package:evently_app/core/consts/category_list.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/features/events/presentation/cubit/create_event_cubit.dart';
import 'package:evently_app/features/home/presentation/widgets/cat_taps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  int? index;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? location;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<CreateEventCubit>().changeCatImage(0);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    for (final path in CategoryList.categoriesLight) {
      precacheImage(AssetImage(path), context);
    }
    for (final path in CategoryList.categoriesDark) {
      precacheImage(AssetImage(path), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColorCommon.primary,
        centerTitle: true,
        title: const Text('Create Event'),
        backgroundColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 20.sp,
          color: AppColorCommon.primary,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: BlocBuilder<CreateEventCubit, CreateEventState>(
                  buildWhen: (previous, current) => current is CategoryChanged,
                  builder: (context, state) {
                    if (state is CategoryChanged) {
                      index = state.index;
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.asset(
                          Theme.of(context).brightness == Brightness.light
                              ? CategoryList.categoriesLight[state.index]
                              : CategoryList.categoriesDark[state.index],
                          fit: BoxFit.cover,
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: CatTaps(tapIndex: 1),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: _titleController,
                      validator:
                          (value) => value!.isEmpty ? "Enter title" : null,
                      decoration: InputDecoration(
                        prefixIconConstraints: BoxConstraints(
                          minWidth: 24.w,
                          minHeight: 24.h,
                        ),
                        contentPadding: const EdgeInsets.all(16),
                        hintText: "Event Title",
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColorCommon.gray
                                  : AppColorLight.background,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                          child: SvgPicture.asset(
                            AppIconsSvg.noteEdit,
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColorCommon.gray
                                  : AppColorLight.background,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Description",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: _descriptionController,
                      validator:
                          (value) =>
                              value!.isEmpty ? "Enter description" : null,
                      maxLength: 100,
                      minLines: 3,
                      maxLines: 3,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        hintText: "Event Description",
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColorCommon.gray
                                  : AppColorLight.background,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIconsSvg.calender,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColorCommon.black
                                  : AppColorLight.background,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "Event Date",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2025),
                              lastDate: DateTime(2100),
                            );
                            setState(() {
                              selectedDate = pickedDate;
                            });
                          },
                          child: Text(
                            selectedDate == null
                                ? "Choose Date"
                                : DateFormat(
                                  "dd/MM/yyyy",
                                ).format(selectedDate!),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColorCommon.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIconsSvg.clock,
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? AppColorCommon.black
                                  : AppColorLight.background,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "Event Time",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            setState(() {
                              selectedTime = pickedTime;
                            });
                          },
                          child: Text(
                            selectedTime == null
                                ? "Choose Time"
                                : selectedTime!.format(context),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColorCommon.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Location",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 62.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(color: AppColorCommon.primary),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("/selectLocation");
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Container(
                                width: 46.w,
                                height: 46.h,
                                decoration: BoxDecoration(
                                  color: AppColorCommon.primary,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),

                                child: Center(
                                  child: SizedBox(
                                    child: SvgPicture.asset(
                                      AppIconsSvg.location,
                                      color:
                                          Theme.of(
                                            context,
                                          ).scaffoldBackgroundColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            BlocBuilder<CreateEventCubit, CreateEventState>(
                              buildWhen:
                                  (previous, current) =>
                                      current is PlaceNameLoaded,
                              builder: (context, state) {
                                if (state is PlaceNameLoaded) {
                                  location = state.placeName;
                                  return Text(
                                    state.placeName,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColorCommon.primary,
                                    ),
                                  );
                                } else {
                                  return Text(
                                    "Choose Event Location",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColorCommon.primary,
                                    ),
                                  );
                                }
                              },
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 9, 0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: AppColorCommon.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    CustomElevatedButton(
                      title: "Add Event",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (selectedDate != null &&
                              selectedTime != null &&
                              location != null) {
                            context.read<CreateEventCubit>().addEvent(
                              index!,
                              _titleController.text,
                              _descriptionController.text,
                              DateFormat("dd/MM/yyyy").format(selectedDate!),
                              selectedTime!.format(context),
                              location!,
                            );
                            Navigator.of(context).pop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Please fill all the fields"),
                                backgroundColor: AppColorCommon.primary,
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
