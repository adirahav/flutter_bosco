import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class GenderCheckBox extends StatefulWidget {
  final IconData icon;
  final String attribute;
  final Color backgroundColor;
  final Color iconColor;

  const GenderCheckBox(
      {Key key,
      this.icon,
      this.attribute,
      this.backgroundColor,
      this.iconColor})
      : super(key: key);

  @override
  _GenderCheckBoxState createState() => _GenderCheckBoxState();
}

class _GenderCheckBoxState extends State<GenderCheckBox> {
  FormBuilderState _formState;
  final GlobalKey<FormFieldState> _checkboxKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    _formState = FormBuilder.of(context);
    _formState?.registerFieldKey(widget.attribute, _checkboxKey);
    debugPrint("_checkboxKey = " + _checkboxKey.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      onSaved: (val) {
        _formState?.setAttributeValue(widget.attribute, val);
      },
      initialValue: false,
      builder: (FormFieldState<bool> field) {
        return Row(
          children: <Widget>[
            CircleContainer(
              icon: widget.icon,
              iconColor: field.value ? widget.iconColor : Colors.transparent,
              backgroundColor:
                  field.value ? widget.backgroundColor : Colors.transparent,
              onPressed: () {
                field.didChange(!field.value);
              },
            ),
            SizedBox(width: 20),
            Text(widget.attribute),
          ],
        );
      },
    );
  }
}

class CircleContainer extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final Function onPressed;
  final int radius;
  const CircleContainer({
    Key key,
    @required this.icon,
    this.backgroundColor,
    this.iconColor,
    this.onPressed,
    this.radius,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: backgroundColor,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            width: radius ?? 30,
            height: radius ?? 30,
            child: Icon(
              icon,
              color: iconColor ?? Colors.transparent,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: backgroundColor.opacity == 0
                    ? Colors.black
                    : backgroundColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
