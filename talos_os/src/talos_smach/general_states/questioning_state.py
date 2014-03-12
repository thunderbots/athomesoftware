########################################################################
## Author: Devon Ash
## Maintainer: noobaca2@gmail.com
######################## DEVELOPER README ##############################
# Info
#
#     The questioning state listens for a response, given a question to ask. eg. state(question)->answer. 
#
########################################################################
# Imports

import roslib; roslib.load_manifest('sound_play'); roslib.load_manifest('talos_speech')
# It doesn't work any other way, please explain someone?
import talos_speech_listener
from talos_speech_listener.speech_listener import SpeechListener

import rospy
import smach
import smach_ros

from sound_play.msg import SoundRequest
from std_msgs.msg import String
from std_srvs.srv import Empty, EmptyRequest
from talos_speech.srv import ListenForAny
from talos_speech.srv import ListenForAll

############################################ CLASS DEF ##############################################
class QuestioningState(smach.State):

    def __init__(self, question, response=[]):
        self.question = question
        self.response = response
        smach.State.__init__(self, outcomes=["ResponseReceived", "NoResponseGiven"])
        self.counter = 0
        self.attempts = 3

    # Asks the user a question via the sound-play microphone node
    def execute(self, userdata):

        # Publish a sound_play/SoundRequest
        # 3 attempts for asking a question
        for attempt in range(self.attempts):
            #
 
            rospy.loginfo("Asking question: %s", self.question)
            SpeechListener.say("What is your name?")
            rospy.loginfo("Sending sound request...")
            # Listen for the next thing said by calling the listen_for_any service
            rospy.sleep(4)   
            try:

                # Should pause and wait until this returns 
                listen_for_any = rospy.ServiceProxy('listen_for_any', Empty)
                response = listen_for_any()

                print "Is this thing threded"
                # Do a confirmation check

                sound_req.arg = "Is " + response.result + " what you mean? Yes or No"
                sound_req.command = 1
                publisher.publish(sound_req)
                
                listen_for_any_two = rospy.ServiceProxy('listen_for_any', Empty)
                response_two = listen_for_any()

                if (response_two.result == "yes"):
                    ## Return that result
                    self.response.append(response_two.result)
                    return "ResponseReceived"

            except rospy.ServiceException, e:
                print "Service call failed %s" %e

        return "NoResponseGiven"


