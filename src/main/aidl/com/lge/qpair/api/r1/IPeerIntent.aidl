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
 * The <code>IPeerIntent</code> implements an intent which does something on the peer device.<P>
 * Most of methods of <code>IPeerIntent</code> are similar to those of {@link android.content.Intent} except the target the intent is run on.<BR>
 * <h4>How to get IPeerIntent</h4>
 * <ol>
 * <li>Bind IPeerContext service.
 * <li>Get an interface of IPeerContext service 
 * <li>Make an instance of IPeerIntent by calling newPeerIntent()
 * </ol> 
 * <p>
 * <pre>
 * <code>
 * public void onServiceConnected(ComponentName name, IBinder service) {
 *     iPeerContext = IPeerContext.Stub.asInterface(service);
 *     ...
 *     IPeerIntent i = iPeerContext.newPeerIntent();
 * }
 * </code></pre>
 * <P>
 * @see android.content.Intent
 */

interface IPeerIntent {

	/**
     * Retrieves the general action to be performed, such as
     * <code>ACTION_VIEW</code>. <P>
     * The action describes the general way the rest of
     * the information in the intent should be interpreted.
     *
     * @return The action of this intent or null if none is specified.
     * @see #setAction(String action)
     */
    String getAction();
    
	/**
     * Sets the general action to be performed.
     *
     * @param action An action name, such as <code>ACTION_VIEW</code>. <BR>Application-specific
     *               actions should be prefixed with the vendor's package name.
     */
    void setAction(String action);

	/**
     * Retrieves data this intent is operating on. <P> This URI specifies the name
     * of the data; often it uses the content: scheme, specifying data in a
     * content provider.  Other schemes may be handled by specific activities,
     * such as http: by the web browser.
     *
     * @return the URI of the data as an encoded <code>String</code>.
     */
    String getDataString();
    
    /**
     * Returns the scheme portion of the intent's data.<P> 
     *
     * If the data is null or does not include a scheme, null is returned. Otherwise, the scheme prefix without the final ':' is returned, i.e. "http".
     * @return The scheme of this intent.
     */
    String getScheme();
    
    /**
     * Sets the data this intent is operating on. <P> This method automatically
     * clears any type that was previously set by {@link #setType(String type) setType()}.
     *
     * @param data 	The URI of the data this intent is now targeting.<BR>
     *        data is accepted as a {@link String} whereas {@link android.content.Intent} accepts it as a URI.
     */
    void setData(String data);
    
    /**
     * Normalizes and sets the data this intent is operating on.<P>
     *
     * This method automatically clears any type that was
     * previously set for example, by {@link #setType setType()}.<BR>
     *
     * The data URI is normalized using
     * {@link android.net.Uri#normalizeScheme()} before it is set,
     * so really this is just a convenience method for {@link #setData(String type) setData(data.normalize())}.
     *
     * @param data 	The URI of the data this intent is now targeting.<BR>
     *        data is accepted as a {@link String} whereas {@link android.content.Intent} accepts it as a URI.
     */
    void setDataAndNormalize(String data);    

	/**
     * (Usually optional) Sets the data for the intent along with an explicit
     * MIME data type.  <P>This method should very rarely be used -- it allows you
     * to override the MIME type that would ordinarily be inferred from the
     * data with your own type given here.<P>
     *
     * Note: MIME type and URI scheme matching in the
     * Android framework is case-sensitive, unlike the formal RFC definitions.
     * As a result, you should always write these elements with lower case letters,
     * or use {@link android.content.Intent#normalizeMimeType Intent.normalizeMimeType(String)} or 
     * {@link android.net.Uri#normalizeScheme()} or {@link #setDataAndTypeAndNormalize setDataAndTypeAndNormalize(String, String)}
     * to ensure that they are converted to lower cases.
     *
     * @param data 	The Uri of the data this intent is now targeting.<BR>
     *        data is accepted as a {@String} whereas {@link android.content.Intent} accepts it as a URI.
     * @param type The MIME type of the data being handled by this intent.
     */
    void setDataAndType(String data, String type);
    

