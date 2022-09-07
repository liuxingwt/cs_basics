## C++调用python
首先，需要安装python开发包，然后将python的头文件，放到运行目录下。  
C++代码的第一行要include"Python.h"，不可以放在其他库下，否则报错（重定义之类的）  

#### 1.构造文件名为mypython.py的文件
```python
def Hello():
	print('hello, world!')
 
def _add(x, y):
	print('add', x, 'and', y)
	return x + y
```  
  
#### 2. 构造名为mytest.c的文件
```c++
#include "Python.h"
#include <stdlib.h>
#include <iostream>
 
using namespace std;
 
int main()
{
	Py_Initialize();
	PyRun_SimpleString("import sys");
 
	PyRun_SimpleString("sys.path.append('./')");
 
	PyObject* pModule = PyImport_ImportModule("mypython");
 
	if (!pModule)
	{
		cout << "Python get module failed." << endl;
	}
 
	cout << "Python get module succeed." << endl;
 
	PyObject* pFunc = NULL;
 
	pFunc = PyObject_GetAttrString(pModule, "Hello");
 
	PyEval_CallObject(pFunc, NULL);	
 
	PyObject* pv = PyObject_GetAttrString(pModule, "_add");
	if (!pv || !PyCallable_Check(pv))
	{
		cout << "Can't find function (_add)" << endl;
		return 0;
	}
 
	cout << "Get function (_add) succeed." << endl;
 
	PyObject* args = PyTuple_New(2);
	
	PyObject* arg1 = PyLong_FromLong(4);
	PyObject* arg2 = PyLong_FromLong(3);
 
	PyTuple_SetItem(args, 0, arg1);
	PyTuple_SetItem(args, 1, arg2);
 
	PyObject* pRet = PyObject_CallObject(pv, args);
 
	if(pRet)
	{
		long result = PyLong_AsLong(pRet);
		cout << "result:" << result << endl;
	}
 
	Py_Finalize();
 
	system("pause");
 
	return 0;
```
#### 3.编译上述c++文件
```shell
g++ --std=c++11 mytest.c -lpython3.6m

#./a.out
Python get module succeed.
hello, world!
Get function (_add) succeed.
add 4 and 3
result:7
sh: pause: 未找到命令
```


#### 参考资料：
+ c++与python之间如何相互调用：https://blog.csdn.net/weixin_42406911/article/details/118968738
