########################################################################
## Author: Devon Ash
## Maintainer: noobaca2@gmail.com
######################## DEVELOPER README ##############################
# Info
#
#     The follow me algorithm used in the RoboCup@Home competition for
#     Thunderbots@Home team coded as a state machine
#
########################################################################
# Imports

import roslib
import rospy
import smach
import smach_ros

# Follower state imports
from talos_smach.states.state_machines.follow_me_state_machine import follow_me_state_machine as fmsm
from fmsm.occluded_state import OccludedState
from fmsm.positioning_for_user_state import PositioningForUserState
from fmsm.remembering_user_state import RememberingUserState
from fmsm.user_off_screen_state import UserOffScreenState
from fmsm.no_user_detected_state import NoUserDetectedState
from fmsm.following_state import FollowingState
from fmsm.tracking_unidentified_state import TrackingUnidentifiedUserState
from fmsm.tracking_wrong_user_state import TrackingWrongUserState

############################### CLASS DEF ##############################
class FollowMeStateMachine(smach.StateMachine):

    ## When done, it should return the state "InitialStandbyState"
    def __init__(self):
        outcomes = "InitialStandbyState"
        super(FollowMeStateMachine, self).__init__(outcomes)
        
        # REMEMBER ME STATE
        smach.StateMachine.add('RememberingUserState', RememberingUserState(),transitions={"FailedToRemember":'FailedStatePrompt',    "UserRemembered":'TrackingUnidentifiedUserState',"UnsuccessfulAttempt":'RememberingUserState'})

        # TRACKING UNIDENTIFIED USER STATE
        smach.StateMachine.add('TrackingUnidentifiedUserState', TrackingUnidentifiedUserState(), transitions={'TrackingFailed':'FailedStatePrompt', 'IdentifiedUser':'FollowerCommandStandbyState', 'ContinueTracking':'TrackingUnidentifiedUserState'})

        # FOLLOWER COMMAND STANDBY STATE
        smach.StateMachine.add('FollowerCommandStandbyState', FollowerCommandStandbyState(), transitions={'FollowMeCommandDetected':'FollowingState','RestartCommandDetected':'FailedStatePrompt', 'ContinueStandby':'FollowerCommandStandbyState'})

            # FOLLOWING STATE
        smach.StateMachine.add("FollowingState", FollowingState(), transitions={"ContinueFollowing":"FollowingState", "FollowingFailed":"FailedStatePrompt", "NoUserDetected":"NoUserDetectedState"})

            # NO USER DETECTED STATE
        super.StateMachine.add("NoUserDetectedState", NoUserDetectedState(), transitions={"UserDetected":"FollowingState", "UserOffScreen":"UserOffScreenState", "UserOccluded":"OccludedState", "TrackingWrongUser":"TrackingWrongUserState", "FailedToFindUser":"FailedStatePrompt"})

            # FAILED TRACKING STATE
        super.StateMachine.add("FailedTrackingState", FailedTrackingState(), transitions={"FailedTracking":"FailedStatePrompt"})

            # TRACKING WRONG USER STATE
        super.StateMachine.add("TrackingWrongUserState", TrackingWrongUserState(), transitions={"TrackingCorrected":"FollowingState", "TrackingUncorrected":"TrackingWrongUserState", "TrackingFailed":"FailedTrackingState", "AttemptingToRetrack":"TrackingWrongUserState"})

            # OCCLUDED STATE
        super.StateMachine.add("OccludedState", OccludedState(), transitions={"WaitingForUser":"OccludedState", "PositioningForUser":"PositioningForUserState", "FailedToFindUser":"FailedTrackingState"})

            # POSITIONING FOR USER STATE
        super.StateMachine.add("PositioningForUserState", PositioningForUserState(), transitions={"UserDetected":"FollowingState", "PositioningForUser":"PositioningForUserState", "PositioningForUserFailed":"FailedTrackingState"})

            # USER OFF SCREEN STATE
        super.StateMachine.add("UserOffScreenState", UserOffScreenState(), transitions={"UserDetected":"FollowingState", "UserOffScreenStill":"UserOffScreenState", "FailedToFindUser":"FailedTrackingState"})

