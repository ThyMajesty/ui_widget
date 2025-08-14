# UI Widget

A simple Godot plugin for commonly used UI elements. It was made as a quick way to create and extend settings semi automatically.

### List of components and brieft explanation:
* ```UIWidget``` - parent made mostly for utility
    * ```UIBoolWidget``` - ```CheckButton```
    * ```UIColorPickerWidget``` - ```ColorPickerButton```
    * ```UIFloatWidget``` - ```HSlider``` and a ```SpinBox```
        * ```UIIntWidget``` - extends ```UIFloatWidget``` makes sure to use ```int```
    * ```UIListWidget``` - ```OptionButton``` uses textured version
    * ```UIVector2Widget``` - uses two ```SpinBox``` elements to represent ```x``` and ```y```

 ```UIWidget``` will try to automatically populate ```view_name``` and ```property_name``` from the name of the node. 