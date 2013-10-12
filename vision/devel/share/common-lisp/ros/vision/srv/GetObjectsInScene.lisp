; Auto-generated. Do not edit!


(cl:in-package vision-srv)


;//! \htmlinclude GetObjectsInScene-request.msg.html

(cl:defclass <GetObjectsInScene-request> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header)))
)

(cl:defclass GetObjectsInScene-request (<GetObjectsInScene-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetObjectsInScene-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetObjectsInScene-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vision-srv:<GetObjectsInScene-request> is deprecated: use vision-srv:GetObjectsInScene-request instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <GetObjectsInScene-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision-srv:header-val is deprecated.  Use vision-srv:header instead.")
  (header m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetObjectsInScene-request>) ostream)
  "Serializes a message object of type '<GetObjectsInScene-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetObjectsInScene-request>) istream)
  "Deserializes a message object of type '<GetObjectsInScene-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetObjectsInScene-request>)))
  "Returns string type for a service object of type '<GetObjectsInScene-request>"
  "vision/GetObjectsInSceneRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetObjectsInScene-request)))
  "Returns string type for a service object of type 'GetObjectsInScene-request"
  "vision/GetObjectsInSceneRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetObjectsInScene-request>)))
  "Returns md5sum for a message object of type '<GetObjectsInScene-request>"
  "9606dc4cf29ccfc019371d2907786218")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetObjectsInScene-request)))
  "Returns md5sum for a message object of type 'GetObjectsInScene-request"
  "9606dc4cf29ccfc019371d2907786218")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetObjectsInScene-request>)))
  "Returns full string definition for message of type '<GetObjectsInScene-request>"
  (cl:format cl:nil "Header header~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetObjectsInScene-request)))
  "Returns full string definition for message of type 'GetObjectsInScene-request"
  (cl:format cl:nil "Header header~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetObjectsInScene-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetObjectsInScene-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetObjectsInScene-request
    (cl:cons ':header (header msg))
))
;//! \htmlinclude GetObjectsInScene-response.msg.html

(cl:defclass <GetObjectsInScene-response> (roslisp-msg-protocol:ros-message)
  ((objects
    :reader objects
    :initarg :objects
    :type (cl:vector vision-msg:RealObject)
   :initform (cl:make-array 0 :element-type 'vision-msg:RealObject :initial-element (cl:make-instance 'vision-msg:RealObject))))
)

(cl:defclass GetObjectsInScene-response (<GetObjectsInScene-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetObjectsInScene-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetObjectsInScene-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vision-srv:<GetObjectsInScene-response> is deprecated: use vision-srv:GetObjectsInScene-response instead.")))

(cl:ensure-generic-function 'objects-val :lambda-list '(m))
(cl:defmethod objects-val ((m <GetObjectsInScene-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision-srv:objects-val is deprecated.  Use vision-srv:objects instead.")
  (objects m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetObjectsInScene-response>) ostream)
  "Serializes a message object of type '<GetObjectsInScene-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'objects))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'objects))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetObjectsInScene-response>) istream)
  "Deserializes a message object of type '<GetObjectsInScene-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'objects) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'objects)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'vision-msg:RealObject))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetObjectsInScene-response>)))
  "Returns string type for a service object of type '<GetObjectsInScene-response>"
  "vision/GetObjectsInSceneResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetObjectsInScene-response)))
  "Returns string type for a service object of type 'GetObjectsInScene-response"
  "vision/GetObjectsInSceneResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetObjectsInScene-response>)))
  "Returns md5sum for a message object of type '<GetObjectsInScene-response>"
  "9606dc4cf29ccfc019371d2907786218")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetObjectsInScene-response)))
  "Returns md5sum for a message object of type 'GetObjectsInScene-response"
  "9606dc4cf29ccfc019371d2907786218")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetObjectsInScene-response>)))
  "Returns full string definition for message of type '<GetObjectsInScene-response>"
  (cl:format cl:nil "vision/RealObject[] objects~%~%~%================================================================================~%MSG: vision/RealObject~%Header header~%geometry_msgs/Point point~%sensor_msgs/Image picture~%string name~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetObjectsInScene-response)))
  "Returns full string definition for message of type 'GetObjectsInScene-response"
  (cl:format cl:nil "vision/RealObject[] objects~%~%~%================================================================================~%MSG: vision/RealObject~%Header header~%geometry_msgs/Point point~%sensor_msgs/Image picture~%string name~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.secs: seconds (stamp_secs) since epoch~%# * stamp.nsecs: nanoseconds since stamp_secs~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetObjectsInScene-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'objects) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetObjectsInScene-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetObjectsInScene-response
    (cl:cons ':objects (objects msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetObjectsInScene)))
  'GetObjectsInScene-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetObjectsInScene)))
  'GetObjectsInScene-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetObjectsInScene)))
  "Returns string type for a service object of type '<GetObjectsInScene>"
  "vision/GetObjectsInScene")