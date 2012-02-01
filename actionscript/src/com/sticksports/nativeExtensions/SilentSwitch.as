package com.sticksports.nativeExtensions
{
	import flash.external.ExtensionContext;
	
	/**
	 * iOS implementation
	 */
	public class SilentSwitch
	{
		private static var extensionContext : ExtensionContext;
		
		/**
		 * Force all playing sounds to observe the hardware silent switch setting
		 */
		public static function apply():void
		{
			if( !extensionContext )
			{
				extensionContext = ExtensionContext.createExtensionContext( "com.sticksports.nativeExtensions.SilentSwitch", null );
			}
			extensionContext.call("initSilentSwitch");
		}
	}
}

