# Alt text

Source: https://m3.material.io/foundations/content-design/alt-text

Effective alt text describes the meaning and context of images for screen reader users


## Tab 1

#### How to write great alt text

##### Overview
Alternative text (alt text) refers to off-screen text that is used by screen reader accessibility software. Screen readers read out visible content such as paragraph and button text, as well as hidden content, including alt text for icons and headings.
Alt text also displays when an image doesn’t load. It tells people what they need to know about an image if they can’t see it.

[DO] 4 tin mugs and appropriate alt text.

[DON'T] 4 tin mugs with file name as alt text.

##### When to use alt text
If you remove the image from the page and no information is lost, then the image is decorative and doesn’t need alt text or a caption.
An image can be marked decorative using a null alt attribute, such as **alt=””** in HTML, which will hide the content from screen reader users.

##### Focus on the meaning of the image
Describe the context and overall meaning, rather than focusing on the details. For example, in a shopping app, focus on the item for sale rather than the things around it.
Alt text can also help improve SEO, but its primary purpose should be to make sites usable for all.

[DO] Watering can in a shopping app and good alt text.

[DON'T] Watering can in a shopping app and overly detailed alt text.

##### Keep it short
The recommended length for alt text is 140 characters. 
If alt text is too long, it may be cut off by some screen readers, which is a poor user experience.

[DO] Relates idea of keeping alt text to a max of 140 characters.

[DON'T] Long alt text can be overwhelming and ineffective.

##### Don’t start alt text with “image of”
Screen readers announce “image” when they come across an image. If your start your alt text with “image of” a screen reader will announce “image, image of.”

[DO] Makes the point of not  using “image of” to start alt text.

[DON'T] Makes the point that poor alt text starts with “Image of.”

#### Context and nearby text

##### Context matters
Use adjacent text to establish the context and word choices for alt text. Adjacent text includes all of the text near an image, such as body text, captions, and headlines. 
Don’t repeat the caption in alt text. It’s against best practices because the user will hear the same text twice, which is a poor experience.
Be consistent in your word choices. For example, don’t use “antique” in a caption and “vintage” in the alt text.

[DO] Shopping app with image of a chair in a bathroom.

[DO] Home decorating blog post heading and caption and image of a wooden chair in bathroom.

##### Alt text is subjective
Alt text is another layer of creative expression and should support the goals and style of its context.
The same image should have different alt text in different settings. Use the information in the app or article and the caption to decide what to emphasize in the alt text.

[DO] Shows idea of alt text supporting the caption.

[DON'T] Shows idea of alt text  missing key information from the image.

[DO] Shows idea of alt text focussing on the meaning of the image.

[DO] Shows idea of alt text reinforcing the caption theme.

[DON'T] Shows idea of overly detailed alt text.

##### Captions should benefit all users
A caption should be useful to someone who can see the image clearly, as well as a screen reader user. 
Good captions support the image rather than duplicating its information. A well-written caption makes it easier to write alt text.

[DO] Alt text of “flying pigeons” supports the caption “Pigeons have a distinct silhouette.” 

[DON'T] The caption and alt text are both “Pigeons have a distinct silhouette.”

#### Types of imagery

##### When to describe the type of image
Occasionally it benefits users to name the type of image. This can include:

- Chart
- Infographic
- Map
- Graph
- Screenshot
- Headshot
- Diagram

[CAUTION] Map with alt text that begins with “map of.”

##### Charts and graphs
Alt text is particularly important for visualizations such as charts and graphs. 

Visualizations can either be editorial and meant to support a specific purpose or key takeaway, or more open-ended and used for general data analysis.

Consider the core purpose of the chart or graph, and what information someone would need to use it.

Link to the data that generated the chart or graph, if it’s available.

When possible, explain the key takeaways and meaning in context, rather than detailing every data point.

A general formula for chart alt text would be: “Summary of [data type] + [reason for showing the chart].”

[DO] Alt text that summarizes the meaning of the chart.

[DON'T] Alt text for a chart that details too many data points. 

**Charts for editorial use
**
Charts with an editorial focus are used to support a key takeaway. This takeaway and the main data points confirming it should be the focus of the alt text. To create the alt text, leverage existing content from the body text, labels, and any text in the graph.

For example, a chart from a weekly digest showing highlights of physical activity may have a written summary of the total change in step count. This can be used in the alt text.

[DO] A fitness digest with a takeaway and metric highlighted in sample alt text.

**Charts for analysis**
Charts for analysis are meant to be reviewed as a whole, and offer pieces of data to be analyzed. They can be dense, appear alongside related charts, and have many takeaways. 

For charts that have one or two key takeaways, include these insights in the alt text. 

To avoid introducing unintentional bias in charts with many possible takeaways, highlight opportunities for exploration, such as a link to the data’s source. Emphasize key data points or mention that there isn’t a single takeaway.

[DO] Chart for analysis with alt text that describes general structure and provides link to data.

[DON'T] Chart for analysis with alt text that inaccurately summarizes it.

**Use interactive charts**
To improve the screen reader experience,  consider using interactive charts instead of static images, especially for complex visualizations that are used for analysis. For interactive charts, a tooltip can show additional detail for specific data points.

See Top Tips for Data Accessibility (https://m3.material.io/blog/data-visualization-accessibility) for more ways to make these visualizations accessible.

##### Video and motion alt text
As with still images, if the animated information isn’t elsewhere on the screen, then it is informative and needs alt text.

Long-form video content uses video description to narrate the visual elements of a video, so it doesn’t need alt text.

Alt text on informative GIFs or motion assets should highlight the important points. Think of a heading or title you might give it, and that’s likely your alt text.

[DO] alt=""

[DON'T] alt=""
