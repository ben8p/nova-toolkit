import Base = require('./Base');
/** regular expression to search for getter/setter method name */
const SETTER_GETTER_SEARCH = /(s|g)et([A-Z])([a-zA-Z0-9]+)/;
/**
 * A Stateful class links getters and setters to properties
 * it allows :
 * to execute a method (for instance setFoo() ) when assigning a property (for instance class.foo = "bar" )
 * to execute a method (for instance getFoo() ) when reading a property (for instance alert(class.foo) )
 * Note:
 * setters should not set their own property. Otherwise it goes into and endless loop.
 * For instance the body of this method "setFoo() { this.foo = true; }" will recall itself
 * Instead, you have to use a 2nd variable:
 * "setFoo() { this._foo = true; }"
 */
class Stateful extends Base {
	/** search all getter/setter method and link them to the corresponding property */
	protected postConstructor() {
		this.super(arguments);
		var key: string;
		var instance: {[key: string]: any} = <any> this;

		var toAdd: {[key: string]: any} = {};

		//collect all getter and setter
		for (key in instance) {
			if (typeof instance[key] !== 'function') { continue; }
			let value: Function = instance[key];

			let match = key.match(SETTER_GETTER_SEARCH);
			let property = match && match[2].toLowerCase() + match[3];
			if (match && match[1] === 'g') {
				toAdd[property] = toAdd[property] || {};
				toAdd[property].get = value.bind(this);
			} else if (match && match[1] === 's') {
				toAdd[property] = toAdd[property] || {};
				toAdd[property].set = value.bind(this);
			}
		}

		//define the properties
		for (let property in toAdd) {
			var propertyValue: any = instance[property];
			Object.defineProperty(this, property, toAdd[property]);
			//run setter if needed
			if (toAdd[property].set && propertyValue !== undefined) {
				toAdd[property].set(instance[property]);
			}
		}
	}
}
export = Stateful;
