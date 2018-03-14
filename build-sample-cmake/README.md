# Sample of typical directory layout

It has next modules (projects/components):

- src/engine - shared library with unit tests
- src/main - main executable with unit tests
- test/acceptance - acceptance tests

To build:

```make
mkdir build
cd build
cmake ..
make
make test
```

it is compatible with catkin_make tool, at least top level.
