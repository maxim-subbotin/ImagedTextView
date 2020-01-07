# ImagedTextView
The simplest control for using of image as background for text.
```Swift
let label = ImagedTextLabel(frame: CGRect(x: 20, y: 50, width: 300, height: 80))
label.image = UIImage(named: "winter")
label.font = UIFont.boldSystemFont(ofSize: 50)
label.textAlignment = .center
label.text = "WINTER"
```
<p align="center">
<table>
  <tr>
    <td>
      <img src="https://raw.github.com/maxim-subbotin/ImagedTextView/master/Screenshots/1.png" width="400px" alt="UILabel with textured text"></img>
    </td>
    <td>
     <img src="https://raw.github.com/maxim-subbotin/ImagedTextView/master/Screenshots/2.png" width="400px" alt="Multiline UILabel with textured text"></img>
    </td>
  </tr>
  <tr>
    <td>Single-line textured text</td>
    <td>Multi-line textured text</td>
  </tr>
</table>

</p>

# ImagedTextField
Using of textured text inside UITextField
```Swift
let input = ImagedTextField(frame: CGRect(x: 20, y: 50, width: 300, height: 80))
input.font = UIFont.boldSystemFont(ofSize: 50)
input.image = UIImage(named: "marble")
```
<p align="center">
  <img src="https://raw.github.com/maxim-subbotin/ImagedTextView/master/Screenshots/3.png" width="400px" alt="UITextField with textured text"></img>
</p>
