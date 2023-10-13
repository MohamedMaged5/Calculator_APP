bool isdark = true;
List buttonvalues = [
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  ".",
  "+",
  "-",
  "X",
  "/",
  "=",
  "%",
  "c",
  "d",
];
List valuelist = [];

String? showexactvalue;

int? count = -1;
String? answer = "";
String num1 = "";
String num2 = "";




/*






SharedCont(
                      ontapcont: () {
                        isdark = !isdark;
                        context.read<DarklightCubit>().switchmode();
                      },
                      hcont: 64.h,
                      colorcont: isdark == true
                          ? const Color(0xff27292E)
                          : const Color(0xffF5F5F5),
                      bordercont: Border.all(
                          width: 2,
                          color: isdark == true
                              ? const Color(0xff27292E)
                              : const Color(0xffF5F5F5)),
                      shadowcont: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                        )
                      ],
                      childcont: ShaderMask(
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




 */