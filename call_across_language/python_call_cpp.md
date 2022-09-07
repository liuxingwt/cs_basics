## python调用C++

#### 1.构造一个名为bird.c的文件
```c++
#include"Python.h"
#include<stdio.h>
#include<string.h>
 
void fly(const char* name)
{
	printf("%s is flying.\n",name);
}
 
static PyObject* bird_fly(PyObject* self, PyObject* args)
{
	const char* name;
	PyArg_ParseTuple(args, "s", &name);
	strcat(name,"_guo");
	fly(name);
	Py_INCREF(Py_None);
	return Py_None;
}
 
static PyMethodDef bird_methods[] = {
	{"fly", bird_fly, METH_VARARGS, "BBBird fly"},
	{NULL,NULL,0,NULL}
};
 
PyMODINIT_FUNC initbird(void)
{
	PyImport_AddModule("BBird");
	Py_InitModule("bird",bird_methods);
}
```

#### 2. 编译出c++的so文件
该文件名需要与python脚本中，import后面的参数一致  
```shell
#gcc -fPIC -c bird.c -o bird.o
#gcc--share bird.o -o bird.so
```

#### 3. 运行如下的python test.py
```python
import bird
 
bird.fly("ty")
```
在命令行窗口，可以看到，c++文件的内容被执行
```shell
#python test.py
ty_guo is flying.
```


#### 参考资料：
+ c++与python之间如何相互调用：https://blog.csdn.net/weixin_42406911/article/details/118968738



