
import 'package:common/configs/configs.dart';
import 'package:common/configs/manifest.dart';
import 'package:common/res/themes/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TxtBtn extends StatelessWidget {
  final String txt;
  final EdgeInsetsGeometry padding;
  final BorderRadius cornerRadius;
  final GestureTapCallback? _onTap;
  final TextStyle? textStyle;

  TxtBtn(
      this.txt,
    {
      GestureTapCallback? onTap,
      this.padding = const EdgeInsets.all(btnPadding),
      this.cornerRadius = const BorderRadius.all(Radius.circular(btnCornerRadius)),
      this.textStyle,
    }
  ): _onTap = onTap;

  @override
  Widget build(BuildContext context) => Card(
    color: Theme.of(context).buttonColor,
    shape: RoundedRectangleBorder(
      borderRadius: cornerRadius,
    ),
    child: InkWell(
      splashColor: Manifest.theme.colorOnPrimaryRipple,
      onTap: _onTap,
      child: Padding(
        padding: padding,
        child: Text(
          txt,
          style: textStyle ?? SibTextStyles.default_.copyWith(color: Manifest.theme.colorOnPrimary),
          textAlign: TextAlign.center,
        ),
      ),
    )
  );
}

class TxtLink extends StatelessWidget {
  final String txt;
  final GestureTapCallback? _onTap;

  TxtLink(
    this.txt, {
    GestureTapCallback? onTap
  }): _onTap = onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: _onTap,
    child: Text(
      txt,
      style: _onTap != null ? SibTextStyles.regular_colorPrimary : SibTextStyles.default_,
      textAlign: TextAlign.center,
    ),
  );
}

/*
class TxtInput extends StatefulWidget {
  final State Function() _builder;

  TxtInput({
    required String label,
    String? hint,
    String? errorText,
    void Function(String)? onChanged,
    void Function(String)? onSubmitted,
    TextEditingController? textController,
    bool isTypePassword = false,
  }): _builder = (() => TxtInputState(
    label: label,
    hint: hint,
    errorText: errorText,
    onChanged: onChanged,
    onSubmitted: onSubmitted,
    textController: textController,
    isTypePassword: isTypePassword,
  ));

  @override
  State createState() => _builder();
}
 */

class TxtInput extends StatelessWidget {
  final String hint;
  final String label;
  final String? errorText;
  final BorderSide borderSide = BorderSide(width: 2);
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController? textController;
  final bool isTypePassword;
  bool _isPasswordVisible = false;

  TxtInput({
    required this.label,
    String? hint,
    this.errorText,
    this.onChanged,
    this.onSubmitted,
    this.textController,
    this.isTypePassword = false,
  }): this.hint = hint ?? label;

  @override
  Widget build(BuildContext context) => TextField(
    obscureText: isTypePassword && !_isPasswordVisible,
    autocorrect: !isTypePassword,
    enableSuggestions: !isTypePassword,
    onChanged: onChanged,
    onSubmitted: onSubmitted,
    controller: textController,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: borderSide,
      ),
/*
      suffixIcon: !isTypePassword
        ? null
        : InkWell(
          onTap: _togglePassword,
          child: Icon(
            _isPasswordVisible
                ? Icons.visibility_off
                : Icons.visibility
          ),
        ),
 */
/*
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: borderSide.copyWith(color: Colors.yellow),
      ),
      labelStyle: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.yellow),
 */
      errorText: errorText,
      labelText: label,
      hintText: hint,
    ),
  );

  void _togglePassword(){
/*
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
 */
  }
}