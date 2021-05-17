package om.tfjs;

import haxe.extern.EitherType;
import js.lib.Promise;
import js.html.CanvasElement;
import js.html.ImageData;
import js.html.ImageElement;
import js.html.VideoElement;

private typedef ModelConfig = Dynamic;

typedef Prediction = {
	var topLeft : Array<Int>;
	var bottomRight : Array<Int>;
	var ?landmarks : Array<Int>;
	var ?probability : Float;
}

/**
	Detects faces in images.
	
	https://github.com/tensorflow/tfjs-models/tree/master/blazeface
**/
@:native("blazeface")
extern class Blazeface {
	static function load( ?modelConfig : ModelConfig ) : Promise<Blazeface>;
	function estimateFaces( img : EitherType<ImageData,EitherType<ImageElement,EitherType<CanvasElement,VideoElement>>>, ?returnTensors : Int, ?flipHorizontal : Bool, ?annotateBoxes : Bool ) : Promise<Array<Prediction>>;
}
