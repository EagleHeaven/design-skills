# Inputs

Source: https://m3.material.io/foundations/interaction/inputs

Inputs are devices that provide interactive control of an app. Common inputs include a mouse, keyboard, or touchpad.


## Tab 1

- Design for touch, keyboard, and mouse interactions
- Embrace multiple input methods and gestures within your app

#### External inputs for devices

People can use external inputs like a mouse, keyboard, or stylus with their phone, tablet, foldable, TV, laptop, or desktop computer. When someone connects an external input to their device, they expect it to behave in familiar and useful ways. Designing for different input methods can make a product more usable and accessible on all screen sizes.

##### Common features of external inputs

###### **Mouse**

- Left and right click
- Mouse wheel
- Extra buttons

###### **Trackpad**

- Left and right click
- Gestures
- Haptics

###### **Physical keyboard**

- Replaces virtual keyboard
- Media keys
- Modifier keys

##### Input device behaviors
Depending on the input device, designers and developers can implement behaviors that meet standard conventions and user expectations.

| Input device action | Anticipated behavior | 
| Mouse and trackpad movement
 | Show a mouse cursor on the screen | 
| Primary click
 | Treat mouse clicks differently than touch events | 
| Secondary click
 | Activate context menus | 
| Hover
 | Change component states | 
| Highlight | Allow text to be selected by the mouse cursor | 
| Mouse wheel and trackpad two finger drag | Scroll list vertically and horizontally | 
| Trackpad pinch
 | Zoom an element or page | 
| Physical keyboard
 | Hide and show on screen keyboard |

#### Mouse and cursor interactions

When an external mouse input device is used, a mouse cursor should be shown, regardless of the device type. 

A mouse may be connected to tablets, laptops, phones, foldables, and more. On some devices, it's possible to use an external input device simultaneously with touch input. 

On devices that don't specifically recognize mouse or stylus input, the mouse is treated as touch input.

##### Primary click

A mouse click or stylus tap should demonstrate the same feedback as touch input. One example of this is showing the ripple for a pressed state.

##### Secondary click

###### Context menus
A secondary click (whether using a single button or two fingers on a trackpad) should activate a context menu. The context menu shows additional options for the object that's clicked. See menus (/m3/pages/menus/overview) for more usage and guidelines.

##### Hover

When using a mouse cursor, help users discover interactive objects by enabling visual changes. When the mouse rests on an interactive element, the hover state is a valuable cue for interaction. See states (/m3/pages/interaction-states/applying-states#71c347c2-dd75-485b-892e-04d2900bd844) for styles and guidelines.

Hovering with a cursor (or stylus) should also invoke tooltips when applicable. See tooltips (/m3/pages/tooltips/overview) for guidance.

##### Cursors

Cursors appear when using external input devices like a mouse or trackpad. The cursor can change to communicate more information about interactive elements.

###### Pointer
By default, external input control should be rendered as a pointer.

###### Hand
The cursor should appear as a hand to indicate links or linked images.

###### Resize arrows
The cursor should change to resize arrows on the boundaries of resizable elements.

###### I-beam
The cursor should appear as an I-beam when hovering on text. When manipulating editable text, the following interactions apply:

- Single click places the cursor

- Double click selects a word

- Triple click selects a paragraph

- Single click deselects text and repositions the cursor

##### Text selection
When selecting text using a mouse, trackpad, or stylus:

- Highlight the selected area using a single color

- Don’t show touch controls next to the highlighted area

##### Text selection with touch control

When interacting using touch, always show touch controls, even if other inputs are connected.

When using a mouse, trackpad, or stylus, show the I-beam and context menu, even if it's a touch device.

##### Stylus input
When using a stylus, cursors are usually not necessary, unless they communicate tool properties such as brush size or shape.

#### Mouse wheel and trackpad gestures

When an external mouse or touchpad is used, the mouse wheel and trackpad gesture allow more actions.

##### Vertical scroll
When a cursor is positioned on a list, the mouse wheel and two-finger touchpad gesture should allow vertical scrolling of the list.

##### Touch scroll & mouse text selection
Upon touch and drag gesture, the text area will scroll. With a mouse interaction, dragging in a text area will select the text.

##### Horizontal scroll
Mouse users should be able to scroll with a mouse wheel to navigate horizontally scrolling fields. Trackpad users should be able to scroll using a two-finger horizontal gesture.

#### Physical keyboard

When a physical keyboard is connected to a device, either externally or as a built-in laptop keyboard, users should be able to perform any actions that the virtual keyboard provides, and more.

##### Show and hide virtual keyboard
A virtual keyboard should appear or hide in response to the presence of a physical keyboard.

[DO] Text being entered into a field with no on-screen keyboard displayed.

[DO] Text being entered into a field with an on-screen keyboard.

##### Common keyboard interactions

###### Enter key
People typically expect the **E****nter** key on a physical keyboard to be enabled by developers to allow a common function like sending a message.

###### Spacebar control
People typically expect the **Spacebar** (or available media keys) to be enabled to play and pause music or video.

###### Tab focus
When keyboard users navigate a page using **Tab**, the focus on interactive items must follow a logical order. On most pages, that means left to right, top to bottom.

When focused from a keyboard or other input device, the focus state includes a ring-like keyboard focus indicator.

###### Escape key

People typically expect the **Escape** key on a physical keyboard to dismiss elements, remove focus, or clear selections.
