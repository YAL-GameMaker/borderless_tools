package ;
import gml.ds.Queue;

/**
 * ...
 * @author YellowAfterlife
 */
@:nativeGen
class WindowFrameDelay {
	var queue:Queue<WindowFrameDelayItem> = new Queue();
	var frameIndex = 0;
	public function new() {
		
	}
	public function add(func:Dynamic, delay:Int, ?arg0:Dynamic, ?arg1:Dynamic, ?arg2:Dynamic, ?arg3:Dynamic) {
		var item:WindowFrameDelayItem = {
			func: func,
			time: frameIndex + delay,
			arg0: arg0,
			arg1: arg1,
			arg2: arg2,
			arg3: arg3,
		};
		queue.enqueue(item);
	}
	@:keep public function update() {
		frameIndex += 1;
		var f;
		while (!queue.isEmpty()) {
			var head = queue.head();
			if (head.time > frameIndex) break;
			queue.dequeue();
			f = head.func;
			f(head.arg0, head.arg1, head.arg2, head.arg3);
		}
	}
}
@:nativeGen @:gml.linear typedef WindowFrameDelayItem = {
	func:Dynamic,
	time:Int,
	arg0:Dynamic,
	arg1:Dynamic,
	arg2:Dynamic,
	arg3:Dynamic,
}