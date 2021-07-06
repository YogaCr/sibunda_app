
import 'package:common/util/types.dart';
import 'package:flutter/material.dart';



class TxtInput extends StatelessWidget {
  final String hint;
  final String label;
  final String? errorText;
  final BorderSide borderSide = BorderSide(width: 2);
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController? textController;
  final bool isTypePassword;
  final bool _isPasswordVisible = false;
  final bool readOnly;
  final bool enabled;
  final Widget? suffixIcon;

  TxtInput({
    required this.label,
    String? hint,
    this.errorText,
    this.onChanged,
    this.onSubmitted,
    this.textController,
    this.isTypePassword = false,
    this.readOnly = false,
    this.enabled = true,
    this.suffixIcon,
    bool initIsTxtValid = true,
  }): this.hint = hint ?? label;

  @override
  Widget build(BuildContext context) => TextField(
    enabled: enabled,
    readOnly: readOnly,
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
      suffixIcon: suffixIcon,
      errorText: errorText,
      labelText: label,
      hintText: hint,
    ),
  );
}


class TxtInput_Statefull extends StatefulWidget {
  final String hint;
  final String label;
  final String? errorText;
  final String? Function()? errorTextGenerator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController? textController;
  final TxtValidator? textValidator;
  final bool isTypePassword;
  final bool _isPasswordVisible = false;
  final bool initIsTxtValid;

  TxtInput_Statefull({
    required this.label,
    String? hint,
    this.errorText,
    this.errorTextGenerator,
    this.onChanged,
    this.onSubmitted,
    this.textController,
    this.textValidator,
    this.isTypePassword = false,
    this.initIsTxtValid = true,
  }): this.hint = hint ?? label;


  @override
  State createState() => TxtInput_StatefullState(
    label: label,
    hint: hint,
    errorText: errorText,
    errorTextGenerator: errorTextGenerator,
    onChanged: onChanged,
    onSubmitted: onSubmitted,
    textController: textController,
    textValidator: textValidator,
    isTypePassword: isTypePassword,
    initIsTxtValid: initIsTxtValid,
  );
}

class TxtInput_StatefullState extends State<TxtInput_Statefull> {
  final String hint;
  final String label;
  final String? errorText;
  final String? Function()? errorTextGenerator;
  final BorderSide borderSide = BorderSide(width: 2);
  void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController? textController;
  final bool isTypePassword;
  final bool _isPasswordVisible = false;

  final TxtValidator? textValidator;
  bool _isTxtValid = true;

  TxtInput_StatefullState({
    required this.label,
    String? hint,
    this.errorText,
    this.errorTextGenerator,
    this.onChanged,
    this.onSubmitted,
    this.textController,
    this.textValidator,
    this.isTypePassword = false,
    bool initIsTxtValid = true,
  }): this.hint = hint ?? label,
        _isTxtValid = initIsTxtValid;

  void Function(String)? _initOnChanged(void Function(String)? onChanged, TxtValidator? validator) => validator != null
      ? onChanged != null
        ? (str) => setState(() {
            _isTxtValid = validator(str);
            onChanged(str);
        })
        : (str) => setState(() => _isTxtValid = validator(str))
      : null;

  @override
  Widget build(BuildContext context) => TextField(
    obscureText: isTypePassword && !_isPasswordVisible,
    autocorrect: !isTypePassword,
    enableSuggestions: !isTypePassword,
    onChanged: _initOnChanged(onChanged, textValidator),
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
      errorText: _isTxtValid ? null : errorTextGenerator?.call() ?? errorText,
      labelText: label,
      hintText: hint,
    ),
  );


}