import 'package:wesave/ressource/export.dart';

class CustomInput extends StatefulWidget {
  final String title;
  final String placeholder;
  final bool obscure;
  final IconData icon;
  final String err;
  final String? Function(String?) validator;
  final void Function(String) onSaved;
  final int max;
  final int min;
  CustomInput(
      {Key? key,
      required this.title,
      required this.placeholder,
      required this.obscure,
      required this.err,
      required this.validator,
      required this.onSaved,
      required this.icon, required this.max, 
      required this.min})
      : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      onChanged: widget.onSaved,
      validator: widget.validator,
      obscureText: widget.obscure,
      maxLines: widget.max,
      minLines: widget.min,
      decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          hintText: widget.placeholder,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.black45, width: 1))),
    );
  }
}
