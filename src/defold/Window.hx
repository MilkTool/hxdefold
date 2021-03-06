package defold;

/**
    Functions and constants to access the window, window event listeners
    and screen dimming.
**/
@:native("_G.window")
extern class Window {
    /**
        Returns the current dimming mode set on a mobile device.

        The dimming mode specifies whether or not a mobile device should dim the screen after a period without user interaction.

        On platforms that does not support dimming, `DIMMING_UNKNOWN` is always returned.

        @return mode The mode for screen dimming
    **/
    static function get_dim_mode():WindowDimmingMode;

    /**
        Sets the dimming mode on a mobile device.

        The dimming mode specifies whether or not a mobile device should dim the screen after a period without user interaction.
        The dimming mode will only affect the mobile device while the game is in focus on the device, but not when the game is running in the background.

        This function has no effect on platforms that does not support dimming.

        @param mode The mode for screen dimming
    **/
    static function set_dim_mode(mode:WindowDimmingMode):Void;

    /**
        Sets a window event listener.

        @param callback A callback which receives info about window events. Can be null.
    **/
    static function set_listener<T>(callback:T->WindowEvent->WindowEventData->Void):Void;
}


/**
    Dimming mode is used to control whether or not a mobile device
    should dim the screen after a period without user interaction.
**/
@:native("_G.window")
@:enum extern abstract WindowDimmingMode({}) {
    /**
        Dimming off
    **/
    var DIMMING_OFF;

    /**
        Dimming on
    **/
    var DIMMING_ON;

    /**
        This mode indicates that the dim mode can't be determined,
        or that the platform doesn't support dimming.
    **/
    var DIMMING_UNKNOWN;
}


/**
    Window events, used in `Window.set_listener` callbacks.
**/
@:native("_G.window")
@:enum extern abstract WindowEvent({}) {
    /**
        Focus gained window event.

        This event is sent to a window event listener when the game window or app screen has
        gained focus.
        This event is also sent at game startup and the engine gives focus to the game.
    **/
    var WINDOW_EVENT_FOCUS_GAINED;

    /**
        Focus lost window event.

        This event is sent to a window event listener when the game window or app screen has lost focus.
    **/
    var WINDOW_EVENT_FOCUS_LOST;

    /**
        Resized window event.

        This event is sent to a window event listener when the game window or app screen is resized.
        The new size is passed along in the data field to the event listener.
    **/
    var WINDOW_EVENT_RESIZED;
}


/**
    Window event data, used in `Window.set_listener` callbacks.
**/
typedef WindowEventData = {
    /**
        The width of a resize event. null otherwise.
    **/
    @:optional var width:Int;

    /**
        The height of a resize event. null otherwise.
    **/
    @:optional var height:Int;
}
