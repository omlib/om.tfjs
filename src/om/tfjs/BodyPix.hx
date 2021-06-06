package om.tfjs;

import js.html.ImageElement;
import js.lib.Promise;
import js.lib.Uint8Array;

@:enum abstract Part(String) to String {
    var node;
    var leftEye;
    var rightEye;
    var leftEar;
    var rightEar;
    var leftShoulder;
    var rightShoulder;
    var leftElbow;
    var rightElbow;
    var leftWrist;
    var rightWrist;
    var leftHip;
    var rightHip;
    var leftKnee;
    var rightKnee;
    var leftAnkle;
    var rightAnkle;
}

private typedef ModelConfig = {
	var ?modelUrl : String;
}

private typedef Position = {
	var x : Float;
	var y : Float;
}

private typedef Keypoint = {
	var score : Float;
	var part : Part;
	var position : Position;
}

private typedef Pose = {
	var score : Float;
	var keypoints : Array<Keypoint>;
}

typedef Result = {
	var allPoses : Array<Pose>;
	var data : Uint8Array;
	var width : Int;
	var height : Int;
}

/**
	Person Segmentation .
	
	https://github.com/tensorflow/tfjs-models/tree/master/body-pix
**/
@:native("bodyPix")
extern class BodyPix {

	static function load( ?modelConfig : ModelConfig ) : Promise<BodyPix>;
    
    var baseModel : { mode : Dynamic, outputStride : Int };

    function segmentPerson( img : ImageElement ) : Promise<Result>;
    function segmentPersonParts( img : ImageElement ) : Promise<Result>;
    function segmentMultiPerson( img : ImageElement ) : Promise<Result>;
    function segmentMultiPersonParts( img : ImageElement ) : Promise<Result>;
}
