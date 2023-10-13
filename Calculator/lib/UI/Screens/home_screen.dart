import 'package:calculator1/Data/Cubits/DarkandLightCubit/darklight_cubit.dart';
import 'package:calculator1/Data/Cubits/Showvalues/showvalues_cubit.dart';
import 'package:calculator1/Shared/shared_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import '../../Global/global.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarklightCubit, DarklightState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 65.h, left: 25.w),
              child: FloatingActionButton(
                elevation: 2,
                backgroundColor: isdark == true
                    ? Color.fromARGB(255, 48, 50, 55)
                    : Color.fromARGB(255, 231, 229, 229),
                onPressed: () {
                  isdark = !isdark;
                  context.read<DarklightCubit>().switchmode();
                },
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xffED0E98), Color(0xffFE5A2D)],
                    ).createShader(bounds);
                  },
                  child: Icon(
                    isdark == true
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                    weight: 18.w,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          body: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Container(
                padding: EdgeInsets.only(right: 30.w, left: 30.w),
                width: 1.sw,
                height: 1.sh,
                color: isdark == true ? const Color(0xff212327) : Colors.white,
                child: Column(children: [
                  SizedBox(
                    height: 200.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: BlocBuilder<ShowvaluesCubit, ShowvaluesState>(
                      builder: (context, state) {
                        return SingleChildScrollView(
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            showexactvalue ?? "0",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w400,
                              color: isdark == true
                                  ? const Color(0xffCCCDD7)
                                  : Color(0xff637381),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: BlocBuilder<ShowvaluesCubit, ShowvaluesState>(
                      builder: (context, state) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            answer == "" ? "" : "= $answer",
                            style: TextStyle(
                              letterSpacing: 0.5,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 48.sp,
                              fontWeight: FontWeight.w700,
                              color:
                                  isdark == true ? Colors.white : Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
              ),
              Container(
                padding: EdgeInsets.all(15),
                width: 1.sw,
                height: MediaQuery.of(context).size.height * 6 / 10,
                decoration: BoxDecoration(
                  color: isdark == true
                      ? const Color(0xff27292E)
                      : const Color(0xffF5F5F5),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SharedCont(
                          ontapcont: () {
                            context
                                .read<ShowvaluesCubit>()
                                .display(buttonvalues[18]);
                          },
                          hcont: 64.h,
                          shadowcont: [
                            BoxShadow(
                              color: isdark == true
                                  ? const Color.fromARGB(13, 255, 255, 255)
                                  : const Color.fromARGB(13, 0, 0, 0),
                              spreadRadius: 1,
                            )
                          ],
                          childcont: Icon(
                            TablerIcons.arrow_badge_left,
                            weight: 18.w,
                            color: isdark == true ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SharedCont(
                          ontapcont: () {
                            context
                                .read<ShowvaluesCubit>()
                                .display(buttonvalues[7]);

                            context
                                .read<ShowvaluesCubit>()
                                .store(buttonvalues[7]);
                          },
                          hcont: 64.h,
                          childcont: Center(
                            child: Text(
                              "7",
                              style: TextStyle(
                                color: isdark == true
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SharedCont(
                          ontapcont: () {
                            context
                                .read<ShowvaluesCubit>()
                                .display(buttonvalues[4]);

                            context
                                .read<ShowvaluesCubit>()
                                .store(buttonvalues[4]);
                          },
                          hcont: 64.h,
                          childcont: Center(
                            child: Text(
                              "4",
                              style: TextStyle(
                                color: isdark == true
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SharedCont(
                          ontapcont: () {
                            context
                                .read<ShowvaluesCubit>()
                                .display(buttonvalues[1]);

                            context
                                .read<ShowvaluesCubit>()
                                .store(buttonvalues[1]);
                          },
                          hcont: 64.h,
                          childcont: Center(
                            child: Text(
                              "1",
                              style: TextStyle(
                                color: isdark == true
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SharedCont(
                          ontapcont: () {
                            context
                                .read<ShowvaluesCubit>()
                                .display(buttonvalues[17]);
                          },
                          hcont: 64.h,
                          childcont: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xffED0E98),
                                    Color(0xffFE5A2D)
                                  ],
                                ).createShader(bounds);
                              },
                              child: Center(
                                child: Text(
                                  "C",
                                  style: TextStyle(
                                      fontSize: 21.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SharedCont(
                          ontapcont: () {
                            context
                                .read<ShowvaluesCubit>()
                                .display(buttonvalues[16]);
                            count = 5;
                          },
                          hcont: 64.h,
                          shadowcont: [
                            BoxShadow(
                              color: isdark == true
                                  ? const Color.fromARGB(13, 255, 255, 255)
                                  : const Color.fromARGB(13, 0, 0, 0),
                              spreadRadius: 1,
                            )
                          ],
                          childcont: Icon(
                            TablerIcons.percentage,
                            weight: 18.w,
                            color: isdark == true ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SharedCont(
                          ontapcont: () {
                            context
                                .read<ShowvaluesCubit>()
                                .display(buttonvalues[8]);

                            context
                                .read<ShowvaluesCubit>()
                                .store(buttonvalues[8]);
                          },
                          hcont: 64.h,
                          childcont: Center(
                            child: Text(
                              "8",
                              style: TextStyle(
                                color: isdark == true
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SharedCont(
                          ontapcont: () {
                            context
                                .read<ShowvaluesCubit>()
                                .display(buttonvalues[5]);
                            context
                                .read<ShowvaluesCubit>()
                                .store(buttonvalues[5]);
                          },
                          hcont: 64.h,
                          childcont: Center(
                            child: Text(
                              "5",
                              style: TextStyle(
                                color: isdark == true
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SharedCont(
                          ontapcont: () {
                            context
                                .read<ShowvaluesCubit>()
                                .display(buttonvalues[2]);
                            context
                                .read<ShowvaluesCubit>()
                                .store(buttonvalues[2]);
                          },
                          hcont: 64.h,
                          childcont: Center(
                            child: Text(
                              "2",
                              style: TextStyle(
                                color: isdark == true
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SharedCont(
                          ontapcont: () {
                            context
                                .read<ShowvaluesCubit>()
                                .display(buttonvalues[0]);
                            context
                                .read<ShowvaluesCubit>()
                                .store(buttonvalues[0]);
                          },
                          hcont: 64.h,
                          childcont: Center(
                            child: Text(
                              "0",
                              style: TextStyle(
                                color: isdark == true
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SharedCont(
                          ontapcont: () {
                            context
                                .read<ShowvaluesCubit>()
                                .display(buttonvalues[14]);
                            count = 4;
                          },
                          hcont: 64.h,
                          shadowcont: [
                            BoxShadow(
                              color: isdark == true
                                  ? const Color.fromARGB(13, 255, 255, 255)
                                  : const Color.fromARGB(13, 0, 0, 0),
                              spreadRadius: 1,
                            )
                          ],
                          childcont: Icon(
                            TablerIcons.divide,
                            weight: 18.w,
                            color: isdark == true ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SharedCont(
                          ontapcont: () {
                            context
                                .read<ShowvaluesCubit>()
                                .display(buttonvalues[9]);
                            context
                                .read<ShowvaluesCubit>()
                                .store(buttonvalues[9]);
                          },
                          hcont: 64.h,
                          childcont: Center(
                            child: Text(
                              "9",
                              style: TextStyle(
                                color: isdark == true
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SharedCont(
                          ontapcont: () {
                            context
                                .read<ShowvaluesCubit>()
                                .display(buttonvalues[6]);
                            context
                                .read<ShowvaluesCubit>()
                                .store(buttonvalues[6]);
                          },
                          hcont: 64.h,
                          childcont: Center(
                            child: Text(
                              "6",
                              style: TextStyle(
                                color: isdark == true
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SharedCont(
                          ontapcont: () {
                            context
                                .read<ShowvaluesCubit>()
                                .display(buttonvalues[3]);
                            context
                                .read<ShowvaluesCubit>()
                                .store(buttonvalues[3]);
                          },
                          hcont: 64.h,
                          childcont: Center(
                            child: Text(
                              "3",
                              style: TextStyle(
                                color: isdark == true
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SharedCont(
                          ontapcont: () {
                            context
                                .read<ShowvaluesCubit>()
                                .display(buttonvalues[10]);
                          },
                          hcont: 64.h,
                          childcont: Center(
                            child: Text(
                              ".",
                              style: TextStyle(
                                color: isdark == true
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SharedCont(
                          ontapcont: () {
                            context
                                .read<ShowvaluesCubit>()
                                .display(buttonvalues[13]);
                            count = 3;
                          },
                          hcont: 64.h,
                          shadowcont: [
                            BoxShadow(
                              color: isdark == true
                                  ? const Color.fromARGB(13, 255, 255, 255)
                                  : const Color.fromARGB(13, 0, 0, 0),
                              spreadRadius: 1,
                            )
                          ],
                          childcont: Icon(
                            TablerIcons.x,
                            weight: 18.w,
                            color: isdark == true ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SharedCont(
                          ontapcont: () {
                            context
                                .read<ShowvaluesCubit>()
                                .display(buttonvalues[12]);
                            count = 1;
                          },
                          hcont: 64.h,
                          shadowcont: [
                            BoxShadow(
                              color: isdark == true
                                  ? const Color.fromARGB(13, 255, 255, 255)
                                  : const Color.fromARGB(13, 0, 0, 0),
                              spreadRadius: 1,
                            )
                          ],
                          childcont: Icon(
                            TablerIcons.minus,
                            weight: 18.w,
                            color: isdark == true ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SharedCont(
                          ontapcont: () {
                            context
                                .read<ShowvaluesCubit>()
                                .display(buttonvalues[11]);

                            count = 2;
                          },
                          hcont: 64.h,
                          shadowcont: [
                            BoxShadow(
                              color: isdark == true
                                  ? const Color.fromARGB(13, 255, 255, 255)
                                  : const Color.fromARGB(13, 0, 0, 0),
                              spreadRadius: 1,
                            )
                          ],
                          childcont: Icon(
                            TablerIcons.plus,
                            weight: 18.w,
                            color: isdark == true ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        SharedCont(
                          ontapcont: () {
                            context.read<ShowvaluesCubit>().equelPressed();
                          },
                          hcont: 144.h,
                          gradientcont: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xffED0E98), Color(0xffFE5A2D)],
                          ),
                          childcont: Center(
                            child: Text(
                              "=",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
