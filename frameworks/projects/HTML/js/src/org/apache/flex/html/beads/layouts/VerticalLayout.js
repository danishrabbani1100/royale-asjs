/**
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

goog.provide('org_apache_flex_html_beads_layouts_VerticalLayout');

goog.require('org_apache_flex_core_IBeadLayout');



/**
 * @constructor
 * @implements {org_apache_flex_core_IBeadLayout}
 */
org_apache_flex_html_beads_layouts_VerticalLayout =
    function() {
  this.strand_ = null;
  this.className = 'VerticalLayout';
};


/**
 * Metadata
 *
 * @type {Object.<string, Array.<Object>>}
 */
org_apache_flex_html_beads_layouts_VerticalLayout.prototype.FLEXJS_CLASS_INFO =
    { names: [{ name: 'VerticalLayout',
                qName: 'org_apache_flex_html_beads_layouts_VerticalLayout'}],
      interfaces: [org_apache_flex_core_IBeadLayout] };


Object.defineProperties(org_apache_flex_html_beads_layouts_VerticalLayout.prototype, {
    /** @export */
    strand: {
        /** @this {org_apache_flex_html_beads_layouts_VerticalLayout} */
        set: function(value) {
            if (this.strand_ !== value) {
              this.strand_ = value;
            }
        }
    }
});


/**
 */
org_apache_flex_html_beads_layouts_VerticalLayout.
    prototype.layout = function() {
  var children, i, n;

  children = this.strand_.internalChildren();
  n = children.length;
  for (i = 0; i < n; i++)
  {
    var child = children[i];
    child.internalDisplay = 'block';
    if (child.style.display === 'none') {
      child.lastDisplay_ = 'block';
    } else {
      child.style.display = 'block';
    }
    child.flexjs_wrapper.dispatchEvent('sizeChanged');
  }
};
