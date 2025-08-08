import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_light.dart';
import 'package:evently_app/features/events/domain/usecases/get_place_name_usecase.dart';
import 'package:evently_app/features/events/presentation/cubit/create_event_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  void initState() {
    context.read<CreateEventCubit>().getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BlocConsumer<CreateEventCubit, CreateEventState>(
              listener: (context, state) {
                if (state is PlaceNameLoaded) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(milliseconds: 1000),
                      content: SizedBox(
                        height: 20,
                        child: Center(
                          child: Text(
                            "Location Selected Successfully",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      backgroundColor: Colors.green,
                    ),
                  );
                  Navigator.of(context).pop();
                }
              },
              buildWhen: (previous, current) => current is LocationLoaded,
              builder: (context, state) {
                if (state is LocationLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColorCommon.primary,
                    ),
                  );
                } else if (state is LocationError) {
                  return Center(child: Text(state.message));
                } else if (state is LocationLoaded) {
                  return MapWidget(
                    onTapListener: (m) async {
                      context.read<CreateEventCubit>().getPlaceName(
                        LocationParams(
                          latitude: m.point.coordinates.lat.toDouble(),
                          longitude: m.point.coordinates.lng.toDouble(),
                        ),
                      );
                    },
                    styleUri:
                        Theme.of(context).brightness == Brightness.light
                            ? MapboxStyles.LIGHT
                            : MapboxStyles.DARK,
                    onMapCreated: (controller) async {
                      controller.scaleBar.updateSettings(
                        ScaleBarSettings(enabled: false),
                      );
                      controller.location.updateSettings(
                        LocationComponentSettings(enabled: true),
                      );
                      controller.setCamera(
                        CameraOptions(
                          zoom: 15,
                          center: Point(
                            coordinates: Position(
                              state.location.longitude,
                              state.location.latitude,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ],
        ),
        bottomSheet: Container(
          height: 60,
          color: AppColorCommon.primary,
          child: Center(
            child: Text(
              "Tap on Location To Select",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: AppColorLight.background,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
