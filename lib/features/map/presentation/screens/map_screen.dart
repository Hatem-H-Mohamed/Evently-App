import 'dart:typed_data';
import 'package:evently_app/core/app_assets/images/app_images.dart';
import 'package:evently_app/core/app_theme/app_color/app_color_common.dart';
import 'package:evently_app/features/events/presentation/cubit/create_event_cubit.dart';
import 'package:evently_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:evently_app/features/map/presentation/cubit/map_cubit.dart';
import 'package:evently_app/features/map/presentation/widgets/map_event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapboxMap? _controller;

  @override
  void initState() {
    super.initState();
    context.read<CreateEventCubit>().getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BlocConsumer<CreateEventCubit, CreateEventState>(
              listener: (context, state) {},
              buildWhen: (previous, current) => current is LocationLoaded,
              builder: (context, state1) {
                if (state1 is LocationLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColorCommon.primary,
                    ),
                  );
                } else if (state1 is LocationError) {
                  return Center(child: Text(state1.message));
                } else if (state1 is LocationLoaded) {
                  return BlocBuilder<HomeCubit, HomeState>(
                    buildWhen:
                        (previous, current) => current is GetEventSuccess,
                    builder: (context, state2) {
                      if (state2 is GetEventSuccess) {
                        return BlocListener<MapCubit, MapState>(
                          listener: (context, state3) {
                            if (state3 is MoveTo && _controller != null) {
                              _controller!.setCamera(
                                CameraOptions(
                                  zoom: 15,
                                  center: Point(
                                    coordinates: Position(
                                      state3.longitude,
                                      state3.latitude,
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                          child: MapWidget(
                            styleUri:
                                Theme.of(context).brightness == Brightness.light
                                    ? MapboxStyles.LIGHT
                                    : MapboxStyles.DARK,
                            onMapCreated: (controller) async {
                              _controller = controller; // store controller!

                              controller.scaleBar.updateSettings(
                                ScaleBarSettings(enabled: false),
                              );
                              controller.location.updateSettings(
                                LocationComponentSettings(
                                  enabled: true,
                                  pulsingEnabled: true,
                                ),
                              );

                              controller.setCamera(
                                CameraOptions(
                                  zoom: 15,
                                  center: Point(
                                    coordinates: Position(
                                      state1.location.longitude,
                                      state1.location.latitude,
                                    ),
                                  ),
                                ),
                              );

                              // Add markers
                              final pointAnnotationManager =
                                  await controller.annotations
                                      .createPointAnnotationManager();

                              final ByteData bytes = await rootBundle.load(
                                "assets/map/map_marker.png",
                              );
                              final Uint8List list = bytes.buffer.asUint8List();

                              final options =
                                  state2.events.map((event) {
                                    return PointAnnotationOptions(
                                      geometry: Point(
                                        coordinates: Position(
                                          event.longitude,
                                          event.latitude,
                                        ),
                                      ),
                                      iconSize: 0.1,
                                      image: list,
                                      iconAnchor: IconAnchor.BOTTOM,
                                    );
                                  }).toList();

                              pointAnnotationManager.createMulti(options);
                            },
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
          Positioned(
            left: 16,
            right: 0,
            bottom: 35,
            height: 94,
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is GetEventSuccess) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.events.length,
                    itemBuilder: (context, index) {
                      return MapEventCard(
                        imageId: state.events[index].imageId,
                        title: state.events[index].title,
                        placeName: state.events[index].placeName,
                        latitude: state.events[index].latitude,
                        longitude: state.events[index].longitude,
                      );
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
