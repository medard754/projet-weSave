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

class CustomTextfield {
  final String title;
  final String placeholder;
  final bool ispass;
  final bool obscure;
  final String err;
  final String content;
  final bool isPasswordField;
  final bool isEgalPassword;
  var onchanged;
  String _value = "";
  CustomTextfield(
      {this.title = "",
      this.placeholder = "",
      this.ispass = false,
      this.obscure = false,
      this.content = "",
      this.err = "",
      this.isPasswordField = false,
      this.isEgalPassword = false,
      @required this.onchanged});
  TextFormField textFormField(placeholder, err, int max, int min, bool obscures,
      IconData icon, onchanged,
      {bool isPasswordField = false, bool isEgalPassword = false}) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      onChanged: onchanged,
      validator: (content) {
        if (content == null || content.isEmpty) {
          return err;
        } else {
          if (isPasswordField) {
            if (content.length < 8) {
              var pwd = content;
              if (isEgalPassword) {
                if (content != pwd) {
                  return "entrer le password entrer en haut";
                }
              }
              return "Entrer un mot de passe au moins 8 caractère";
            }
          }
          return null;
        }
      },
      obscureText: obscures,
      maxLines: max,
      minLines: min,
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          hintText: placeholder,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.black45, width: 1))),
    );
  }
}
