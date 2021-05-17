package om.tfjs;

import haxe.extern.EitherType;
import js.lib.Promise;
import js.html.CanvasElement;
import js.html.ImageData;
import js.html.ImageElement;
import js.html.VideoElement;

/**
	Defaults to 'lite_mobilenet_v2'.
	lite_mobilenet_v2 is smallest in size, and fastest in inference speed.
	mobilenet_v2 has the highest classification accuracy.
**/
enum abstract Base(String) to String {
	var mobilenet_v1;
	var mobilenet_v2;
	var lite_mobilenet_v2;
}

private typedef ModelConfig = {
	var ?base : Base;
	var ?modelUrl : String;
}

typedef BBox = {
	var x : Float;
	var y : Float;
	var width : Float;
	var height : Float;
}

private typedef Result = {
	var bbox : BBox;
	@:native("class") var class_ : String;
	var score : Float;
}

/**
	Object detection.
	
	https://github.com/tensorflow/tfjs-models/tree/master/coco-ssd
**/
@:native("cocoSsd")
extern class CocoSSD {
	static function load( ?modelConfig : ModelConfig ) : Promise<CocoSSD>;
	function detect( img : EitherType<ImageData,EitherType<ImageElement,EitherType<CanvasElement,VideoElement>>>, ?maxDetectionSize : Int ) : Promise<Array<Result>>;
}
