# Explore common use cases
Source: https://developer.android.com/design/ui/wear/guides/patterns/media/use-cases

# Explore common use cases

When designing media apps, prioritize the following use cases. Allow users to do
the following:

- Listen to downloaded media
- Stream media from the watch

## Listen to downloaded media

The following examples show how to help users listen to downloaded media.

### Download media

Users can manually download media items from an entity page. Show the user the
download location, progress, and size.  
<br />

Entity page

<br />

Size of download (Dialog)

<br />

Download progress

<br />

### Browse downloaded media

When the user browses media, display recently downloaded media.  
<br />

Downloads

<br />

Browse

<br />

Entity page

<br />

### Remove downloaded media

If content is already downloaded, show an action to remove the downloaded media
from the device.  
<br />

Downloaded

<br />

Remove download (Dialog)

<br />

Entity page

<br />

### Select output device

If the source device is the watch, prompt users to [select audio output](https://developer.android.com/training/wearables/apps/audio#prompt-the-user-to-connect-a-headset)
before they start listening to music. After the user selects an output device,
play the media and display the output device icon---such as a headset or buds---on
the media controls.  
<br />

Media Player **without** output

<br />

System output switcher (Dialog)

<br />

Media Player **with** output

<br />

## Stream media

Streaming from the watch drains the battery. Prioritize downloaded content
when users choose to listen on the watch by displaying recently used downloads
on the browse list. Add a button that takes users to a full list of downloads,
as shown in the following images.  
<br />

Prioritize downloaded content

<br />

Downloads button

<br />

Downloads list

<br />

For more information, see the [Media Toolkit](https://github.com/google/horologist/tree/main/media) on GitHub.