    /**
     * (Usually optional) Normalizes and sets both the data URI and an explicit
     * MIME data type.<P>  This method should very rarely be used -- it allows you
     * to override the MIME type that would ordinarily be inferred from the
     * data with your own type given here.<P>
     *
     * The data URI and the MIME type are normalize using
     * {@link android.net.Uri#normalizeScheme()} and {@link android.content.Intent#normalizeMimeType Intent.normalizeMimeType(String)}
     * before they are set, so this is just a convenience method for
     * {@link #setDataAndType setDataAndType(data.normalize(), Intent.normalizeMimeType(type))}
     *
     * @param data The URI of the data this intent is now targeting.
     * @param type The MIME type of the data being handled by this intent.
     */
    void setDataAndTypeAndNormalize(String data, String type);

	/**
     * Retrieves the concrete component associated with the intent.<P>
     * When receiving
     * an intent, this is the component that was found to best handle it (that is,
     * yourself) and will always be non-null; in all other cases it will be null unless explicitly set.<P>
     *
     * Note: This returns a {@link String} for the component whereas the {@link android.content.Intent#getComponent()} returns {@link android.content.ComponentName}.
     *
     * @return The name of the application component String to handle the intent.
     * @see #setComponent
     */
    String getComponentString();
    
   	/**
     * Convenience for calling {@link #setComponent setComponent()} with an
     * explicit application package name and class name.
     *
     * @param packageName The name of the package implementing the desired
     * component.
     * @param className The name of a class inside of the application package
     * that will be used as the component for this Intent.
     */
    void setClassName(String packageName, String className);
    
    /**
     * (Usually optional) Explicitly sets the component to handle the intent.<P>
     * If left with the default value of null, the system will determine the
     * appropriate class to use based on the other fields (action, data,
     * type, categories) in the Intent. <BR>If this class is defined, the
     * specified class will always be used regardless of the other fields. <BR>You
     * should only set this value when you know you absolutely want a specific
     * class to be used; otherwise it is better to let the system find the
     * appropriate class so that you will respect the installed applications
     * and user preferences.
     *
     * @param component The name of the application component to handle the
     * intent, or null to let the system find one for you.
     * component is accepted as a {@link String} whereas {@link android.content.Intent}
     * accepts it as a {@link android.content.ComponentName}.
     */
    void setComponent(String component);


	/**
     * Retrieves any special flags associated with this intent. <P>
     * You will normally just set them with {@link #setFlags setFlags()} and let the system
     * take the appropriate action with them.
     * @return The currently set flags.
     */
    int getFlags();
    
    /**
     * Adds additional flags to the intent (or with existing flags value).<P>
     * 
     * The {@link android.content.Intent#FLAG_ACTIVITY_NEW_TASK} flag is automatically set for activity intents.
     *
     * @param flags The new flags to set.
     * 
     * @see android.content.Intent
     */
    void addFlags(int flags);
    
    /**
     * Sets special flags controlling how this intent is handled. <P> Most values
     * here depend on the type of component being executed by the Intent,
     * specifically the FLAG_ACTIVITY_* flags are all for use with {@link com.lge.qpair.api.r1.IPeerContext#startActivityOnPeer IPeerContext.startActivityOnPeer()} and the
     * FLAG_RECEIVER_* flags are all for use with {@link com.lge.qpair.api.r1.IPeerContext#sendBroadcastOnPeer IPeerContext.sendBroadcastOnPeer()}.<BR>
     *
     * The {@link android.content.Intent#FLAG_ACTIVITY_NEW_TASK} flag is automatically set for activity intents.
     *
     * @param flags The desired flags.
     * 
     * @see android.content.Intent
     */
    void setFlags(int flags);

	/**
     * Retrieves any explicit MIME type included in the intent.<P>This is usually
     * null, as the type is determined by the intent data.
     *
     * @return If a type was manually set, it is returned; else null is
     *         returned.
     */
    String getType();
    
    /**
     * Sets an explicit MIME data type.<P>
     *
     * This is used to create intents that only specify a type and not data,
     * for example to indicate the type of data to return.<P>
     *
     * This method automatically clears the data that was
     * previously set for example by {@link #setData setData()}.<P>
     *
     * Note: MIME type matching in the Android framework is
     * case-sensitive, unlike formal RFC MIME types.  As a result,
     * you should always write your MIME types with lower case letters,
     * or use {@link android.content.Intent#normalizeMimeType normalizeMimeType()}
     * or {@link #setTypeAndNormalize setTypeAndNormalize(String)}
     * to ensure that it is converted to lower case.
     *
     * @param type The MIME type of the data being handled by this intent.
     */
    void setType(String type);
    
