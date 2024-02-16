=begin

**"tag" and "element" are interchangeable.

NOTE 1: Using the <form> element
A. At a minimum, a <form> element should have the "action" attribute. This is essentially just a hyperlink (i.e. like an <a> tag)

B. When we use a <form> tag, rather than an <a>, we can also capture the user input by implementing an <input> tag. <input> tag must be a DESCENDANT element of the <form> tag (should be inside of <form>)

NOTE 2: Dealing with the <input> tag
A. Place a "type" attribute inside of <input> to determine the kind of field input the user deals with. "Text" is the most common value type = can leave blank -> default option.

B. There are other values for "type" like: radio, checkbox, password, file.

C. At its base form, the <input> tag should have the attributes "type" and "name"

D. When the button is clicked, the URL sent will be "https://en.wikipedia.org/wiki/Chicago?zebra=". Therefore, the <form> tag assembles a query string and adds it to the END of the URL in the action before placing the request. 

NOTE 3: What are Query strings?
A. Query strings are OPTIONAL part of the URL. They begin after a question mark (?). 

Example:
"http://www.example.com/?fruit=apple&color=green"

B. In the example above, query strings are like Hashes in Ruby. It is a list of k/v pairs. Above, "fruit" and "color" are the KEYS. "apple" and "gree" are the VALUES. 

C. Forms automatically create a query string when submitted (i.e. when users interact with the button + input). The KEY in the query string comes from the "name" attribute in the <input> tag. The VALUE comes from the USER input placed into the <input> box. 

D. The URL before the query string (which is, again, after a question mark (?)) comes from the action. This is essentially the URL link we place inside of Attribute "action".

**Essentially, a code like: 

<form action="https://en.wikipedia.org/wiki/Chicago">
  <input type="text" name="zebra">
  <input type="text" name="giraffe">

  <button>Go to Wikipedia</button>
</form>

**will form a URL like this with user input "alice" and "bob" respectively: 

https://en.wikipedia.org/wiki/Chicago?zebra=alice&giraffe=bob

NOTE 4: The value for the attribute "name" can be ANYTHING. It should be unique WITHIN the <form> tag though.

Example: 

<!-- GOOD: each input name is unique -->

<form action="/process_form">
  <input name="zebra" type="text">
  <input name="giraffe" type="password">
  <button>Submit</button>
</form>

<!-- BAD: input names are not unique -->

<form action="/process_form">
  <input name="zebra" type="text">
  <input name="zebra" type="password">
  <button>Submit</button>
</form>

NOTE 5: Creating VALID forms
A. To conform to HTML standards, we must have a <label> element CONNECTED to each <input> element that the user interacts with.

Example:

<form action="https://en.wikipedia.org/wiki/Chicago">

  <label>Fruit</label>
  <input type="text" name="fruit">

  <label>Color</label>
  <input type="text" name="color">

  <button>Go to Wikipedia</button>
</form>

B. Afterwards, we need to connect the <label> element to the corresponding <input>. To do this, we need attributes for both elements with the SAME unique value.

C. For <label> the attribute is "for" and for <input> the attribute is "id"

D. Therefore, to connect the corresponding <label> and <input> together, we must: 

<form action="https://en.wikipedia.org/wiki/Chicago">

  <label for="fruit">Fruit</label>
  <input type="text" name="fruit" id="fruit">

  <label for="color">Color</label>
  <input type="text" name="color" id="color">

  <button>Go to Wikipedia</button>
</form>

NOTE 6: Why use valid forms?
A. Browsers like chrome are capable of handling invalid <input>'s and <label>'s. However, there are a few reason to use VALID forms:

*For users visiting our app from a phone, it is hard to tap on small fields like checkboxes. In valid forms, if you click on a label, it checks/unchecks the connected checkbox.

*Screen readers need the "for" and "id" attribtues in order to read and fill out forms correctly.

*Search engines penalize you if the forms on your site are invalid.

*The test for rake grade will fail since they won't know how to fill out your forms. 

NOTE 7: How to PREpopulate inputs
1. We can add the attribute "value" in the <input> tag and set a desired value we want to automatically prepopulate the input field.

2. This practice is helpful for creating forms that helps users edit existing values. 

NOTE 8: How to use placeholders in input fields
1. We can add the attribute "palceholder" in the <input> tag and set a desired value we want to HINT the user. This placeholder has NO functional effect on the query. It just gives the user an idea of what to place inside of the <input> field.

NOTE 9: Params in query strings
1. When using forms in our Sinatra and Rails apps, we can access the params hash for k/v pairs possibly inputted by the user in the query string. 

2. Therefore, we can access their input via .fetch method and use that value (user input) however we would like. 

=end
