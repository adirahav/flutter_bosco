import 'package:bosco/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:websafe_svg/websafe_svg.dart';

class GenderRadio extends StatefulWidget {
  final String attributeBoy;
  final String labelBoy;
  final String assetSelectedBoy;
  final String assetOffBoy;

  final String attributeGirl;
  final String labelGirl;
  final String assetSelectedGirl;
  final String assetOffGirl;

  const GenderRadio(
      {Key key,
      this.attributeBoy,
      this.labelBoy,
      this.assetSelectedBoy,
      this.assetOffBoy,
      this.attributeGirl,
      this.labelGirl,
      this.assetSelectedGirl,
      this.assetOffGirl})
      : super(key: key);

  @override
  _GenderRadioState createState() => _GenderRadioState();
}

class _GenderRadioState extends State<GenderRadio> {
  FormBuilderState _formState;
  final GlobalKey<FormFieldState> _checkboxKeyBoy = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> _checkboxKeyGirl =
      GlobalKey<FormFieldState>();

  @override
  void initState() {
    _formState = FormBuilder.of(context);
    _formState?.registerFieldKey(widget.attributeBoy, _checkboxKeyBoy);
    _formState?.registerFieldKey(widget.attributeGirl, _checkboxKeyGirl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FormField(
          onSaved: (val) {
            _formState?.setAttributeValue(widget.attributeBoy, val);
          },
          initialValue: false,
          builder: (FormFieldState<bool> field) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  /*GenderContainer(
                    field.value ? widget.assetSelectedBoy : widget.assetOffBoy,
                    widget.labelBoy,
                    onPressed: () {
                      field.didChange(!field.value);
                    },
                  ),*/
                  InkWell(
                    child: Column(
                      children: [
                        WebsafeSvg.asset(
                            field.value
                                ? widget.assetSelectedBoy
                                : widget.assetOffBoy,
                            width: 50),
                        SizedBox(height: 10),
                        Text(
                          widget.labelBoy,
                          style: TextStyle(color: CustomColors.LabelLight),
                        ),
                      ],
                    ),
                    onTap: () {
                      field.didChange(!field.value);
                    },
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(width: 20),
        FormField(
          onSaved: (val) {
            _formState?.setAttributeValue(widget.attributeGirl, val);
          },
          initialValue: false,
          builder: (FormFieldState<bool> field) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[],
              ),
            );
          },
        ),
      ],
    );
  }
}

/*class GenderContainer extends StatelessWidget {
  final String asset;
  final String label;
  final Function onPressed;

  const GenderContainer({
    Key key,
    this.asset,
    this.label,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;

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
}*/
