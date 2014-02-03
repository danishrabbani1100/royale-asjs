////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package org.apache.flex.utils
{
import flash.events.TimerEvent;
import flash.utils.Timer;

import org.apache.flex.events.Event;

//--------------------------------------
//  Events
//--------------------------------------

/**
 *  Dispatched as requested via the delay and
 *  repeat count parameters in the constructor.
 *  
 *  @langversion 3.0
 *  @playerversion Flash 10.2
 *  @playerversion AIR 2.6
 *  @productversion FlexJS 0.0
 */
[Event(name="timer", type="org.apache.flex.events.Event")]

/**
 *  The Timer class dispatches events based on a delay
 *  and repeat count.  
 *  
 *  @langversion 3.0
 *  @playerversion Flash 10.2
 *  @playerversion AIR 2.6
 *  @productversion FlexJS 0.0
 */
public class Timer extends flash.utils.Timer
{
    /**
     *  Constructor.
     * 
     *  @param Number delay The number of milliseconds 
     *  to wait before dispatching the event.
     *  @param int repeatCount The number of times to dispatch
     *  the event.  If 0, keep dispatching forever.
     *  
     *  @langversion 3.0
     *  @playerversion Flash 10.2
     *  @playerversion AIR 2.6
     *  @productversion FlexJS 0.0
     */
    public function Timer(delay:Number, repeatCount:int = 0)
    {
        super(delay, repeatCount);
		addEventListener("timer", interceptor, false, 9999);
    }

	private function interceptor(event:flash.events.Event):void
	{
		if (event is TimerEvent)
		{
			event.stopImmediatePropagation();
			dispatchEvent(new Event("timer"));
		}
	}
}
}