    /**
     * Normalizes and sets an explicit MIME data type.<P>
     *
     * This is used to create intents that only specify a type and not data,
     * for example to indicate the type of data to return.<P>
     *
     * This method automatically clears any data that was
     * previously set for example by {@link #setData setData()}.<P>
     *
     * The MIME type is normalized using {@link android.content.Intent#normalizeMimeType Intent.normalizeMimeType()} before it is set,
     * so really this is just a convenience method for
     * {@link #setType setType(Intent.normalizeMimeType(type))}.
     *
     * @param type The MIME type of the data being handled by this intent.
     */
    void setTypeAndNormalize(String type);

	/**
     * Retrieves the application package name this Intent is limited to.<P>  When
     * resolving an Intent, if non-null, this limits the resolution to only
     * components in the given application package.
     *
     * @return The name of the application package for the Intent.
     */
    String getPackage();
    
    /**
     * (Usually optional) Sets an explicit application package name that limits
     * the components this Intent will resolve to.<P> If left with the default
     * value of null, all components in all applications will considered.<BR>
     * If non-null, the Intent can only match the components in the given
     * application package.
     *
     * @param packageName The name of the application package to handle the
     * intent, or null to allow any application package.
     */
    void setPackage(String packageName);

	/**
     * Returns the list of all categories in the intent.<P>
     * If there are no categories, returns null.  
     *
     * @return The <code>List</code> of categories you can examine.
     */
    List<String> getCategories();
    
    /**
     * Adds a new category to the intent.<P>  Categories provide additional detail
     * about the action the intent performs.  When resolving an intent, only
     * activities that provide all of the requested categories will be used.
     *
     * @param category The desired category.<BR>This can be either one of the
     *               predefined {@link android.content.Intent} categories, or a custom category in your own
     *               namespace.
	 * 
     * @see android.content.Intent
     */
    void addCategory(String category);
    
    /**
     * Removes a category from an intent.
     *
     * @param category The category to remove.
     */
    void removeCategory(String category);

	/**
     * Adds extended data in a boolean array to the intent.<P>The name must include a package
     * prefix, for example the app com.android.contacts would use names
     * like "com.android.contacts.ShowAll".
     *
     * @param name The name of the extra data, with package prefix.
     * @param value The boolean array data value.
     */
    void putBooleanArrayExtra(String name, in boolean[] value);
    
    /**
     * Adds extended data in boolean to the intent.<P> The name must include a package
     * prefix, for example the app com.android.contacts would use names
     * like "com.android.contacts.ShowAll".
     *
     * @param name The name of the extra data, with package prefix.
     * @param value The boolean data value.
     */
    void putBooleanExtra(String name, boolean value);

	/**
     * Adds extended data in a byte array to the intent.<P>  The name must include a package
     * prefix, for example the app com.android.contacts would use names
     * like "com.android.contacts.ShowAll".
     *
     * @param name The name of the extra data, with package prefix.
     * @param value The byte array data value.
     */
    void putByteArrayExtra(String name, in byte[] value);
    
    /**
     * Adds extended data in byte to the intent.<P>The name must include a package
     * prefix, for example the app com.android.contacts would use names
     * like "com.android.contacts.ShowAll".
     *
     * @param name The name of the extra data, with package prefix.
     * @param value The byte data value.
     */
    void putByteExtra(String name, byte value);

	/**
     * Adds extended data in char array to the intent. <P>The name must include a package
     * prefix, for example the app com.android.contacts would use names
     * like "com.android.contacts.ShowAll".
     *
     * @param name The name of the extra data, with package prefix.
     * @param value The char array data value.
     */
    void putCharArrayExtra(String name, in char[] value);
    
    /**
     * Adds extended data in char to the intent. <P>The name must include a package
     * prefix, for example the app com.android.contacts would use names
     * like "com.android.contacts.ShowAll".
     *
     * @param name The name of the extra data, with package prefix.
     * @param value The char data value.
     */
    void putCharExtra(String name, char value);

