# AS3 Estimated File Download Time
 An example of an ActionScript 3.0 class that can calculate a user's download speed, which can then be used to determine the total time left for a specific file to be downloaded.

<strong>NOTE:</strong>
<p>Currently has a runtime error of #2044, which can be fixed but I don't feel like debugging it right now. The class included in this project can be easily used in any project since all the functions are static.</p>

-----

Here is the current code in the Example File.fla, which if modified to fix the #2044 error, then it should work perfectly fine with any other project you may need it for:

```AS3
var startTime:Number = 0;

function beginDownload(e:MouseEvent):void
{
	// First attempted with URLLoader but still getting error #2044 for some reason..
	// Should work properly when used to perform the initial SWF load with the this.loaderInfo object though.
	var urlLoader:Loader = new Loader();
	//urlLoader.
	//urlLoader.dataFormat = URLLoaderDataFormat.TEXT;
	urlLoader.addEventListener(Event.COMPLETE, onLoadComplete);
	urlLoader.addEventListener(ProgressEvent.PROGRESS, onLoadProgress);
	startTime = getTimer();
	urlLoader.load(new URLRequest(url));
}

function onLoadProgress(e:ProgressEvent):void
{
	speedTxt.text = new String(NetworkSpeedUtil.calculateKBps(e.bytesLoaded, startTime, getTimer()-startTime)) + "KB/s";
	percentTxt.text = new String(Math.round((e.bytesLoaded / e.bytesTotal) * 100)) + "%";
}
```