REGISTER=brt/binfmt-register:0.0.1

set:
	docker run --privileged ${REGISTER} set aarch64
	docker run --rm ${REGISTER} bin aarch64 > qemu-aarch64-static
	chmod +x qemu-aarch64-static

reset:
	docker run --privileged ${REGISTER} clear aarch64
	rm qemu-aarch64-static

ROSCMD=
ROSHOME=/root/ws/src

call_ros:
	docker run --rm -v ${PWD}/qemu-aarch64-static:/usr/bin/qemu-aarch64-static -v ${PWD}/.ros:/root/.ros/ -v ${PWD}:/root/ws/ -w $(ROSHOME) arm64v8/ros:kinetic-ros-base $(ROSCMD)

call_init_workspace: ROSCMD=catkin_init_workspace
call_init_workspace: call_ros

call_create_pkg: ROSCMD=catkin_create_pkg hello_driver roscpp std_msgs
call_create_pkg: call_ros

call_make: ROSCMD=catkin_make
call_make: ROSHOME=/root/ws
call_make: call_ros

dir:
	mkdir -p .ros
	mkdir -p src

init: dir set call_init_workspace call_create_pkg reset
	
	


