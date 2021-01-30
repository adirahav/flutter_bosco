import 'package:bosco/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:websafe_svg/websafe_svg.dart';

class GenderRadioButton extends StatefulWidget {
  final String attribute;

  final String labelBoy;
  final String assetSelectedBoy;
  final String assetOffBoy;

  final String labelGirl;
  final String assetSelectedGirl;
  final String assetOffGirl;

  const GenderRadioButton(
      {Key key,
      this.attribute,
      this.labelBoy,
      this.assetSelectedBoy,
      this.assetOffBoy,
      this.labelGirl,
      this.assetSelectedGirl,
      this.assetOffGirl})
      : super(key: key);

  @override
  _GenderRadioButtonState createState() => _GenderRadioButtonState();
}

class _GenderRadioButtonState extends State<GenderRadioButton> {
  FormBuilderState _formState;
  final GlobalKey<FormFieldState> _checkboxKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    _formState = FormBuilder.of(context);
    _formState?.registerFieldKey(widget.attribute, _checkboxKey);
    super.initState();
  }

  String _value = "";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FormField(
          onSaved: (val) {
            _formState?.setAttributeValue(widget.attribute, _value);
          },
          initialValue: false,
          builder: (FormFieldState<bool> field) {
            return Row(
              children: <Widget>[
                GenderContainer(
                  asset: _value == "boy"
                      ? widget.assetSelectedBoy
                      : widget.assetOffBoy,
                  label: widget.labelBoy,
                  onPressed: () => setState(() => _value = "boy"),
                ),
                SizedBox(width: 20),
                GenderContainer(
                  asset: _value == "girl"
                      ? widget.assetSelectedGirl
                      : widget.assetOffGirl,
                  label: widget.labelGirl,
                  onPressed: () => setState(() => _value = "girl"),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}

class GenderContainer extends StatelessWidget {
  final String asset;
  final String label;
  final Function onPressed;

  const GenderContainer({Key key, this.asset, this.label, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          WebsafeSvg.asset(asset, width: 50),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(color: CustomColors.LabelLight),
          ),
        ],
      ),
      onTap: onPressed,
    );
  }
}
