import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppInput extends StatefulWidget {
  const AppInput({
    super.key,
    this.controller,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.isSearch = false,
    this.isFilled = false,
    this.isEnabled = true,
    this.labelText,
    this.validator,
    this.minLines,
    this.maxLines,
    this.onPress,
    this.suffixIcon,
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final bool isPassword, isEnabled, isFilled, isSearch;
  final String? labelText, prefixIcon;
  final TextInputType keyboardType;
  final FormFieldValidator<String?>? validator;
  final int? minLines, maxLines;
  final VoidCallback? onPress;
  final Widget? suffixIcon;
  final Function(String)? onChanged, onSubmitted;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: TextFormField(
        onFieldSubmitted: widget.onSubmitted,
        onChanged: widget.onChanged,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        decoration: InputDecoration(
          icon: widget.keyboardType == TextInputType.phone
              ? Container(
            height: 60.h,
            width: 69.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Colors.white,
              border: Border.all(
                color: const Color(
                  0xffF3F3F3,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/icons/appInputIcons/saudi.png",
                  width: 32.w,
                  height: 20.h,
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "966+",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                ),
              ],
            ),
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(
              color: Color(
                0xffF3F3F3,
              ),
            ),
          ),
          filled: widget.isFilled,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(
              color: Color(
                0xffF3F3F3,
              ),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(
              color: Color(
                0xffF3F3F3,
              ),
            ),
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            fontSize: 15.sp,
          ),
          prefixIcon: widget.prefixIcon != null
              ? Padding(
            padding: EdgeInsetsDirectional.all(
              12.r,
            ),
            child: SvgPicture.asset(
              widget.prefixIcon!,
              fit: BoxFit.scaleDown,
              height: 20.h,
              width: 32.w,
            ),
          )
              : null,
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              isPasswordHidden ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                isPasswordHidden = !isPasswordHidden;
              });
            },
          )
              : widget.suffixIcon,
        ),
        obscureText: isPasswordHidden && widget.isPassword,
        enabled: widget.isEnabled,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        autofocus: widget.isSearch,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
