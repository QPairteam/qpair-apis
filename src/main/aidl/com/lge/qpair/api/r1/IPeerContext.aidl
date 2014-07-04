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

import com.lge.qpair.api.r1.IPeerIntent;

/**
 * The <code>IPeerContext</code> interface implements a context for the peer device. <P>
 */
interface IPeerContext {
    /**
     * Creates an empty peer intent.
     * 
     * @return a new peer intent.
     */
    IPeerIntent newPeerIntent();

    /**
     * Starts an Activity on the peer device with the given peer intent.<P>
     *
     * @param intent 	A peer intent for creating {@link android.content.Intent} which will
     * be used for starting an Activity <b>on the peer device</b>.
     * @param callbackIntent 	An Intent for callback. <BR>
     *				This intent will be broadcast to <b>
     * the local device</b> if the request fails to process. It could be null.
     * callbackIntent has an extra field with name {@link com.lge.qpair.api.r1.QPairConstants#EXTRA_CAUSE QPairConstants.EXTRA_CAUSE} and type String.
     * Each value in the extra field represents the following meaning.
     * <table>
       <tr>
         <th>Value</th>
         <th>Meaning</th>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_QPAIR_IS_OFF CAUSE_QPAIR_IS_OFF}</td>
         <td>QPair is currently off.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_QPAIR_HAVE_INTERNAL_ERROR CAUSE_QPAIR_HAVE_INTERNAL_ERROR}</td>
         <td>QPair got an internal error.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_CONNECTION_IS_NOT_AVAILABLE CAUSE_CONNECTION_IS_NOT_AVAILABLE}</td>
         <td>Connection to the peer device is not available. The most possible reason is that Bluetooth does not turn on.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_CONNECTION_IS_NOT_ESTABLISHED CAUSE_CONNECTION_IS_NOT_ESTABLISHED}</td>
         <td>Connection to the peer device is not established. The most possible reason is that the peer device is not close enough to the local device.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_CONNECTION_IS_NOT_STABLE CAUSE_CONNECTION_IS_NOT_STABLE}</td>
         <td>Connection to peer device is not stable enough to communicate.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_CONNECTION_SPIT_ERROR CAUSE_CONNECTION_SPIT_ERROR}</td>
         <td>Connection error occurred in Android framework. The error message from the framework is appended to the value of extra field.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_THERE_IS_NO_DESTINATION_ON_PEER CAUSE_THERE_IS_NO_DESTINATION_ON_PEER}</td>
         <td>The intent is not resolvable on the peer device. {@link #sendBroadcastOnPeer(IPeerIntent, IPeerIntent) sendBroadcastOnPeer()} does not broadcast any callback with this kind of cause.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_EXCEPTION_IS_THROWN_ON_PEER CAUSE_EXCEPTION_IS_THROWN_ON_PEER}</td>
         <td>{@link android.content.Context#startActivity(android.content.Intent) startActivity()}, {@link android.content.Context#sendBroadcast(android.content.Intent) sendBroadcast()} or {@link android.content.Context#startService(android.content.Intent) startService()} throws an exception. The error message is appended to the value of extra field.</td>
       </tr>
       </table>
     * @see android.content.Context#startActivity(android.content.Intent)
     */
    void startActivityOnPeer(IPeerIntent intent, IPeerIntent callbackIntent);

