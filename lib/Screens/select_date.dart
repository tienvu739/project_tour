import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_tour/Screens/hotel.dart';
import 'package:project_tour/core/color_palatte.dart';
import 'package:project_tour/core/dimension_constants.dart';
import 'package:project_tour/widget/button_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../widget/appBar.dart';

class SeclectDate extends StatelessWidget {
  static const String routeName = "selectDate";

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  @override
  Widget build(BuildContext context) {
    return appbar(
      titleString: "Seclect date",
      child: Column(
        children: [
          SizedBox(height: kMediumPadding*2,),
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            selectionColor: ColorPalette.yellowColor,
            startRangeSelectionColor: ColorPalette.yellowColor,
            endRangeSelectionColor: ColorPalette.yellowColor,
            rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
            todayHighlightColor: ColorPalette.yellowColor,
            toggleDaySelection: true,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if(args.value is PickerDateRange)
                {
                  rangeStartDate = args.value.startDate;
                  rangeEndDate = args.value.endDate;
                }else{
                rangeStartDate = null;
                rangeEndDate = null;
              }
            },
          ),
          button_widget(title: "Select",ontap: () {
            Navigator.of(context).pop([rangeStartDate,rangeEndDate]);
          },),
          SizedBox(height: kDefaultPadding,),
          button_widget(title: "Cancel",ontap: () {
            Navigator.of(context).pop([]);
          },)
        ],
      ),
    );
  }
}
