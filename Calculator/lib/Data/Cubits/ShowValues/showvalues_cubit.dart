import 'dart:ffi';
import 'dart:math';
import 'package:math_expressions/math_expressions.dart';
import 'package:bloc/bloc.dart';
import 'package:calculator1/Global/global.dart';

part 'showvalues_state.dart';

class ShowvaluesCubit extends Cubit<ShowvaluesState> {
  ShowvaluesCubit() : super(ShowvaluesInitial());

  dynamic display(dynamic value) {
    if (value == "c") {
      valuelist.clear();
      valuelist.add("0");
      answer = "";
      num1 = num2 = "";
      count = -1;
      showexactvalue = valuelist.join('');

      emit(ShowvaluesInitial());
    } else if (value == "d") {
      if (valuelist.isEmpty || valuelist.length == 1) {
        valuelist[0] = "0";
        num1 = num2 = answer = "";
        count = -1;
        showexactvalue = valuelist.join('');
      } else {
        if (valuelist[0] != "0") {
          valuelist.removeLast();

          if (count == -1) {
            if (num1 != "" && num1.length > 0) {
              num1 = num1.substring(0, num1.length - 1);
            }
          } else {
            if (num2 != "" && num2.length > 0) {
              num2 = num2.substring(0, num2.length - 1);
            }
          }
          showexactvalue = valuelist.join('');
        }
      }
      emit(ShowvaluesInitial());
    } else {
      if (valuelist.isNotEmpty && valuelist[0] == "0") {
        valuelist.clear();
      } else if (valuelist.isNotEmpty &&
          is_char(valuelist.elementAt(valuelist.length - 1)) &&
          is_char(value) &&
          value != "-") {}
      valuelist.add(value);
      showexactvalue = valuelist.join('');
      emit(ShowvaluesInitial());
    }
  }

  store(String value) {
    if (is_digit(value) || value == ".") {
      if (count == -1) {
        num1 += value;
      } else {
        num2 += value;
      }
    }
  }

  bool is_char(String c) {
    return c == '+' || c == '-' || c == 'X' || c == '/' || c == '%';
  }

  bool is_digit(String c) {
    return c != '+' && c != '-' && c != 'X' && c != '/' && c != '%';
  }

  void equelPressed() {
    if (is_char(showexactvalue![showexactvalue!.length - 1])) {
      valuelist.add("0");
      showexactvalue = valuelist.join('');
    }
    String? fianlQuestion = showexactvalue;
    fianlQuestion = fianlQuestion?.replaceAll('X', '*');
    Parser p = Parser();
    Expression exp = p.parse(fianlQuestion!);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
    valuelist.clear();
    valuelist.add(answer);
    showexactvalue = valuelist.join('');
    emit(ShowvaluesInitial());
  }
}
