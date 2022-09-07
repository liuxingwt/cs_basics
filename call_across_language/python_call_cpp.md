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

