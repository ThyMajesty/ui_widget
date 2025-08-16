# UI Widget

A simple Godot plugin for commonly used UI elements. It was made as a quick way to create and extend settings semi automatically.

### List of components and brieft explanation:
* ```UIWidget``` - parent made mostly for utility
	* ```UIBoolWidget``` - ```CheckButton```
	* ```UIColorPickerWidget``` - ```ColorPickerButton```
	* ```UINumberWidget``` - ```HSlider``` and a ```SpinBox```
		* ```UIIntWidget``` - extends ```UIFloatWidget``` casts to ```int```
		* ```UIFloatWidget``` - extends ```UINumberWidget``` casts to ```float```
	* ```UIListWidget``` - ```OptionButton``` uses textured version
	* ```UIVectorWidget``` - uses ```SpinBox``` elements to represent ```x, y, z, w```
		* ```UIVector2Widget``` - extends ```UIVectorWidget``` casts to ```Vector2```
		* ```UIVector3Widget``` - extends ```UIVectorWidget``` casts to ```Vector3```
		* ```UIVector4Widget``` - extends ```UIVectorWidget``` casts to ```Vector4```

 ```UIWidget``` will try to automatically populate ```view_name``` and ```property_name``` from the name of the node and will do so when Node being renamed. Can be set manually and will reset on every node rename.
