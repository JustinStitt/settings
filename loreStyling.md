# for Stylebot

[link](https://chrome.google.com/webstore/detail/stylebot/oiaejidbmkiecgbjeifoejpgmdaleoha/related?hl=en-US)

```
@import url(https://fonts.googleapis.com/css2?family=Fira+Code:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap);

@import url(https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap);

#b {
  font-family: Roboto;
  font-weight: 400;
  font-size: 14;
  font-style: normal;
  text-align: left;
  background-color: #efefef;
  color: black;
  border: 5px solid coral;
  border-radius: 10px;
}

span.q {
  font-family: Fira Code;
  font-size: 11px;
  line-height: 12px;
  color: #6aa84f;
  /* background-color: #434343; */
  border-style: none;
}

a[href="#r"] {
  color: red;
}

#R {
  background-color: darkslateblue;
}

#R > b {
  background-color: slategray;
}

span.JustinStitt {
  background-color: darkslateblue;
    color: gold;
}

span.LGTM {
  color: aliceblue;
  background-color: green;
}

span.From {
  color: aliceblue;
  background-color: green;
  border-radius: 10px;
  text-transform: uppercase;
  box-shadow: 0 0 10px darkgreen;
}

span.To {
  background-color: orangered;
  border-radius: 10px;
  text-transform: uppercase;
  box-shadow: 0 0 10px orangered;
  color: aliceblue;
}

span.Subject {
  background-color: darkcyan;
  border-radius: 10px;
  text-transform: uppercase;
  box-shadow: 0 0 10px darkcyan;
  color: aliceblue;
}

span.Date {
  background-color: darkkhaki;
  border-radius: 10px;
  text-transform: uppercase;
  box-shadow: 0 0 10px darkkhaki;
  color: aliceblue;
}

span.Cc {
  background-color: maroon;
  border-radius: 10px;
  text-transform: uppercase;
  box-shadow: 0 0 10px maroon;
  color: aliceblue;
}

span.TestedBy, span.ReviewedBy, .SignedOffBy {
  background-color: palevioletred;
  border-radius: 10px;
  text-transform: uppercase;
  box-shadow: 0 0 10px palevioletred;
  color: aliceblue;
}

```

# for custom js extension

[link](https://chrome.google.com/webstore/detail/custom-javascript-for-web/ddbjnfjiigjmcpcpkmhogomapikjbjdk/related?hl=en)

```
function applyKeywordStyles(_keyword, styles) {
  // find the element in the dom
  // sanitize keyword
  let classname = '';
  for(let i = 0; i < _keyword.length; i++) {
    if(_keyword[i].toLowerCase() < 'a' || _keyword[i].toLowerCase() > 'z') continue;
    classname += _keyword[i];
  }
  console.log(classname);
  let spanid = `<span class="${classname}">${_keyword}</span>`
  document.body.innerHTML = document.body.innerHTML.replaceAll(
    _keyword, spanid
  );
  let elements = document.getElementsByClassName(classname);
  // console.log(elements);
  // for (let i = 0; i < elements.length; i++) {
  //   let ele = elements[i];
  //   Object.keys(styles).forEach((prop) => {
  //     let val = styles[prop];
  //     ele.style[prop] = val;
  //   });
  // }
}
applyKeywordStyles('From:', {
  'color': 'aliceblue',
  'background-color': 'green',
  'border-radius': '10px',
  'text-transform': 'uppercase',
  'box-shadow': '0 0 10px darkgreen',
});

applyKeywordStyles('Justin Stitt', {
  'color': 'yellow',
  'background-color': 'purple',
});

applyKeywordStyles('LGTM', {
  'color': 'yellow',
  'background-color': 'purple',
});

applyKeywordStyles('To:', {});
applyKeywordStyles('Subject:', {});
applyKeywordStyles('Date:', {});
applyKeywordStyles('Cc:', {});
applyKeywordStyles('Tested-by:', {});
applyKeywordStyles('Reviewed-by:', {});

applyKeywordStyles('Signed-off-by:', {});

// from_tag.style.color = 'aliceblue';
// from_tag.style['background-color'] = 'green';
// from_tag.style['border-radius'] = '5px';
// from_tag.style['text-transform'] = 'uppercase';
// from_tag.style['font-size'] = '16px';
```
