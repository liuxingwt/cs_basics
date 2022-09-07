## 编程常问题
#### 1. call_across_language（不同语言之间的相互调用）


##### 1. 如何在CSDN中enable复制
```javascript
// 按F12后进入console，然后输入以下命令
javascript:document.body.contentEditable='true';document.designMode='on'; void 0

//如果无效，则尝试下面的命令
javascript:document.querySelectorAll(".prism").forEach((b)=>{b.onclick = function(e){mdcp.copyCode(e)}});
document.querySelectorAll("style").forEach((s)=>{if((s.innerText||"").indexOf('#content_views pre')>-1){s.parentElement.removeChild(s)}});
```
