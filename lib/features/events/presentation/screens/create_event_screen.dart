import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/consts/category_list.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/features/events/presentation/cubit/create_event_cubit.dart';
import 'package:evently_app/features/home/presentation/widgets/cat_taps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  @override
  void initState() {
    context.read<CreateEventCubit>().changeCatImage(0);
    super.initState();
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<CreateEventCubit, CreateEventState>(
              builder: (context, state) {
                if (state is CategoryChanged) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      CategoryList.categoriesLight[state.index],
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
                Text("Title"),
                TextFormField(),
                Text("Description"),
                TextFormField(),
                Row(children: [Text("Date"), Spacer(), Text("Choose Date")]),
                Row(
                  children: [Text("Event Time"), Spacer(), Text("Choose Time")],
                ),
                Text("Location"),
                Container(
                  height: 62.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColorCommon.primary),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text("Choose Event Location"),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 9, 0),
                        child: Icon(Icons.arrow_forward_ios, size: 14),
                      ),
                    ],
                  ),
                ),
                CustomElevatedButton(title: "Add Event", onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
