# UI Widget

A simple Godot plugin for commonly used UI elements. It was made as a quick way to create and extend settings semi automatically.

### List of components and brief explanation:
* ```UIWidget``` - parent made mostly for utility - extends ```BoxContainer```. Shouldn't be used by itself.
	* ```UIBoolWidget``` - uses ```CheckButton```.
	* ```UIColorPickerWidget``` - uses ```ColorPickerButton```.
	* ```UINumberWidget``` - uses ```HSlider``` and a ```SpinBox```. Shouldn't be used by itself.
		* ```UIIntWidget``` - extends ```UIFloatWidget``` casts to ```int```.
		* ```UIFloatWidget``` - extends ```UINumberWidget``` casts to ```float```.
	* ```UIListWidget``` - uses ```OptionButton``` can be used with or w/o texture.
	* ```UIVectorWidget``` - uses ```SpinBox``` elements to represent ```x, y, z, w```. Shouldn't be used by itself.
		* ```UIVector2Widget``` - extends ```UIVectorWidget``` casts to ```Vector2```.
		* ```UIVector3Widget``` - extends ```UIVectorWidget``` casts to ```Vector3```.
		* ```UIVector4Widget``` - extends ```UIVectorWidget``` casts to ```Vector4```.

 ```UIWidget``` will automatically populate ```view_name``` and ```property_name``` from the name of the node and will do so when Node being renamed. Can be set manually and will reset on every node rename.

### List of settings:
* **Group Name** - can be changed to a custom one. Group is set on ```_ready``` and on value change.
* **Scene** - you can create your own scene.
* **Property Name** - a ```String``` that is populated automatically on ```_ready``` and changed on node rename from the Editor. If set from Editor value will not be changed automatically anymore. Made for utility and identification.
* **View Name** - same as **Property Name** but used for setting ```label.text```.
* **Debounce** and **Debounce Time** - used to set debounce behavior. **Debounce** - ```bool``` turns debounce on and off. **Debounce Time** - ```float``` debounce seconds.

#### Node specific settings:
For Number and Vector nodes:
* **Min Value** - a ```float``` minimum field value
* **Max Value** - a ```float``` maximum field value
* **Step Value** - a ```float``` step value

There is a test/showcase scene called ```ui_widget_test.tscn```
[![Screenshot-2025-08-18-231332.jpg](https://i.postimg.cc/50VT97gQ/Screenshot-2025-08-18-231332.jpg)](https://postimg.cc/8FZttbqT)