    /**
     * Sends broadcast on the peer device with given peer intent.<P>


     * In case of {@link #sendBroadcastOnPeer(IPeerIntent, IPeerIntent) sendBroadcastOnPeer()}, the intent is not checked if any broadcast receiver is able to
     * receive the intent on the peer device. It means the intent may not be received by any broadcast
     * receiver on the peer device and no callbackIntent is broadcast to the local device.
     *
     * @param intent 	A peer intent for creating {@link android.content.Intent} which will
     * be used for sending broadcast <b>on the peer device</b>.
     * @param callbackIntent 	An Intent for callback. <BR> This intent will be broadcast to <b>
     * the local device</b> if the request fails to process. It could be null.
     * callbackIntent has an extra field with name {@link com.lge.qpair.api.r1.QPairConstants#EXTRA_CAUSE QPairConstants.EXTRA_CAUSE} and type String.
     * Each value in the extra field represents the following meaning.
     * <table>
       <tr>
         <th>Value</th>
         <th>Meaning</th>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_QPAIR_IS_OFF CAUSE_QPAIR_IS_OFF}</td>
         <td>QPair is currently off.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_QPAIR_HAVE_INTERNAL_ERROR CAUSE_QPAIR_HAVE_INTERNAL_ERROR}</td>
         <td>QPair got internal error.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_CONNECTION_IS_NOT_AVAILABLE CAUSE_CONNECTION_IS_NOT_AVAILABLE}</td>
         <td>Connection to the peer device is not available. The most possible reason is that Bluetooth does not turn on.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_CONNECTION_IS_NOT_ESTABLISHED CAUSE_CONNECTION_IS_NOT_ESTABLISHED}</td>
         <td>Connection to the peer device is not established. The most possible reason is that the peer device is not close enough to the local device.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_CONNECTION_IS_NOT_STABLE CAUSE_CONNECTION_IS_NOT_STABLE}</td>
         <td>Connection to peer device is not stable enough to communicate.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_CONNECTION_SPIT_ERROR CAUSE_CONNECTION_SPIT_ERROR}</td>
         <td>Connection error occurred in Android framework. The error message from the framework is appended to the value of extra field.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_THERE_IS_NO_DESTINATION_ON_PEER CAUSE_THERE_IS_NO_DESTINATION_ON_PEER}</td>
         <td>The intent is not resolvable on the peer device. {@link #sendBroadcastOnPeer(IPeerIntent, IPeerIntent) sendBroadcastOnPeer()} does not broadcast any callback with this kind of cause.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_EXCEPTION_IS_THROWN_ON_PEER CAUSE_EXCEPTION_IS_THROWN_ON_PEER}</td>
         <td>{@link android.content.Context#startActivity(android.content.Intent) startActivity()}, {@link android.content.Context#sendBroadcast(android.content.Intent) sendBroadcast()} or {@link android.content.Context#startService(android.content.Intent) startService()}
         throws an exception. The error message is appended to the value of extra field.</td>
       </tr>
       </table>
     * @see android.content.Context#sendBroadcast(android.content.Intent)
     */
    void sendBroadcastOnPeer(IPeerIntent intent, IPeerIntent callbackIntent);

    /**
     * Starts a service on peer device with given peer intent.<P>
     *
     * @param intent 	A peer intent for creating {@link android.content.Intent} which will
     * be used for starting service <b>on the peer device</b>.
     * @param callbackIntent 	An Intent for callback. <BR> This intent will be broadcast to <b>
     * the local device</b> if the request fails to process. It could be null.
     * callbackIntent has an extra field with name {@link com.lge.qpair.api.r1.QPairConstants#EXTRA_CAUSE QPairConstants.EXTRA_CAUSE} and type String.
     * Each value in the extra data represents the following meaning.
     * <table>
       <tr>
         <th>Value</th>
         <th>Meaning</th>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_QPAIR_IS_OFF CAUSE_QPAIR_IS_OFF}</td>
         <td>QPair is currently off.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_QPAIR_HAVE_INTERNAL_ERROR CAUSE_QPAIR_HAVE_INTERNAL_ERROR}</td>
         <td>QPair got internal error.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_CONNECTION_IS_NOT_AVAILABLE CAUSE_CONNECTION_IS_NOT_AVAILABLE}</td>
         <td>Connection to the peer device is not available. The most possible reason is that Bluetooth does not turn on.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_CONNECTION_IS_NOT_ESTABLISHED CAUSE_CONNECTION_IS_NOT_ESTABLISHED}</td>
         <td>Connection to the peer device is not established. The most possible reason is that the peer device is not close enough to the local device.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_CONNECTION_IS_NOT_STABLE CAUSE_CONNECTION_IS_NOT_STABLE}</td>
         <td>Connection to peer device is not stable enough to communicate.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_CONNECTION_SPIT_ERROR CAUSE_CONNECTION_SPIT_ERROR}</td>
         <td>Connection error occurred in Android framework. The error message from the framework is appended to the value of extra field.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_THERE_IS_NO_DESTINATION_ON_PEER CAUSE_THERE_IS_NO_DESTINATION_ON_PEER}</td>
         <td>The intent is not resolvable on the peer device. {@link #sendBroadcastOnPeer(IPeerIntent, IPeerIntent) sendBroadcastOnPeer()} does not broadcast any callback with this kind of cause.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_EXCEPTION_IS_THROWN_ON_PEER CAUSE_EXCEPTION_IS_THROWN_ON_PEER}</td>
         <td>{@link android.content.Context#startActivity(android.content.Intent) startActivity()}, {@link android.content.Context#sendBroadcast(android.content.Intent) sendBroadcast()} or {@link android.content.Context#startService(android.content.Intent) startService()} 
         throws an exception. The error message is appended to the value of extra field.</td>
       </tr>
       </table>
     * @see android.content.Context#startService(android.content.Intent)
     */
    void startServiceOnPeer(IPeerIntent intent, IPeerIntent callbackIntent);

