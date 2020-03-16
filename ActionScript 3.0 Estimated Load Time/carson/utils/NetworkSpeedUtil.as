package carson.utils
{
	/**
	 * Coded by Carson Bennett on 3/15/2020
	 *
	 * This class can be used to determine bandwidth speed or networking speed.
	 */
	public class NetworkSpeedUtil
	{
		public static function calculateBps(loadedBytes:uint, loadStartTime:uint, elapsedLoadTime:uint):int
		{
			return Math.max(0, (loadedBytes / millisecondsToSeconds(elapsedLoadTime - loadStartTime)));
		}
		
		public static function millisecondsToSeconds(millisecs:Number):Number
		{
			return millisecs / 1000;
		}
		
		public static function calculateKBps(currentBytesLoaded:uint, loadStartTime:uint, elapsedLoadTime:uint):Number
		{
			return bytesToKilobytes(calculateBps(currentBytesLoaded, loadStartTime, elapsedLoadTime));
		}
		
		public static function bytesToKilobytes(totalBytes:Number):Number
		{
			return totalBytes / 1024;
		}
	}
}