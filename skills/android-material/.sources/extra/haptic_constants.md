# HapticFeedbackConstants
Source: https://developer.android.com/reference/android/view/HapticFeedbackConstants

# HapticFeedbackConstants

Added in[API level 3](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  
Summary:[Constants](https://developer.android.com/reference/android/view/HapticFeedbackConstants#constants)\|[Inherited Methods](https://developer.android.com/reference/android/view/HapticFeedbackConstants#inhmethods)  

# HapticFeedbackConstants

*** ** * ** ***

[Kotlin](https://developer.android.com/reference/kotlin/android/view/HapticFeedbackConstants "View this page in Kotlin")\|Java

`
public


class
HapticFeedbackConstants
`  
`

extends `[Object](https://developer.android.com/reference/java/lang/Object)`


``


`

|---|--------------------------------------|
| [java.lang.Object](https://developer.android.com/reference/java/lang/Object) ||
| ↳ | android.view.HapticFeedbackConstants |

<br />

*** ** * ** ***

Constants to be used to perform haptic feedback effects via[View.performHapticFeedback(int)](https://developer.android.com/reference/android/view/View#performHapticFeedback(int))

## Summary

|                                                                                                                                                                                       ### Constants                                                                                                                                                                                        ||
|-------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `int` | [CLOCK_TICK](https://developer.android.com/reference/android/view/HapticFeedbackConstants#CLOCK_TICK) The user has pressed either an hour or minute tick of a Clock.                                                                                                                                                                                                                |
| `int` | [CONFIRM](https://developer.android.com/reference/android/view/HapticFeedbackConstants#CONFIRM) A haptic effect to signal the confirmation or successful completion of a user interaction.                                                                                                                                                                                          |
| `int` | [CONTEXT_CLICK](https://developer.android.com/reference/android/view/HapticFeedbackConstants#CONTEXT_CLICK) The user has performed a context click on an object.                                                                                                                                                                                                                    |
| `int` | [DRAG_START](https://developer.android.com/reference/android/view/HapticFeedbackConstants#DRAG_START) The user has started a drag-and-drop gesture.                                                                                                                                                                                                                                 |
| `int` | [FLAG_IGNORE_GLOBAL_SETTING](https://developer.android.com/reference/android/view/HapticFeedbackConstants#FLAG_IGNORE_GLOBAL_SETTING) *This constant was deprecated in API level 33. Starting from[Build.VERSION_CODES.TIRAMISU](https://developer.android.com/reference/android/os/Build.VERSION_CODES#TIRAMISU)only privileged apps can ignore user settings for touch feedback.* |
| `int` | [FLAG_IGNORE_VIEW_SETTING](https://developer.android.com/reference/android/view/HapticFeedbackConstants#FLAG_IGNORE_VIEW_SETTING) Flag for[View.performHapticFeedback(int, int)](https://developer.android.com/reference/android/view/View#performHapticFeedback(int,%20int)): Ignore the setting in the view for whether to perform haptic feedback, do it always.                 |
| `int` | [GESTURE_END](https://developer.android.com/reference/android/view/HapticFeedbackConstants#GESTURE_END) The user has finished a gesture (e.g. on the soft keyboard).                                                                                                                                                                                                                |
| `int` | [GESTURE_START](https://developer.android.com/reference/android/view/HapticFeedbackConstants#GESTURE_START) The user has started a gesture (e.g. on the soft keyboard).                                                                                                                                                                                                             |
| `int` | [GESTURE_THRESHOLD_ACTIVATE](https://developer.android.com/reference/android/view/HapticFeedbackConstants#GESTURE_THRESHOLD_ACTIVATE) The user is executing a swipe/drag-style gesture, such as pull-to-refresh, where the gesture action is "eligible" at a certain threshold of movement, and can be cancelled by moving back past the threshold.                                 |
| `int` | [GESTURE_THRESHOLD_DEACTIVATE](https://developer.android.com/reference/android/view/HapticFeedbackConstants#GESTURE_THRESHOLD_DEACTIVATE) The user is executing a swipe/drag-style gesture, such as pull-to-refresh, where the gesture action is "eligible" at a certain threshold of movement, and can be cancelled by moving back past the threshold.                             |
| `int` | [KEYBOARD_PRESS](https://developer.android.com/reference/android/view/HapticFeedbackConstants#KEYBOARD_PRESS) The user has pressed a virtual or software keyboard key.                                                                                                                                                                                                              |
| `int` | [KEYBOARD_RELEASE](https://developer.android.com/reference/android/view/HapticFeedbackConstants#KEYBOARD_RELEASE) The user has released a virtual keyboard key.                                                                                                                                                                                                                     |
| `int` | [KEYBOARD_TAP](https://developer.android.com/reference/android/view/HapticFeedbackConstants#KEYBOARD_TAP) The user has pressed a soft keyboard key.                                                                                                                                                                                                                                 |
| `int` | [LONG_PRESS](https://developer.android.com/reference/android/view/HapticFeedbackConstants#LONG_PRESS) The user has performed a long press on an object that is resulting in an action being performed.                                                                                                                                                                              |
| `int` | [NO_HAPTICS](https://developer.android.com/reference/android/view/HapticFeedbackConstants#NO_HAPTICS) No haptic feedback should be performed.                                                                                                                                                                                                                                       |
| `int` | [REJECT](https://developer.android.com/reference/android/view/HapticFeedbackConstants#REJECT) A haptic effect to signal the rejection or failure of a user interaction.                                                                                                                                                                                                             |
| `int` | [SEGMENT_FREQUENT_TICK](https://developer.android.com/reference/android/view/HapticFeedbackConstants#SEGMENT_FREQUENT_TICK) The user is switching between a series of many potential choices, for example minutes on a clock face, or individual percentages.                                                                                                                       |
| `int` | [SEGMENT_TICK](https://developer.android.com/reference/android/view/HapticFeedbackConstants#SEGMENT_TICK) The user is switching between a series of potential choices, for example items in a list or discrete points on a slider.                                                                                                                                                  |
| `int` | [TEXT_HANDLE_MOVE](https://developer.android.com/reference/android/view/HapticFeedbackConstants#TEXT_HANDLE_MOVE) The user has performed a selection/insertion handle move on text field.                                                                                                                                                                                           |
| `int` | [TOGGLE_OFF](https://developer.android.com/reference/android/view/HapticFeedbackConstants#TOGGLE_OFF) The user has toggled a switch or button into the off position.                                                                                                                                                                                                                |
| `int` | [TOGGLE_ON](https://developer.android.com/reference/android/view/HapticFeedbackConstants#TOGGLE_ON) The user has toggled a switch or button into the on position.                                                                                                                                                                                                                   |
| `int` | [VIRTUAL_KEY](https://developer.android.com/reference/android/view/HapticFeedbackConstants#VIRTUAL_KEY) The user has pressed on a virtual on-screen key.                                                                                                                                                                                                                            |
| `int` | [VIRTUAL_KEY_RELEASE](https://developer.android.com/reference/android/view/HapticFeedbackConstants#VIRTUAL_KEY_RELEASE) The user has released a virtual key.                                                                                                                                                                                                                        |

| ### Inherited methods |
|-----------------------|---|
| From class` `[java.lang.Object](https://developer.android.com/reference/java/lang/Object)` ` |--------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------| | ` `[Object](https://developer.android.com/reference/java/lang/Object)          | ` `[clone](https://developer.android.com/reference/java/lang/Object#clone())`() ` Creates and returns a copy of this object.                                                                                                                                                      | | ` boolean`                                                                     | ` `[equals](https://developer.android.com/reference/java/lang/Object#equals(java.lang.Object))`(`[Object](https://developer.android.com/reference/java/lang/Object)` obj) ` Indicates whether some other object is "equal to" this one.                                           | | ` void`                                                                        | ` `[finalize](https://developer.android.com/reference/java/lang/Object#finalize())`() ` Called by the garbage collector on an object when garbage collection determines that there are no more references to the object.                                                          | | ` final `[Class](https://developer.android.com/reference/java/lang/Class)`<?>` | ` `[getClass](https://developer.android.com/reference/java/lang/Object#getClass())`() ` Returns the runtime class of this`Object`.                                                                                                                                                | | ` int`                                                                         | ` `[hashCode](https://developer.android.com/reference/java/lang/Object#hashCode())`() ` Returns a hash code value for the object.                                                                                                                                                 | | ` final void`                                                                  | ` `[notify](https://developer.android.com/reference/java/lang/Object#notify())`() ` Wakes up a single thread that is waiting on this object's monitor.                                                                                                                            | | ` final void`                                                                  | ` `[notifyAll](https://developer.android.com/reference/java/lang/Object#notifyAll())`() ` Wakes up all threads that are waiting on this object's monitor.                                                                                                                         | | ` `[String](https://developer.android.com/reference/java/lang/String)          | ` `[toString](https://developer.android.com/reference/java/lang/Object#toString())`() ` Returns a string representation of the object.                                                                                                                                            | | ` final void`                                                                  | ` `[wait](https://developer.android.com/reference/java/lang/Object#wait(long,%20int))`(long timeoutMillis, int nanos) ` Causes the current thread to wait until it is awakened, typically by being*notified* or*interrupted*, or until a certain amount of real time has elapsed. | | ` final void`                                                                  | ` `[wait](https://developer.android.com/reference/java/lang/Object#wait(long))`(long timeoutMillis) ` Causes the current thread to wait until it is awakened, typically by being*notified* or*interrupted*, or until a certain amount of real time has elapsed.                   | | ` final void`                                                                  | ` `[wait](https://developer.android.com/reference/java/lang/Object#wait())`() ` Causes the current thread to wait until it is awakened, typically by being*notified* or*interrupted*.                                                                                             | ||

## Constants

### CLOCK_TICK

Added in[API level 21](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int CLOCK_TICK
```

The user has pressed either an hour or minute tick of a Clock.

<br />

Constant Value: 4 (0x00000004)  

### CONFIRM

Added in[API level 30](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int CONFIRM
```

A haptic effect to signal the confirmation or successful completion of a user interaction.

<br />

Constant Value: 16 (0x00000010)  

### CONTEXT_CLICK

Added in[API level 23](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int CONTEXT_CLICK
```

The user has performed a context click on an object.

<br />

Constant Value: 6 (0x00000006)  

### DRAG_START

Added in[API level 34](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int DRAG_START
```

The user has started a drag-and-drop gesture. The drag target has just been "picked up".

<br />

Constant Value: 25 (0x00000019)  

### FLAG_IGNORE_GLOBAL_SETTING

Added in[API level 3](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  
Deprecated in[API level 33](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int FLAG_IGNORE_GLOBAL_SETTING
```

<br />

**This constant was deprecated in API level 33.**   
Starting from[Build.VERSION_CODES.TIRAMISU](https://developer.android.com/reference/android/os/Build.VERSION_CODES#TIRAMISU)only privileged apps can ignore user settings for touch feedback.

Flag for[View.performHapticFeedback(int, int)](https://developer.android.com/reference/android/view/View#performHapticFeedback(int,%20int)): Ignore the global setting for whether to perform haptic feedback, do it always.

<br />

Constant Value: 2 (0x00000002)  

### FLAG_IGNORE_VIEW_SETTING

Added in[API level 3](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int FLAG_IGNORE_VIEW_SETTING
```

Flag for[View.performHapticFeedback(int, int)](https://developer.android.com/reference/android/view/View#performHapticFeedback(int,%20int)): Ignore the setting in the view for whether to perform haptic feedback, do it always.

<br />

Constant Value: 1 (0x00000001)  

### GESTURE_END

Added in[API level 30](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int GESTURE_END
```

The user has finished a gesture (e.g. on the soft keyboard).

<br />

Constant Value: 13 (0x0000000d)  

### GESTURE_START

Added in[API level 30](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int GESTURE_START
```

The user has started a gesture (e.g. on the soft keyboard).

<br />

Constant Value: 12 (0x0000000c)  

### GESTURE_THRESHOLD_ACTIVATE

Added in[API level 34](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int GESTURE_THRESHOLD_ACTIVATE
```

The user is executing a swipe/drag-style gesture, such as pull-to-refresh, where the gesture action is "eligible" at a certain threshold of movement, and can be cancelled by moving back past the threshold. This constant indicates that the user's motion has just passed the threshold for the action to be activated on release.

<br />

**See also:**

- [GESTURE_THRESHOLD_DEACTIVATE](https://developer.android.com/reference/android/view/HapticFeedbackConstants#GESTURE_THRESHOLD_DEACTIVATE)

Constant Value: 23 (0x00000017)  

### GESTURE_THRESHOLD_DEACTIVATE

Added in[API level 34](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int GESTURE_THRESHOLD_DEACTIVATE
```

The user is executing a swipe/drag-style gesture, such as pull-to-refresh, where the gesture action is "eligible" at a certain threshold of movement, and can be cancelled by moving back past the threshold. This constant indicates that the user's motion has just re-crossed back "under" the threshold for the action to be activated, meaning the gesture is currently in a cancelled state.

<br />

**See also:**

- [GESTURE_THRESHOLD_ACTIVATE](https://developer.android.com/reference/android/view/HapticFeedbackConstants#GESTURE_THRESHOLD_ACTIVATE)

Constant Value: 24 (0x00000018)  

### KEYBOARD_PRESS

Added in[API level 27](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int KEYBOARD_PRESS
```

The user has pressed a virtual or software keyboard key.

<br />

Constant Value: 3 (0x00000003)  

### KEYBOARD_RELEASE

Added in[API level 27](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int KEYBOARD_RELEASE
```

The user has released a virtual keyboard key.

<br />

Constant Value: 7 (0x00000007)  

### KEYBOARD_TAP

Added in[API level 8](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int KEYBOARD_TAP
```

The user has pressed a soft keyboard key.

<br />

Constant Value: 3 (0x00000003)  

### LONG_PRESS

Added in[API level 3](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int LONG_PRESS
```

The user has performed a long press on an object that is resulting in an action being performed.

<br />

Constant Value: 0 (0x00000000)  

### NO_HAPTICS

Added in[API level 34](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int NO_HAPTICS
```

No haptic feedback should be performed. Applications may use this value to indicate skipping a call to[View.performHapticFeedback](https://developer.android.com/reference/android/view/View#performHapticFeedback(android.os.vibrator.HapticFeedbackRequest))entirely, or else rely that it will immediately return`false`.

<br />

Constant Value: -1 (0xffffffff)  

### REJECT

Added in[API level 30](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int REJECT
```

A haptic effect to signal the rejection or failure of a user interaction.

<br />

Constant Value: 17 (0x00000011)  

### SEGMENT_FREQUENT_TICK

Added in[API level 34](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int SEGMENT_FREQUENT_TICK
```

The user is switching between a series of many potential choices, for example minutes on a clock face, or individual percentages. This constant is expected to be very soft, so as not to be uncomfortable when performed a lot in quick succession. If the device can\\u2019t make a suitably soft vibration, then it may not make any vibration.

Some specializations of this constant exist for specific actions, notably[CLOCK_TICK](https://developer.android.com/reference/android/view/HapticFeedbackConstants#CLOCK_TICK)and[TEXT_HANDLE_MOVE](https://developer.android.com/reference/android/view/HapticFeedbackConstants#TEXT_HANDLE_MOVE).

See also[SEGMENT_TICK](https://developer.android.com/reference/android/view/HapticFeedbackConstants#SEGMENT_TICK).

<br />

Constant Value: 27 (0x0000001b)  

### SEGMENT_TICK

Added in[API level 34](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int SEGMENT_TICK
```

The user is switching between a series of potential choices, for example items in a list or discrete points on a slider.

See also[SEGMENT_FREQUENT_TICK](https://developer.android.com/reference/android/view/HapticFeedbackConstants#SEGMENT_FREQUENT_TICK)for cases where density of choices is high, and the haptics should be lighter or suppressed for a better user experience.

<br />

Constant Value: 26 (0x0000001a)  

### TEXT_HANDLE_MOVE

Added in[API level 27](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int TEXT_HANDLE_MOVE
```

The user has performed a selection/insertion handle move on text field.

<br />

Constant Value: 9 (0x00000009)  

### TOGGLE_OFF

Added in[API level 34](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int TOGGLE_OFF
```

The user has toggled a switch or button into the off position.

<br />

Constant Value: 22 (0x00000016)  

### TOGGLE_ON

Added in[API level 34](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int TOGGLE_ON
```

The user has toggled a switch or button into the on position.

<br />

Constant Value: 21 (0x00000015)  

### VIRTUAL_KEY

Added in[API level 5](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int VIRTUAL_KEY
```

The user has pressed on a virtual on-screen key.

<br />

Constant Value: 1 (0x00000001)  

### VIRTUAL_KEY_RELEASE

Added in[API level 27](https://developer.android.com/guide/topics/manifest/uses-sdk-element#ApiLevels)  

```
public static final int VIRTUAL_KEY_RELEASE
```

The user has released a virtual key.

<br />

Constant Value: 8 (0x00000008)