    /**
     * Starts a service on the peer device with given peer intent after transferring file. <P>
     * If {@link com.lge.qpair.api.r1.IPeerIntent#getScheme} is not "file", then the file is not sent.
     * If {@link com.lge.qpair.api.r1.IPeerIntent#getScheme} is "file", then the file obtained from
     * {@link com.lge.qpair.api.r1.IPeerIntent#getDataString() IPeerIntent.getDataString()} is transferred to the peer device.<BR> 
     * On the peer device, the file is saved on <code>
     * android.os.Environment.getExternalStorageDirectory().getAbolutePath()
     * + destinationFileName</code>. If it is not possible, the file is saved on an arbitrary
     * directory. The name of the saved file should be changed if there already exists a file with the same name.<BR>
     * <code>intent</code> is used to start a service, after the data URI is
     * replaced with the URI of transferred file on the peer device.
     *
     * @param intent 	A peer intent for creating {@link android.content.Intent} which will
     * be used for starting a service <b>on the peer device</b>.
     * @param destinationFileName 	the location to save the file. <BR>It is used to determine the path which the
     * transferred file is saved.
     * @param callbackIntent 	An Intent for callback. <BR> This intent will be broadcast to <b>
     * the local device</b> if the request fails to process. It could be null.
     * callbackIntent has an extra data with name {@link com.lge.qpair.api.r1.QPairConstants#EXTRA_CAUSE QPairConstants.EXTRA_CAUSE} and type String.
     * Each value in the extra data represents the following meaning.
     * <table>
       <tr>
         <th>Value</th>
         <th>Meaning</th>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_QPAIR_IS_OFF CAUSE_QPAIR_IS_OFF}</td>
         <td>QPair is currently off.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_QPAIR_HAVE_INTERNAL_ERROR CAUSE_QPAIR_HAVE_INTERNAL_ERROR}</td>
         <td>QPair got internal error.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_CONNECTION_IS_NOT_AVAILABLE CAUSE_CONNECTION_IS_NOT_AVAILABLE}</td>
         <td>Connection to the peer device is not available. The most possible reason is that Bluetooth does not turned on.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_CONNECTION_IS_NOT_ESTABLISHED CAUSE_CONNECTION_IS_NOT_ESTABLISHED}</td>
         <td>Connection to the peer device is not established. The most possible reason is that the peer device is not close enough to the local device.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_CONNECTION_IS_NOT_STABLE CAUSE_CONNECTION_IS_NOT_STABLE}</td>
         <td>Connection to peer device is not stable enough to communicate.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_CONNECTION_SPIT_ERROR CAUSE_CONNECTION_SPIT_ERROR}</td>
         <td>Connection error occurred in Android framework. The error message from the framework is appended to the value of extra field.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_THERE_IS_NO_DESTINATION_ON_PEER CAUSE_THERE_IS_NO_DESTINATION_ON_PEER}</td>
         <td>The intent is not resolvable on the peer device. {@link #sendBroadcastOnPeer(IPeerIntent, IPeerIntent) sendBroadcastOnPeer()} does not broadcast any callback with this kind of cause.</td>
       </tr>
       <tr>
         <td>{@link com.lge.qpair.api.r1.QPairConstants#CAUSE_EXCEPTION_IS_THROWN_ON_PEER CAUSE_EXCEPTION_IS_THROWN_ON_PEER}</td>
         <td>{@link android.content.Context#startActivity(android.content.Intent) startActivity()}, {@link android.content.Context#sendBroadcast(android.content.Intent) sendBroadcast()} or {@link android.content.Context#startService(android.content.Intent) startService()} 
         throws an exception. The error message is appended to the value of extra field.</td>
       </tr>
       </table>
     * @see android.content.Context#startService(android.content.Intent)
     */
    //TODO ��硫붿냼�쒖뿉�쒕쭔 �섏삱 ���덈뒗 cause �뺣━�댁꽌 異붽�
    void startServiceOnPeerWithFile(IPeerIntent intent, String destinationFileName, IPeerIntent callbackIntent);

}
