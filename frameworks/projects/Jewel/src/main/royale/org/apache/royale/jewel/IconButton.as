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
package org.apache.royale.jewel
{
    COMPILE::JS
    {
        import org.apache.royale.core.WrappedHTMLElement;
        import org.apache.royale.html.util.addElementToWrapper;
    }

    import org.apache.royale.core.IIconSupport;
    import org.apache.royale.core.IIcon;
    
    public class IconButton extends Button implements IIconSupport
	{
        /**
         *  Constructor.
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion Royale 0.9.4
         */
		public function IconButton()
		{
			super();
		}

        COMPILE::JS
        protected var textNode:Text;

        COMPILE::JS
        private var _text:String = "";

        [Bindable("textChange")]
        /**
         *  @copy org.apache.royale.html.Label#text
         *
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion Royale 0.9.4
         */
        COMPILE::JS
		override public function get text():String
		{
            return _text;
		}

        /**
         *  @private
         */
        COMPILE::JS
		override public function set text(value:String):void
		{
            if (textNode)
            {
                _text = value;
                textNode.nodeValue = value;
                this.dispatchEvent('textChange');
            }
		}

        private var _icon:IIcon;
        /**
		 *  The icon to use with the button.
         *  Optional
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.4
		 */
        public function get icon():IIcon
        {
            return _icon;
        }
        public function set icon(value:IIcon):void
        {
            _icon = value;

            var iconClass:String = "icon";
            if(text != "")
            {
                iconClass += "WithSpace";
            }

            toggleClass(iconClass, (_icon != null));
            
            COMPILE::JS
            {
                // insert the icon before the text
                addElementAt(_icon, 0);
            }

            COMPILE::SWF
            {
                classSelectorList.toggle("icon", (_icon != null));
                // todo set up icon on swf
            }
        }

        /**
		 * @royaleignorecoercion org.apache.royale.core.WrappedHTMLElement
		 * @royaleignorecoercion org.apache.royale.html.util.addElementToWrapper
         */
        COMPILE::JS
        override protected function createElement():WrappedHTMLElement
        {
			addElementToWrapper(this, 'button');
            element.setAttribute('type', 'button');
            
            textNode = document.createTextNode(_text) as Text;
            element.appendChild(textNode);

            positioner = element;

            return element;
        }
	}
}