/// @description Insert description here
// You can write your code in this editor

this_machine = (instance_find(obj_machine,0));
if (this_machine != noone){
	switch(this_machine.status){
		case "empty":
			which_text = 0;
			break;
		case "busy":
			which_text = 1;
			break;
		case "full":
			which_text = 2;
			break;
		case "broken":
			which_text = 3;
			break;
	}
}