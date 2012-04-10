package com.sticksports.nativeExtensions
{
	import flash.events.SampleDataEvent;
	import flash.external.ExtensionContext;
	import flash.media.Sound;
	import flash.media.SoundChannel;

	/**
	 * iOS implementation
	 */
	public class SilentSwitch
	{
		private static var extensionContext : ExtensionContext;

		/**
		 * Force all playing sounds to observe the hardware silent switch setting
		 */
		public static function apply() : void
		{
			if ( !extensionContext )
			{
				extensionContext = ExtensionContext.createExtensionContext( "com.sticksports.nativeExtensions.SilentSwitch", null );
			}
			// Setting can only be applied if there is a sound playing.
			var sound : Sound = new Sound();
			sound.addEventListener( SampleDataEvent.SAMPLE_DATA, silence );
			var channel : SoundChannel = sound.play( 0, 1 );
			extensionContext.call( "initSilentSwitch" );
			channel.stop();
		}

		private static function silence( event : SampleDataEvent ) : void
		{
			event.data.writeFloat( 0 );
			event.data.writeFloat( 0 );
		}
	}
}

