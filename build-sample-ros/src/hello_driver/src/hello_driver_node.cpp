#include <ros/ros.h>
#include <std_msgs/String.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	//Initializes ROS, and sets up a node
	ros::init(argc, argv, "hello_world_stream");
	ros::NodeHandle nh;

	//Ceates the publisher
	ros::Publisher pub = nh.advertise<std_msgs::String>("hello_driver/messages", 1);

	//Sets up the random number generator
	srand(time(0));

	//Sets the loop to publish at a rate of 10Hz
	ros::Rate rate(10);

	while (ros::ok())
	{
		//Declares the message to be sent
		std_msgs::String msg;

		std::stringstream ss;
		ss << "hello world";
		msg.data = ss.str();

		ROS_INFO("%s", msg.data.c_str());

		//Publish the message
		pub.publish(msg);

		//Delays until it is time to send another message
		rate.sleep();
	}
}
