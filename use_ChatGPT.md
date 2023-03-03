##### 

```python
import openai

openai.api_key = "sk-换成你的api key"

Prompt_example = """
请写一段Python程序,实现从文件夹test读取所有png格式图像,
检测图片是否含有猫和狗,如有,请把该图片保存到文件夹train中。
注意：
1.请使用开源的目标检测算法，如需要安装软件，请说明使用pip的安装命令。
2.程序运行时，请打印每张图片处理的时间，程序运行的最后，需要统计有多少张图片检测到猫和狗，并统计运行总计用时。
3.需要考虑到文件读取和写入失败的异常判断，如果出现异常，需给出提示。
4.请以python代码的格式输出。
"""

Answer = openai.ChatCompletion.create(
    model="gpt-3.5-turbo",
    temperature=0,
    max_tokens=3000,
    top_p=1,
    frequency_penalty=0,
    presence_penalty=0,
    messages=[
        {"role": "system", "content": "You are a useful assistant."},
        {"role": "user", "content": Prompt_example}
    ]
)

# print the completion
print(Answer)

f = open('test-chatgpt-52cv.py','w',encoding='utf-8')
print(Answer["choices"][0]["message"]["content"].strip(" \n"),file=f)

f.close()

```
