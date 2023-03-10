/obj/item/key
	name = "key"
	desc = "Used to unlock things."
	icon = 'icons/obj/items.dmi'
	icon_state = "keys"
	drop_sound = 'sound/items/drop/ring.ogg'
	pickup_sound = 'sound/items/pickup/ring.ogg'
	w_class = ITEMSIZE_TINY
	var/key_data = ""

/obj/item/key/New(var/newloc,var/data)
	if(data)
		key_data = data
	..(newloc)

/obj/item/key/proc/get_data(var/mob/user)
	return key_data

/obj/item/key/soap
	name = "soap key"
	desc = "a fragile key made using a bar of soap."
	var/uses = 0

/obj/item/key/soap/get_data(var/mob/user)
	uses--
	if(uses <= 0)
		user.drop_from_inventory(src,user)
		to_chat(user, "<span class='warning'>\The [src] crumbles in your hands!</span>")
		qdel(src)
	return ..()
