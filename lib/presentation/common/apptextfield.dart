
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fullstacktask/app/theme/colors.dart';

class AppTextField extends StatelessWidget {
  //v=0.4
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autoValidateMode;
  final bool? obscureText;
  final GestureTapCallback? onTap;
  final bool? showCursor;
  final bool? readOnly;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final String? hint;
  final String? title;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? prefixIconSize;
  final double? suffixIconSize;
  final Function()? OnTapsuffixIcon;
  final Function(String)? onFieldSubmitted;
  final Color? hintTextColor;
  final Color? textColor;
  final Color? iconColor;
  final Color? borderColor;
  final bool? autofocus;
  //These cant be applied as it will disturb the textfield
  final int? maxLines;
  //final int minLines;

  AppTextField(
      {this.maxLength,
      this.hint,
      this.focusNode,
      this.prefixIcon,
      this.textInputAction,
      this.validator,
      this.obscureText = false,
      this.autoValidateMode,
      this.title,
      this.controller,
      this.textInputType,
      this.onTap,
      this.showCursor,
      this.readOnly = false,
      this.errorText,
      this.onChanged,
      this.suffixIcon,
      this.prefixIconSize = 18,
      this.suffixIconSize = 18,
      this.fillColor = Colors.white,
      this.OnTapsuffixIcon,
      this.hintTextColor,
      this.textColor,
      this.iconColor,
      this.borderColor,
      this.autofocus, this.maxLines, this.onFieldSubmitted
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? Container()
            : Text(
                title!,
                style: TextStyle(
                  fontSize: 14.sp,
                 //fontFamily: AppFonts.fontFamily,
                  fontWeight: FontWeight.w400,
                  color: AppColor.blackColor,
                ),
              ),
        Container(
          margin: EdgeInsets.only(top: 0),
          child: TextFormField(
            onFieldSubmitted:onFieldSubmitted ,
           autofocus: autofocus??false,
            onChanged: onChanged,
            showCursor: showCursor,
            maxLength: maxLength,
            readOnly: readOnly!,
            onTap: onTap??(){},
            autovalidateMode: autoValidateMode,
            obscureText: obscureText!,
            validator: validator,
            style: TextStyle(
                //fontFamily: AppFonts.fontFamily,
                color:textColor?? AppColor.blackColor, 
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                  color: hintTextColor?? AppColor.whiteColor,
                  //fontFamily: AppFonts.fontFamily,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
              contentPadding: (suffixIcon == null)
                  ? EdgeInsets.only(top: 15.h, left: 7.w)
                  : EdgeInsets.only(top: 15.h),
              suffixIcon: (suffixIcon == null) ? null : GestureDetector(
                onTap: OnTapsuffixIcon,
                child: suffixIcon),
              errorText: errorText,
              //isDense: true,
              fillColor: fillColor,
              filled: true,
              prefixIcon:prefixIcon==null?const SizedBox():
              Container(
                margin: EdgeInsets.fromLTRB(1, 1, 3.sp, 1),
                decoration:const BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.transparent, width: 1),
                  ),
                ),
                child: Container(
                  width: 60.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      bottomLeft: Radius.circular(16.r),
                    ),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(15.sp),
                    child: Row(
                      children: [
                        prefixIcon ?? SizedBox(),
                        // Container(
                        //   margin: EdgeInsets.only(left: 5),
                        //   child: Text(
                        //     '+92',
                        //     style: TextStyle(
                        //         fontFamily: AppFont.fontFamily,
                        //         color:AppColor.whiteLightColor,
                        //         fontSize: 14.sp,
                        //         fontWeight: FontWeight.w500),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(width: 1, color: Colors.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: AppColor.whiteColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color:borderColor?? AppColor.whiteColor,
                ),
              ),
            ),
            controller: controller,
            keyboardType: textInputType,
            maxLines: maxLines??1,
          
          ),
        ),
      ],
    );
  }
}