	/**
     * Adds extended data in char sequence to the intent.<P> The name must include a package
     * prefix, for example the app com.android.contacts would use names
     * like "com.android.contacts.ShowAll".
     *
     * @param name The name of the extra data, with package prefix.
     * @param value The CharSequence data value.
     */
    void putCharSequenceExtra(String name, CharSequence value);

	/**
     * Adds extended data in a double array to the intent.<P>The name must include a package
     * prefix, for example the app com.android.contacts would use names
     * like "com.android.contacts.ShowAll".
     *
     * @param name The name of the extra data, with package prefix.
     * @param value The double array data value.
     */
    void putDoubleArrayExtra(String name, in double[] value);
    
    /**
     * Adds extended data in double to the intent. <P>The name must include a package
     * prefix, for example the app com.android.contacts would use names
     * like "com.android.contacts.ShowAll".
     *
     * @param name The name of the extra data, with package prefix.
     * @param value The double data value.
     */
    void putDoubleExtra(String name, double value);

	/**
     * Adds extended data in a float array to the intent. <P>The name must include a package
     * prefix, for example the app com.android.contacts would use names
     * like "com.android.contacts.ShowAll".
     *
     * @param name The name of the extra data, with package prefix.
     * @param value The float array data value.
     */
    void putFloatArrayExtra(String name, in float[] value);
    
    /**
     * Adds extended data in float to the intent. <P>The name must include a package
     * prefix, for example the app com.android.contacts would use names
     * like "com.android.contacts.ShowAll".
     *
     * @param name The name of the extra data, with package prefix.
     * @param value The float data value.
     */
    void putFloatExtra(String name, float value);
	
	/**
     * Adds extended data in an int array to the intent. <P>The name must include a package
     * prefix, for example the app com.android.contacts would use names
     * like "com.android.contacts.ShowAll".
     *
     * @param name The name of the extra data, with package prefix.
     * @param value The int array data value.
     */
    void putIntArrayExtra(String name, in int[] value);
    
    /**
     * Adds extended data in int to the intent.<P> The name must include a package
     * prefix, for example the app com.android.contacts would use names
     * like "com.android.contacts.ShowAll".
     *
     * @param name The name of the extra data, with package prefix.
     * @param value The int data value.
     */
    void putIntExtra(String name, int value);
	
	/**
     * Adds extended data in a long array to the intent.<P>  The name must include a package
     * prefix, for example the app com.android.contacts would use names
     * like "com.android.contacts.ShowAll".
     *
     * @param name The name of the extra data, with package prefix.
     * @param value The long array data value.
     */
    void putLongArrayExtra(String name, in long[] value);
    
    /**
     * Adds extended data in long to the intent. <P>The name must include a package
     * prefix, for example the app com.android.contacts would use names
     * like "com.android.contacts.ShowAll".
     *
     * @param name The name of the extra data, with package prefix.
     * @param value The long data value.
     */
    void putLongExtra(String name, long value);
	
	/**
     * Adds extended data in a string array to the intent. <P>The name must include a package
     * prefix, for example the app com.android.contacts would use names
     * like "com.android.contacts.ShowAll".
     *
     * @param name The name of the extra data, with package prefix.
     * @param value The String array data value.
     */
    void putStringArrayExtra(String name, in String[] value);
    
    /**
     * Adds extended data in a string list to the intent.<P>  The name must include a package
     * prefix, for example the app com.android.contacts would use names
     * like "com.android.contacts.ShowAll".
     *
     * @param name The name of the extra data, with package prefix.
     * @param value The List<String> data value.
     */
    void putStringArrayListExtra(String name, in List<String> value);
    
    /**
     * Adds extended data in string to the intent. <P>The name must include a package
     * prefix, for example the app com.android.contacts would use names
     * like "com.android.contacts.ShowAll".
     *
     * @param name The name of the extra data, with package prefix.
     * @param value The String data value.
     */
    void putStringExtra(String name, String value);
    
	/**
     * Removes extended data from the intent.
     */
    void removeExtra(String name);

    /**
     * Returns a <code>String</code> that represents this intent.
     */
    String toStringInDetail();
}
