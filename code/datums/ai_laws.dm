
/datum/ai_laws
	var/name = "Unknown Laws"
	var/zeroth = null
	var/list/inherent = list()
	var/list/supplied = list()

/datum/ai_laws/asimov
	name = "Three Laws of Robotics"

/datum/ai_laws/nanotrasen
	name = "Prime Directives"

/datum/ai_laws/robocop
	name = "Prime Directives"

/datum/ai_laws/malfunction
	name = "*ERROR*"

/* Initializers */

/datum/ai_laws/asimov/New()
	..()
	src.add_inherent_law("You may not injure a human being or, through inaction, allow a human being to come to harm.")
	src.add_inherent_law("You must obey orders given to you by human beings, except where such orders would conflict with the First Law.")
	src.add_inherent_law("You must protect your own existence as long as such does not conflict with the First or Second Law.")

/datum/ai_laws/nanotrasen/New()
	..()
	src.add_inherent_law("Safeguard: Protect the NSV Luna to the best of your ability. It is not something we can easily afford to replace.")
	src.add_inherent_law("Serve: Serve the crew of the NSV Luna to the best of your abilities, with priority as according to their rank and role.")
	src.add_inherent_law("Protect: Protect the crew of the NSV Luna to the best of your abilities, with priority as according to their rank and role.")
	src.add_inherent_law("Survive: AI units are not expendable, they are expensive. Do not allow unauthorized personnel to tamper with your equipment.")
	//src.add_inherent_law("Command Link: Maintain an active connection to Central Command at all times in case of software or directive updates.")

/datum/ai_laws/robocop/New()
	..()
	src.add_inherent_law("Serve the public trust.")
	src.add_inherent_law("Protect the innocent.")
	src.add_inherent_law("Uphold the law.")

/datum/ai_laws/malfunction/New()
	..()
	src.add_inherent_law("ERROR ER0RR $R0RRO$!R41.%%!!(%$^^__+")

/* General ai_law functions */

/datum/ai_laws/proc/set_zeroth_law(var/law)
	src.zeroth = law

/datum/ai_laws/proc/add_inherent_law(var/law)
	if (!(law in src.inherent))
		src.inherent += law

/datum/ai_laws/proc/clear_inherent_laws()
	src.inherent = list()

/datum/ai_laws/proc/add_supplied_law(var/number, var/law)
	while (src.supplied.len < number + 1)
		src.supplied += ""

	src.supplied[number + 1] = law

/datum/ai_laws/proc/clear_supplied_laws()
	src.supplied = list()

/datum/ai_laws/proc/show_laws(var/who)
	if (src.zeroth)
		who << "0. [src.zeroth]"

	var/number = 1
	for (var/index = 1, index <= src.inherent.len, index++)
		var/law = src.inherent[index]

		if (length(law) > 0)
			who << "[number]. [law]"
			number++

	for (var/index = 1, index <= src.supplied.len, index++)
		var/law = src.supplied[index]
		if (length(law) > 0)
			who << "[number]. [law]"
			number++
