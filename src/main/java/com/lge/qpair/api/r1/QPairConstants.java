/**
*  Copyright LG Electronics Inc. ( "LG" )
*
*   Licensed under the Apache License, Version 2.0 (the "License");
*   you may not use this file except in compliance with the License.
*   You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
*   Unless required by applicable law or agreed to in writing, software
*   distributed under the License is distributed on an "AS IS" BASIS,
*   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*   See the License for the specific language governing permissions and
*   limitations under the License.
*/

package com.lge.qpair.api.r1;

/**
 * The <code>QPairConstants</code> class defines useful constants for LG QPair SDK. 
 */
public class QPairConstants {

	/**
	 * The name of the service for QPair.
	 */
    public static final String ACTION_QPAIR_SERVICE = "com.lge.qpair.api.r1.QPairService";

    /**
     * An optional field on callbacks of peer requests.<BR> 
     * The field contains the cause of failure.
     */
    public static final String EXTRA_CAUSE = "com.lge.qpair.api.r1.cause";

    /**  
     * An error cause, which represents that QPair does not work on the device.  
     */
    public static final String CAUSE_QPAIR_IS_OFF = "QPair is off";
    /**
     * An error cause, which represents that an internal error has occurred.
     */
    public static final String CAUSE_QPAIR_HAVE_INTERNAL_ERROR = "QPair have internal error";
    /**
     * An error cause, which represents that QPair cannot connect to the peer.
     */
    public static final String CAUSE_CONNECTION_IS_NOT_AVAILABLE = "Connection is not available";
    /**
     * An error cause, which represents that the connection is not established.
     */
    public static final String CAUSE_CONNECTION_IS_NOT_ESTABLISHED = "Connection is not established";
    /**
     * An error cause, which represents that the connection is not stable.
     */
    public static final String CAUSE_CONNECTION_IS_NOT_STABLE = "Connection is not stable";
    /**
     * An error cause, which represents that a connection error has occurred in Android framework.
     */
    public static final String CAUSE_CONNECTION_SPIT_ERROR = "Connection spit error";
    /**
     * An error cause, which represents that no destination is on the peer.
     */
    public static final String CAUSE_THERE_IS_NO_DESTINATION_ON_PEER = "There is no destination on peer";
    /**
     * An error cause, which represents that the peer throws an exception.
     */
    public static final String CAUSE_EXCEPTION_IS_THROWN_ON_PEER = "Exception is thrown on peer";

    /**
     * An authority string of the properties used on QPair.<BR>
     * All properties are accessible from both the local and the peer. And all properties are synchronized on both devices.<BR>
     * <BR>
     * See the Developing for detailed information about properties.
     */
    static public final String PROPERTY_AUTHORITY = "com.lge.qpair.property";
    /**
     * An URI prefix for accessing properties by content provider.
     */
    static public final String PROPERTY_SCHEME_AUTHORITY = "content://" + PROPERTY_AUTHORITY;

    /**
     * The permission string for sending QPair broadcast messages. <BR>
     * It is not necessary to declare this permission in 3rd party applications.
     */
    static public final String PERMISSION_PROVIDE_QPAIR_SERVICE = "com.lge.qpair.permission.PROVIDE_QPAIR_SERVICE";
    /**
     * The permission string for receiving QPair broadcast messages.<BR>
     * All applications which need to receive broadcast message from QPair are recommended to declare this permission in their manifest files. 
     */
    static public final String PERMISSION_USE_QPAIR_SERVICE = "com.lge.qpair.permission.USE_QPAIR_SERVICE";

    /**
     * A broadcast action which is sent when QPair is initialized. <BR>
     * Receiving this message does not mean that the connection has been established. 
     */
    static public final String ACTION_CALL_FOR_PROPERTIES = "com.lge.qpair.CALL_FOR_PROPERTIES";

    /**
     * A broadcast action which is sent when the state of QPair is changed.<BR>
     * When user switches on or off QPair on the device, this message will be sent. 
     */
    static public final String ACTION_STATE_CHANGED = "com.lge.qpair.STATE_CHANGED";
    /**
     * A field which represents that QPair is on or off.<BR>
     * The field is true when QPair is on, or false when QPair is off.
     */
    public static final String EXTRA_QPAIR_IS_ON = "com.lge.qpair.is_on";

    /**
     * A broadcast action which is sent when the connection is changed.<BR>
     */
    static public final String ACTION_CONNECTION_CHANGED = "com.lge.qpair.CONNECTION_CHANGED";
    /**
     * A field which represents whether the connection is established or not.<BR>
     * The field is true when connection is established, or false when the connection is not established. 
     */
    public static final String EXTRA_QPAIR_CONNECTED = "com.lge.qpair.connected";

}
