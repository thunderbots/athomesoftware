## Author: Devon Ash
## Maitnainer: noobaca2@gmail.com

import roslib
import rospy
import smach
import smach_ros

class FailedStatePrompt(smach.State):

    def __init__(self):
        smach.State.__init__(self, outcomes=["FailedStatePrompt"])
        self.counter = 0

    def execute(self, userdata):
        rospy.loginfo("FailedStatePrompt")

        # TODO listen for speech to text commands that tell Talos "Ok, Talos" has been detected and set this variable true.        
        failed_attempt = 0
        unsuccessful_attempt = 0
        successful_attempt = 0

        #TODO Set up proper logic for statement below
        if (failed_attempt):
            return "FailedToRemember"
        else:
            return "UnsuccessfulAttempts"


