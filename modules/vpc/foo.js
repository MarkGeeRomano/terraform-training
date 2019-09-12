const textinput = document.getElementsByClassName("messenger-composer")[0]
const name = document.title.split('/')[0]
textinput.value = `Hey ${name}! Love the profile 😻`;
const submitBtn = document.getElementsByClassName("messenger-toolbar-send")[0]
submitBtn.click()