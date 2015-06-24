import style = require('./style');
import attribute = require('./attribute');

/** internal interface representing attribute available when creating a domnode */
interface IHTMLElement {
	[key: string]: any;
	innerHTML?: string;
	className?: string[]|string;
	style?: {[key: string]: string|number};
}

/**
 * create a dom node and add given attributes
 * @param	type		type of the node to create (for instance, 'div')
 * @param	attributes	set of attributes to add to the new node
 * @return				a new domnode
 */
var create = function(type: string, attributes?: IHTMLElement): HTMLElement {
	var element = document.createElement(type);
	if (!attributes) { return element; }
	for (var attribute in attributes) {
		var value: any = attributes[attribute];
		if (attribute === 'className' && value instanceof Array) {
			value = value.join(' ');
		} else if (attribute === 'style') {
			style.set(element, value);
			continue;
		} else if (attribute === 'innerHTML') {
			element.innerHTML = value;
			continue;
		}
		attribute.set(element, attribute, value);
	}
	return element;
};

export = create;
